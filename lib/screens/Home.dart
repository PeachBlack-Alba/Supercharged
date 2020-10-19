import 'package:flutter/material.dart';
import 'package:superPackage/screens/MyAppBar.dart';


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
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: MyAppBar()),
        body: Container(),
      ),
    );
  }
}
