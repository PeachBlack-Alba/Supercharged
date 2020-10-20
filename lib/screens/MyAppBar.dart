import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superPackage/ui/styles/Colors.dart';
import 'package:supercharged/supercharged.dart';


class MyAppBar extends StatefulWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsPalete.primaryGrey,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: ColorsPalete.primaryGrey,
          ),
        ),
        title: Center(child: Text('Supercharged trial', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        ),
        leading:
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        iconTheme: IconThemeData(
            size: 30.0,
            color: Colors.black,
            opacity: 10.0
        ),
      ),
    );
  }
}
