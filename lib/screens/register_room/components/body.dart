import 'package:flutter/material.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/interfaces/rounded_button.dart';
import 'package:planpoker/screens/register_room/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Scrum PlanPoker',
            style: TextStyle(
              color: kPrimaryDarkColor,
              fontSize: 50,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Image(
                image: AssetImage(
                  'images/iconfinder_icon-82_667352.png',
                ),
                fit: BoxFit.fill,
                height: size.height * 0.2,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RoundedButton(
            text: 'Criar Sala',
            color: kPrimaryColor,
            textColor: Colors.white,
            press: () {},
          ),
          RoundedButton(
            text: 'Entrar na Sala',
            color: kSecondaryColor,
            textColor: Colors.white,
            press: () {},
          ),
        ],
      ),
    );
  }
}
