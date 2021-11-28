import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite/tflite.dart';
import 'package:torch_compat/torch_compat.dart';

import 'chat.dart';

class Pagee extends StatefulWidget {
  final CameraDescription camera;
  const Pagee({
    Key key,
    @required this.camera,
  }) : super(key: key);
  @override
  _PageeState createState() => _PageeState();
}

class _PageeState extends State<Pagee> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    TorchCompat.dispose();
    super.dispose();
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Chat()));
                }),
          ]),

      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(
            child: Container(
              height: 180.0,
              width: 180.0,
              child: FittedBox(
                child: FloatingActionButton(
                  focusColor: Colors.green,
                  hoverColor: Colors.green,
                  splashColor: Colors.green,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.camera_alt),
                  // Provide an onPressed callback.
                  onPressed: () async {
                    // Take the Picture in a try / catch block. If anything goes wrong,
                    // catch the error.
                    try {
                      TorchCompat.turnOn();
                      // Ensure that the camera is initialized.
                      await _initializeControllerFuture;

                      // Construct the path where the image should be saved using the
                      // pattern package.
                      final path = join(
                        // Store the picture in the temp directory.
                        // Find the temp directory using the `path_provider` plugin.
                        (await getTemporaryDirectory()).path,
                        '${DateTime.now()}.png',
                      );

                      // Attempt to take a picture and log where it's been saved.
                      await _controller.takePicture(path);
                      TorchCompat.turnOff();

                      // If the picture was taken, display it on a new screen.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayPictureScreen(path),
                        ),
                      );
                    } catch (e) {
                      // If an error occurs, log the error to the console.
                      print(e);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  DisplayPictureScreen(this.imagePath);
  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  List op;
  Image img;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
    img = Image.file(File(widget.imagePath));
    classifyImage(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
//    Image img = Image.file(File(widget.imagePath));
//    classifyImage(widget.imagePath, total);

    return Scaffold(
      appBar: AppBar(
        title: Text('Display the Picture'),
        backgroundColor: Colors.green,
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Center(child: img)),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Future<void> runTextToSpeech(String outputMoney) async {
    FlutterTts flutterTts;
    flutterTts = new FlutterTts();

    if (outputMoney == "BAYER_LOGO") {
      String speakString = "Yes, this is a Bayer Product Logo";
      await flutterTts.setSpeechRate(0.8);
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.speak(speakString);
    }
    if (outputMoney == "FAKE_HOLOGRAM_LOGO") {
      String speakString = "No , this is not a Bayer Product Hologram";
      await flutterTts.setSpeechRate(0.8);
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.speak(speakString);
    }
    if (outputMoney == "HOLOGRAM") {
      String speakString = "Yes , this is a Bayer Product Hologram";
      await flutterTts.setSpeechRate(0.8);
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.speak(speakString);
    }
    if (outputMoney == "NOT_A_BAYER_LOGO") {
      String speakString = "NO , this is not a Bayer Product Logo";
      await flutterTts.setSpeechRate(0.8);
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.speak(speakString);
    }
  }

  classifyImage(String image) async {
    var output = await Tflite.runModelOnImage(
      path: image,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    op = output;

    if (op != null) {
      print(op[0]["label"]);
      if (op[0]["label"] == "BAYER_LOGO") {
        runTextToSpeech("BAYER_LOGO");
      }
      if (op[0]["label"] == "FAKE_HOLOGRAM_LOGO") {
        runTextToSpeech("FAKE_HOLOGRAM_LOGO");
      }
      if (op[0]["label"] == "HOLOGRAM") {
        runTextToSpeech("HOLOGRAM");
      }
      if (op[0]["label"] == "NOT_A_BAYER_LOGO") {
        runTextToSpeech("NOT_A_BAYER_LOGO");
      }
    } else
      runTextToSpeech("Not A bayer product");
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
