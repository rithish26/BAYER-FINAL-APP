import 'package:bayer/screens/disc.dart';
import 'package:bayer/searchservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String ans;

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  QuerySnapshot helloData;
  bool isInitilized = false;
  var queryResultSet = [];
  var tempsearchstore = [];
  initiateSearch() {
    print('hello');
    queryResultSet = [];
    tempsearchstore = [];

    FirebaseFirestore.instance
        .collection('DATA')
        .get()
        .then((QuerySnapshot docse) {
      for (int i = 0; i < docse.docs.length; ++i) {
        print('hello2');
        print(queryResultSet[i]);
        queryResultSet.add(docse.docs[i].data());
        setState(() {
          tempsearchstore.add(queryResultSet[i]);
        });
      }
    });
  }

  @override
  void initState() {
    FlutterMobileVision.start().then((value) {
      isInitilized = true;
    });
    print('hello');

    super.initState();
  }

  _startScan() async {
    List<OcrText> list = List();

    try {
      list = await FlutterMobileVision.read(
        waitTap: true,
        fps: 5,
        multiple: true,
      );

      for (OcrText text in list) {
        setState(() {
          ans = text.value;
        });
        print('valueis ${text.value}');
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: ans == null ? Text('Scan') : Text('{$ans'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('DATA')
                .where('name', isGreaterThanOrEqualTo: ans)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                padding:
                    EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
                children: snapshot.data.docs.map((grocery) {
                  return Center(
                    child: Card(
                      child: ListTile(
                        hoverColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: Colors.green,
                        focusColor: Colors.green,
                        leading: Icon(
                          Icons.work,
                          color: Colors.white,
                        ),
                        title: Text(
                          grocery['name'].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onTap: () {
                          print(grocery['ristrictionsg'].toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Disc(
                                      name: grocery['name'].toString(),
                                      abt: grocery['About'].toString(),
                                      app: grocery['Applicability'].toString(),
                                      dos: grocery['Dosage and Usage']
                                          .toString(),
                                      rist: grocery['Restrictions'].toString(),
                                      st: grocery[
                                              'Storage And Disposal Guidance']
                                          .toString(),
                                      nameh: grocery['nameh'],
                                      abth: grocery['abouth'],
                                      apph: grocery['applyh'],
                                      dosh: grocery['doseh'],
                                      risth: grocery['Resth'],
                                      sth: grocery['storageh'],
                                      nameg: grocery['nameg'],
                                      abtg: grocery['aboutg'],
                                      appg: grocery['applyg'],
                                      dosg: grocery['Dosg'],
                                      ristg:
                                          grocery['ristrictionsg'].toString(),
                                      stg: grocery['storageg'].toString(),
                                      refid: grocery['name'].toString(),
                                    )),
                          );
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 125.0,
        width: 125.0,
        child: FittedBox(
          child: FloatingActionButton(
            focusColor: Colors.green,
            hoverColor: Colors.green,
            splashColor: Colors.green,
            backgroundColor: Colors.green,
            onPressed: _startScan,
            tooltip: 'Increment',
            child: Icon(
              Icons.camera_alt_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget buildResultCard(BuildContext context, data) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: GestureDetector(
              child: ListTile(
                hoverColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 0.5),
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.blue[900],
                focusColor: Colors.green,
                leading: Icon(
                  Icons.work,
                  color: Colors.white,
                ),
                title: Text(
                  '',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () {}),
        ),
        SizedBox(
          height: 2.0,
        ),
      ],
    ),
  );
}
