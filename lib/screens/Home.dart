import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:superPackage/screens/MyAppBar.dart';
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
        appBar: AppBar(
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
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Dates Selection'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dates()),
                        );},
                    color: ColorsPalete.lightGrey,
                    splashColor: ColorsPalete.darkGrey,
                    textColor: Colors.black,
                  ),
                  RaisedButton(
                      child: Text('List'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListFilters()),
                        );},
                    color: ColorsPalete.lightGrey,
                    splashColor: ColorsPalete.darkGrey,
                    textColor: Colors.black,
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
