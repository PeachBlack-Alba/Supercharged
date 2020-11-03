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
        body: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: ColorsPalete.primaryBlack,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 80.0),
                    Text(
                      'Supercharged trial',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsPalete.lightGreen),
                    ),
                    SizedBox(height: 50.0,),
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
            ),
          ],
        ),
      ),
    );
  }
}
