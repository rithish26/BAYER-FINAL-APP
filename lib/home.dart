import 'package:bayer/screens/chat.dart';
import 'package:bayer/screens/feedback.dart';

import 'package:bayer/screens/herbi.dart';
import 'package:bayer/screens/insect.dart';

import 'package:bayer/screens/scan.dart';
import 'package:bayer/screens/scanee.dart';
import 'package:bayer/screens/user.dart';

import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

import 'ocr.dart';

class Home extends StatefulWidget {
  final CameraDescription camera;
  const Home({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              '                     Bayer',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Chat()));
                  }),
            ]),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: Colors.green,
                height: 70,
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              ListTile(
                title: const Text(
                  'Hologram Code scan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pagee(camera: widget.camera)),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              ListTile(
                title: const Text(
                  'Product Scan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              ListTile(
                title: const Text(
                  'Crop Prediction',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              ListTile(
                title: const Text(
                  'Crop Cultivation Guidance',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Container(
          decoration: new BoxDecoration(
            color: const Color(0xFFF1F8E9),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(children: [
                    Container(
                      height: 200.0,
                      width: 190.0,
                      padding: EdgeInsets.only(
                        top: 50,
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Image.asset('assets/images/herbi.png'),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Herbi()),
                          );
                        },
                        child: Text(
                          'Herbicides',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]),
                  Column(children: [
                    Container(
                      height: 200.0,
                      width: 180.0,
                      padding: EdgeInsets.only(
                        top: 50,
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Image.asset('assets/images/fungi.png'),
                    ),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          'Fungicides',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]),
                  /* Container(
                  height: 200.0,
                  width: 200.0,
                  padding: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/herbi.png'),
                  ),
                ), */
                ],
              ),
              Row(
                children: [
                  Column(children: [
                    Container(
                      height: 200.0,
                      width: 200.0,
                      padding: EdgeInsets.only(
                        top: 50,
                        left: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Image.asset('assets/images/insect.jpg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DemoApp()));
                      },
                      child: TextButton(
                          onPressed: null,
                          child: Text(
                            'Insecticides',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )
                  ]),
                  Column(children: [
                    Container(
                      height: 200.0,
                      width: 200.0,
                      padding: EdgeInsets.only(
                        top: 50,
                        left: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Image.asset('assets/images/harvest.jpg'),
                    ),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          'Harvest Aids',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]),
                  /* Container(
                  height: 200.0,
                  width: 200.0,
                  padding: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/herbi.png'),
                  ),
                ), */
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.green,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  tooltip: 'Open navigation menu',
                  icon: const Icon(Icons.feedback),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => feedbackapp('app')));
                  },
                ),
                IconButton(
                  tooltip: 'Favorite',
                  icon: const Icon(Icons.history),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => user()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
