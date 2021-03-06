import 'package:flutter/material.dart';
import 'package:superPackage/ui/components/sidebar/SideBar.dart';
import 'package:superPackage/ui/styles/Colors.dart';
import 'package:supercharged/supercharged.dart';

class Dates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chunkedDays = DateTime.now()
        .until(11.days.fromNow())
        .chunked(2, fill: () => null)
        .toList();

    return Scaffold(
      backgroundColor: ColorsPalete.primaryBlack,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Container(
                color: ColorsPalete.primaryBlack,
                child: Column(
                  children: chunkedDays.map(buildRow).toList(),
                ),
              ),
              SizedBox(height: 50.0),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 40.0,
                    width: 200.0,
                    margin: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorsPalete.lightGreen) ,
                      borderRadius: BorderRadius.circular(10.0,),
                      color: ColorsPalete.primaryBlack,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Back to main screen',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
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
