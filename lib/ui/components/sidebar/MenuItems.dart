import 'package:flutter/material.dart';
import 'package:superPackage/ui/styles/Colors.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget> [
          Icon(icon, color: ColorsPalete.lightGrey, size: 30,),
        ],
      ),
    );
  }
}
