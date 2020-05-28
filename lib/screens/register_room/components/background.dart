import 'package:flutter/material.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/screens/register_room/components/draw_triangle.dart';

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
            colors: [Colors.white, Colors.white]),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: CustomPaint(
              size: Size(size.width, size.height / 2),
              painter: DrawTriangle(
                maxSizePercent: 0.6,
                color: kPrimaryDarkColor.withAlpha(180),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CustomPaint(
              size: Size(size.width, size.height / 2),
              painter: DrawTriangle(
                isInverted: true,
                maxSizePercent: 0.6,
                color: kSecondaryDarkColor.withAlpha(180),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
