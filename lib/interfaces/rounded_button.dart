import 'package:flutter/material.dart';
import 'package:planpoker/commons/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    this.press,
    this.textColor = Colors.white,
    @required this.color,
    @required this.text,
    @required this.size,
  });

  final String text;
  final Function press;
  final Color color;
  final Color textColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.5,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: kPrimaryDarkerColor,
          offset: Offset(0.0, 2),
          blurRadius: 15,
        ),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
