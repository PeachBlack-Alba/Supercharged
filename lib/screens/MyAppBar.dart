import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';


class MyAppBar extends StatefulWidget {
  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
   final red =  "#CAFAFE".toColor();

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: colorGreen,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: red,
          ),
        ),
        title: Center(child: Text('Animations here please', style: TextStyle(fontSize: 20, fontFamily: 'Play', fontWeight: FontWeight.bold, color: Colors.black),
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
