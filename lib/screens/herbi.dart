import 'package:bayer/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'chat.dart';
import 'delivery.dart';
import 'feedback.dart';

class Herbi extends StatelessWidget {
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
        body: DefaultTextStyle.merge(
          style: const TextStyle(
            fontSize: 16.0,
            //fontFamily: 'monospace',
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ReadMoreText(
                    'Weeds can interfere with your crop growth and limit yield potential. Bayer’s herbicide portfolio utilizes multiple sites of action to help combat resistant grass and broadleaf weeds.',
                    style: TextStyle(color: Colors.black),
                    trimLines: 2,
                    colorClickableText: Colors.green,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '...Show more',
                    trimExpandedText: ' show less',
                  ),
                ),
                Center(
                    child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 180.0,
                          width: 180.0,
                          padding: EdgeInsets.only(
                            top: 50,
                            bottom: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Image.asset('assets/images/herbi1.png'),
                        ),
                        Column(
                          children: [
                            Text(
                              'New Roundup PowerMAX® 3 Herbicide',
                              style: TextStyle(
                                  color: Colors.green[800], fontSize: 13.0),
                            ),
                            Text('Weed control rooted in performance.'),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shadowColor: Colors.black,
                            onPrimary: Colors.green,
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodOrderPage(
                                        'herbi1.png', 'PowerMax3')));
                          },
                          child: Text(
                            'BUY',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 180.0,
                          width: 180.0,
                          padding: EdgeInsets.only(
                            top: 50,
                            bottom: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Image.asset('assets/images/herbi2.jpg'),
                        ),
                        Column(
                          children: [
                            Text(
                              'Roundup PowerMAX® Herbicide',
                              style: TextStyle(
                                  color: Colors.green[800], fontSize: 13.0),
                            ),
                            Text('Provides the powerful weed control '),
                            Text('you’ve come to trust.'),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shadowColor: Colors.black,
                            onPrimary: Colors.green,
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodOrderPage(
                                        'herbi2.jpg', 'Power Max')));
                          },
                          child: Text(
                            'BUY',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 180.0,
                          width: 180.0,
                          padding: EdgeInsets.only(
                            top: 50,
                            bottom: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Image.asset('assets/images/herbi3.jpg'),
                        ),
                        Column(
                          children: [
                            Text(
                              'Harness® Xtra Herbicide for Corn',
                              style: TextStyle(
                                  color: Colors.green[800], fontSize: 13.0),
                            ),
                            Text(
                                'More powerful grass and broadleaf weed control.'),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shadowColor: Colors.black,
                            onPrimary: Colors.green,
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodOrderPage(
                                        'herbi3.jpg', 'Harness xtra')));
                          },
                          child: Text(
                            'BUY',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 180.0,
                          width: 180.0,
                          padding: EdgeInsets.only(
                            top: 50,
                            bottom: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Image.asset('assets/images/herbi4.png'),
                        ),
                        Column(
                          children: [
                            Text(
                              'DiFlexx® DUO Herbicide for Corn',
                              style: TextStyle(
                                  color: Colors.green[800], fontSize: 13.0),
                            ),
                            Text(
                                'Give weeds the pounding they deserve next season.'),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shadowColor: Colors.black,
                            onPrimary: Colors.green,
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodOrderPage(
                                        'herbi4.png', 'DiFlexxDuo')));
                          },
                          child: Text(
                            'BUY',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
              ],
            ),
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
                            builder: (context) => feedbackapp('APP')));
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
