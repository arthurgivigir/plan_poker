import 'package:flutter/material.dart';
import 'package:planpoker/screens/room/components/body.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(
        roomId: args,
      ),
    );
  }
}
