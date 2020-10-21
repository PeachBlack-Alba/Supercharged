import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Widget child;
  final Function press;
  final Color color, textColor;
  final double width;

  const RoundedButton(
      {Key key,
        this.text,
        this.child,
        this.press,
        this.color = const Color(0xFFcfcfcf),
        this.textColor = Colors.black,
        this.width = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: child ??
              Text(
                text,
                style: TextStyle(color: textColor),
              ),
        ),
      ),
    );
  }
}
