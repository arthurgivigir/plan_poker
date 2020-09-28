import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    this.text,
    this.textColor,
    this.color,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 25.0),
  });

  final String text;
  final Color textColor;
  final Color color;
  final Function onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      child: RaisedButton(
        elevation: 10.0,
        onPressed: onPressed,
        padding: EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: color,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
