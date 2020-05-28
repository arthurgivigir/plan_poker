import 'package:flutter/material.dart';
import 'package:planpoker/screens/register_room/components/body.dart';

class RegisterRoomScreen extends StatefulWidget {
  @override
  _RegisterRoomScreenState createState() => _RegisterRoomScreenState();
}

class _RegisterRoomScreenState extends State<RegisterRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
