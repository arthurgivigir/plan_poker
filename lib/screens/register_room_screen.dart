import 'package:flutter/material.dart';

class RegisterRoomScreen extends StatefulWidget {
  @override
  _RegisterRoomScreenState createState() => _RegisterRoomScreenState();
}

class _RegisterRoomScreenState extends State<RegisterRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlanPoker!'),
      ),
      body: Center(
        child: OutlineButton(
          child: Text('Create a room'),
          onPressed: () {},
        ),
      ),
    );
  }
}
