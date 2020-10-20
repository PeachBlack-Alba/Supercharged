import 'package:flutter/material.dart';
import 'package:superPackage/ui/styles/Colors.dart';
import 'package:supercharged/supercharged.dart';

import 'MyAppBar.dart';

class Dates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chunkedDays = DateTime.now()
        .until(11.days.fromNow())
        .chunked(2, fill: () => null)
        .toList();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: MyAppBar()),
      body: Container(
        color: ColorsPalete.primaryGrey,

        child: Column(
          children: chunkedDays.map(buildRow).toList(),
        ),
      ),
    );
  }

  Row buildRow(List<DateTime> datesInRow) {
    return Row(
      children: datesInRow.map((date) {
        return Expanded(
          child: date != null ? buildDateCard(date) : Container(),
        );
      }).toList(),
    );
  }

  Card buildDateCard(DateTime date) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text("${date.year}/${date.month}/${date.day}"),
      ),
    );
  }
}