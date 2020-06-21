import 'package:flutter/material.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/screens/room/components/body.dart';
import 'package:tuple/tuple.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    final Tuple2<String, User> args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(args: args),
    );
  }
}
