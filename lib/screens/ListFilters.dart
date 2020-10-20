import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var persons = [
      Person(name: "Jake", age: 21),
      Person(name: "Aaron", age: 48),
      Person(name: "Berry", age: 14),
      Person(name: "Kyle", age: 32),
    ];

    return Column(
      children: persons
          .filter((p) => p.age < 40)
          .sortedByNum((p) => p.age)
          .map((p) => Text("${p.name} (age: ${p.age})"))
          .toList(),
    );
  }
}