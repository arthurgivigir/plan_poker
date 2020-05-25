import 'package:flutter/material.dart';
import 'package:planpoker/commons/constants.dart';

class CardFlip extends StatefulWidget {
  CardFlip({
    this.height,
    this.width,
    this.frontColor,
    this.backColor,
    this.numberCard,
  });

  final double width;
  final double height;
  final Color frontColor;
  final Color backColor;
  final int numberCard;

  @override
  _CardFlipState createState() => _CardFlipState();
}

class _CardFlipState extends State<CardFlip>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween(end: 1.0, begin: 0.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
        print(status);
      });
  }

  Widget frontCard() {
    return materialCard(
      Colors.red,
      Text(
        widget.numberCard.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
        ),
      ),
    );
  }

  Widget backCard() {
    return materialCard(
      Colors.orange,
      Icon(
        Icons.ac_unit,
        color: Colors.white,
        size: 50,
      ),
    );
  }

  Widget materialCard(Color color, Widget content) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Card(
        elevation: 20,
        color: color,
        child: Center(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(kPi),
            child: content,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateY(kPi * _animation.value),
      child: GestureDetector(
        onTap: () {
          if (_animationStatus == AnimationStatus.dismissed) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        },
        child: _animation.value <= 0.5 ? backCard() : frontCard(),
      ),
    );
  }
}
