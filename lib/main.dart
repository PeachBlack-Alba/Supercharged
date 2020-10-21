import 'package:flutter/material.dart';
import 'package:superPackage/screens/Dates.dart';
import 'package:superPackage/screens/ListFilters.dart';
import 'screens/Home.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/Dates': (context) => Dates(),
       // '/List': (context) => ListFilters(),
      },
    );
  }
}
