import 'package:flutter/material.dart';
import 'package:superPackage/models/People.dart';
import 'package:supercharged/supercharged.dart';
import 'MyAppBar.dart';
import 'package:superPackage/ui/styles/Colors.dart';

class ListFilters extends StatefulWidget {
  @override
  _ListFiltersState createState() => _ListFiltersState();
}

class _ListFiltersState extends State<ListFilters> {
  List<People> people = [
    People(
      name: 'Maria',
      age: 55,
      nationality: 'Spanish',
    ),
    People(
      name: 'MariaQuintanilla',
      age: 44,
      nationality: 'Mexican',
    ),
    People(
      name: 'Rocio',
      age: 20,
      nationality: 'Spanish',
    ),
    People(
      name: 'Lola',
      age: 35,
      nationality: 'Spanish',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: MyAppBar()),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text('sorting method now allows you sort data inside your processing flow:',style: TextStyle(fontSize: 20.0),),
          ),
          Center(
            child: Container(
              height:  200.0,
              width: 400.0,
              decoration: BoxDecoration(
                color: ColorsPalete.lightGrey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: Alignment(0.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: people
                    .filter((p) => p.age < 60)
                    .sortedByNum((p) => p.age)
                    .map((p) =>  Text("${p.name}  age: ${p.age}", style: TextStyle(fontSize: 20.0)))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
