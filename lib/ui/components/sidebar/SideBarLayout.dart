import 'package:flutter/material.dart';
import 'package:superPackage/screens/Home.dart';
import 'SideBar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Home(),
          SideBar(),
        ],
      ),
    );
  }
}
