import 'package:flutter/material.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/interfaces/rounded_button.dart';

class UserBox extends StatelessWidget {
  const UserBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: new BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: new Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Admin',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        RoundedButton(
          size: size,
          color: kSecondaryLightColor,
          text: 'Selecionar sua carta',
          press: () => {},
        ),
      ],
    );
  }
}
