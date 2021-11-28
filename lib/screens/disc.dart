import 'package:bayer/screens/chat.dart';
import 'package:bayer/screens/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'delivery.dart';

class Disc extends StatefulWidget {
  String name;
  String abt;
  String app;
  String dos;
  String rist;
  String st;
  String nameh;
  String abth;
  String apph;
  String dosh;
  String risth;
  String sth;
  String nameg;
  String abtg;
  String appg;
  String dosg;
  String ristg;
  String stg;
  String refid;
  Disc({
    @required this.name,
    @required this.abt,
    @required this.app,
    @required this.dos,
    @required this.rist,
    @required this.st,
    @required this.nameh,
    @required this.abth,
    @required this.apph,
    @required this.dosh,
    @required this.risth,
    @required this.sth,
    @required this.nameg,
    @required this.abtg,
    @required this.appg,
    @required this.dosg,
    @required this.ristg,
    @required this.stg,
    @required this.refid,
  });
  @override
  _DiscState createState() => _DiscState();
}

class _DiscState extends State<Disc> {
  FlutterTts flutterTts = FlutterTts();
  String lang = 'english';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.green, title: Text('Info'), actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            onPrimary: Color(0xFFDCEDC8),
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          onPressed: () async {
            setState(() {
              lang = 'english';
            });
            String speakString =
                "${widget.name.toUpperCase()},About:${widget.abt},Applicability:${widget.app},Dosage and Usage:${widget.dos},Restriction:${widget.rist},Storage:${widget.st}";
            await flutterTts.setSpeechRate(0.5);
            await flutterTts.awaitSpeakCompletion(false);
            await flutterTts.setLanguage("en-US");
            await flutterTts.speak(speakString);
          },
          child: Text(
            'EN',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            onPrimary: Colors.white,
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          onPressed: () async {
            setState(() {
              lang = 'german';
            });
            String speakString =
                "${widget.nameg.toUpperCase()},Über:${widget.abtg},Anwendbarkeit:${widget.appg},Dosierung und Anwendung:${widget.dosg},Einschränkungen:${widget.ristg},Hinweise zur Lagerung und Entsorgung:${widget.stg}";
            await flutterTts.setSpeechRate(0.5);
            await flutterTts.awaitSpeakCompletion(false);
            await flutterTts.setLanguage("de-LI");
            await flutterTts.speak(speakString);
          },
          child: Text(
            'GE',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shadowColor: Colors.black,
            onPrimary: Colors.white,
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          onPressed: () async {
            setState(() {
              lang = 'hindi';
            });
            String speakString =
                "${widget.nameh.toUpperCase()},के बारे में:${widget.abth},प्रयोज्यता:${widget.apph},खुराक और उपयोग:${widget.dosh},प्रतिबंध:${widget.risth},भंडारण और निपटान मार्गदर्शन:${widget.sth}";
            await flutterTts.setSpeechRate(0.5);
            await flutterTts.awaitSpeakCompletion(false);
            await flutterTts.setLanguage("hi-IN");
            await flutterTts.speak(speakString);
          },
          child: Text(
            'HI',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
            icon: Icon(Icons.close),
            onPressed: () async {
              var result = await flutterTts.stop();
              /* if (result == 1) setState(() => flutterTts = flutterTts.stopped); */
            }),
      ]),
      body: SingleChildScrollView(
        child: lang == 'english'
            ? Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.green,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 5),
                              ],
                            ),
//                  color: Color(0xffE2E2E2),

                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    '${widget.name.toUpperCase()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                    softWrap: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 12),
                                    child: Text(
                                      'About:',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, bottom: 12),
                                    child: Text(
                                      '${widget.abt}',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 12),
                                    child: Text(
                                      'Applicability:',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, bottom: 12),
                                    child: Text(
                                      '${widget.app}',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 12),
                                    child: Text(
                                      'Dosage and Usage:',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, bottom: 12),
                                    child: Text(
                                      '${widget.dos}',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 12),
                                    child: Text(
                                      'Restriction:',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, bottom: 12),
                                    child: Text(
                                      '${widget.rist}',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 12),
                                    child: Text(
                                      'Storage',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, bottom: 12),
                                    child: Text(
                                      '${widget.st}',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                          primary: Colors.green,
                          textStyle: TextStyle(
                              fontSize: 38, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => feedbackapp(widget.refid)));
                        },
                        child: Center(
                          child: Text(
                            'Feedback',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                            //                        textAlign: ,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                          primary: Colors.green,
                          textStyle: TextStyle(
                              fontSize: 38, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Chat()));
                        },
                        child: Center(
                          child: Text(
                            'Complaints',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                            //                        textAlign: ,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            : lang == 'german'
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.green,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 5),
                                  ],
                                ),
//                  color: Color(0xffE2E2E2),

                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        '${widget.nameg.toUpperCase()}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                        softWrap: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'Über:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.abtg}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'Anwendbarkeit:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.appg}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'Dosierung und Anwendung :',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.dosg}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'Einschränkungen:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.ristg}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'Hinweise zur Lagerung und Entsorgung',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.stg}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 15.0,
                              primary: Colors.green,
                              textStyle: TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          feedbackapp(widget.refid)));
                            },
                            child: Center(
                              child: Text(
                                'Rückmeldung',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                                //                        textAlign: ,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 15.0,
                              primary: Colors.green,
                              textStyle: TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => Chat()));
                            },
                            child: Center(
                              child: Text(
                                'Beschwerden',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                                //                        textAlign: ,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.green,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 5),
                                  ],
                                ),
//                  color: Color(0xffE2E2E2),

                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        '${widget.nameh.toUpperCase()}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                        softWrap: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'के बारे में:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.abth}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'प्रयोज्यता:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.apph}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'खुराक और उपयोग:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.dosh}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'प्रतिबंध:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.risth}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, top: 12),
                                        child: Text(
                                          'भंडारण और निपटान मार्गदर्शन :',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 12),
                                        child: Text(
                                          '${widget.sth}',
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 15.0,
                              primary: Colors.green,
                              textStyle: TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          feedbackapp(widget.refid)));
                            },
                            child: Center(
                              child: Text(
                                'प्रतिक्रिया',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                                //                        textAlign: ,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 15.0,
                              primary: Colors.green,
                              textStyle: TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => Chat()));
                            },
                            child: Center(
                              child: Text(
                                'शिकायतों',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                                //                        textAlign: ,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
      ),
    );
  }
}
