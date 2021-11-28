
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../info.dart';

class page extends StatelessWidget {
  const page({Key key}) : super(key: key);

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
              IconButton(icon: Icon(Icons.chat), onPressed: null),
            ]),
        body: Container(
          child: Column(
            children: [
              Image.asset('assets/images/scan.jpeg',
                  width: 500, height: 350, fit: BoxFit.fill),
              Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue[800],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Info()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                      'Scan Object',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Container(
                      child: Text('need help?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 19.0))))
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
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('Search'),
                  onPressed: () {},
                ),
                IconButton(
                  tooltip: 'Favorite',
                  icon: const Icon(Icons.history),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
