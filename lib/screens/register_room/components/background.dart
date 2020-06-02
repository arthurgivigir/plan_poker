import 'package:flutter/material.dart';
import 'package:planpoker/commons/constants.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              kPrimaryLightColor.withAlpha(80),
              kPrimaryLighterColor.withAlpha(120)
            ]),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
        ],
      ),
    );
  }
}
