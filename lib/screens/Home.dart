import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:superPackage/ui/components/RoundButton.dart';
import 'package:superPackage/ui/styles/Colors.dart';
import 'package:supercharged/supercharged.dart';

import 'Dates.dart';
import 'ListFilters.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*appBar: AppBar(
          backgroundColor: ColorsPalete.primaryGrey,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: ColorsPalete.primaryGrey,
            ),
          ),
          title: Center(
            child: Text(
              'Supercharged trial',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.menu_outlined,
            ),
          ),
          iconTheme:
              IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
        ),*/
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50),
                  Text(
                    'Supercharged trial',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  RoundedButton(
                    text: 'Dates',
                    width: 200.0,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dates()), );
                    },
                  ),
                  RoundedButton(
                    text: 'List',
                    width: 200.0,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListFilters()), );
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
