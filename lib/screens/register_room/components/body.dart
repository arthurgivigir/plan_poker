import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/interfaces/rounded_button.dart';
import 'package:planpoker/models/room.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/screens/register_room/components/background.dart';
import 'package:planpoker/services/room_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _roomNameController = TextEditingController();
    final _adminRoomNameController = TextEditingController();
    final _roomIdController = TextEditingController();
    final _userNameController = TextEditingController();

    // The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    // Determine if we should use mobile layout or not, 600 here is
    // a common breakpoint for a typical 7-inch tablet.
    double containerWidth;

    shortestSide < 600
        ? containerWidth = size.width - 40
        : containerWidth = (size.width / 4);

    void createRoom() async {
      try {
        var room = Room(name: _roomNameController.text);
        var admin = User(name: _adminRoomNameController.text, cardValue: 1);
        room.admin = admin;
        room.users.add(admin);

        String returnValue = await RoomService.instance.add(room: room);

        print(returnValue);
        Navigator.pushNamed(context, kRouteRoomScreen);
      } catch (error) {
        print(error);
      }
    }

    void enterRoom() async {
      try {
        String roomID = await RoomService.instance.enterRoom(
            roomId: _roomIdController.text, userName: _userNameController.text);
        Navigator.pushNamed(context, kRouteRoomScreen, arguments: roomID);
      } catch (error) {
        print(error);
      }
    }

    void alertCreateRoom() {
      Alert(
          context: context,
          title: "Criar Sala",
          content: Column(
            children: <Widget>[
              TextField(
                controller: _roomNameController,
                maxLength: 10,
                decoration: InputDecoration(
                  icon: Icon(Icons.room),
                  labelText: 'Nome da Sala',
                ),
              ),
              TextField(
                controller: _adminRoomNameController,
                maxLength: 10,
                decoration: InputDecoration(
                  icon: Icon(Icons.room),
                  labelText: 'Seu Nome',
                ),
              ),
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () {
                createRoom();
              },
              child: Text(
                "Criar!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
    }

    void alertEnterRoom() {
      Alert(
          context: context,
          title: "Entrar na Sala",
          content: Column(
            children: <Widget>[
              TextField(
                controller: _roomIdController,
                maxLength: 20,
                decoration: InputDecoration(
                  icon: Icon(Icons.room),
                  labelText: 'Código',
                ),
              ),
              TextField(
                controller: _userNameController,
                maxLength: 20,
                decoration: InputDecoration(
                  icon: Icon(Icons.room),
                  labelText: 'Seu Nome',
                ),
              ),
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () {
                enterRoom();
              },
              child: Text(
                "Entrar!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
    }

    return Background(
      child: Container(
        width: containerWidth,
        height: size.height / 1.5,
        child: Card(
          elevation: 10,
          color: kPrimaryDarkColor,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scrun PlanPoker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  size: size,
                  color: kSecondaryLightColor,
                  text: 'Criar Sala',
                  press: () => alertCreateRoom(),
                ),
                RoundedButton(
                  size: size,
                  color: kSecondaryColor,
                  text: 'Entrar na Sala',
                  press: () => alertEnterRoom(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
