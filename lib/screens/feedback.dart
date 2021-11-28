import 'package:bayer/home.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../ocr.dart';
import 'chat.dart';

class feedbackapp extends StatefulWidget {
  String name;
  feedbackapp(this.name);
  @override
  _feedbackappState createState() => _feedbackappState();
}

class _feedbackappState extends State<feedbackapp> {
  TextEditingController idController = new TextEditingController();
  TextEditingController feedbackController = new TextEditingController();
  double r = 5;
  final _formKey = GlobalKey<FormState>();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'APP FEEDBACK',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              )),
              SizedBox(
                height: 40,
              ),
              RatingBar.builder(
                initialRating: 5,
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                      );
                    case 1:
                      return Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                      );
                    case 2:
                      return Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                      );
                    case 3:
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                      );
                    case 4:
                      return Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                      );
                  }
                },
                onRatingUpdate: (rating) {
                  r = rating;
                },
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
                      child: TextFormField(
                        controller: idController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Subject",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (val) {
                          return val.isEmpty || val.length < 3
                              ? "Enter Username 3+ characters"
                              : null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: Container(
                        child: TextFormField(
                          maxLines: 6,
                          controller: feedbackController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Feedback",
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (val) {
                            return val.isEmpty || val.length < 3
                                ? "Enter Username 3+ characters"
                                : null;
                          },
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 40,
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
                      textStyle:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
                  onPressed: () {},
                  child: MaterialButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('Feedback').add({
                        'Subject': idController.text,
                        'feedback': feedbackController.text,
                        'rating': r,
                        'productname': widget.name,
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => MyHomePage()));
                    },
                    child: Center(
                      child: Text(
                        ' Submit Feedback',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        //                        textAlign: ,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
