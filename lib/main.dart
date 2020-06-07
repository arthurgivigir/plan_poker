import 'package:flutter/material.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/screens/register_room/home_screen.dart';
import 'package:planpoker/screens/room/room_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: kRouteHome,
      routes: {
        kRouteHome: (context) => HomeScreen(),
        kRouteRoomScreen: (context) => RoomScreen(),
      },
    );
  }
}
