import 'package:flutter/material.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/screens/room/components/card_grid_maker.dart';
import 'package:planpoker/screens/room/components/header_maker.dart';
import 'package:planpoker/services/local_storage.dart';
import 'package:tuple/tuple.dart';

class Body extends StatelessWidget {
  Body({
    this.args,
  });

  static int size = 1;
  final Tuple2<String, User> args;

  @override
  Widget build(BuildContext context) {
    String roomId = args?.item1;
    User user = args?.item2;

    return Scaffold(
      appBar: AppBar(
        title: Text('PlanPoker'),
        backgroundColor: Color(0xff398ae5),
      ),
      body: FutureBuilder(
        future: backProperties(context: context, user: user, roomId: roomId),
        builder: (BuildContext context,
            AsyncSnapshot<Tuple2<String, User>> snapshot) {
          if (snapshot.hasData) {
            return ScrollView(snapshot: snapshot.data);
          } else {
            return Text('Loading...');
          }
        },
      ),
    );
  }
}

class ScrollView extends StatelessWidget {
  const ScrollView({
    Key key,
    @required this.snapshot,
  });

  final Tuple2<String, User> snapshot;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String roomId = snapshot.item1;
    User user = snapshot.item2;

    return CustomScrollView(
      primary: true,
      slivers: [
        HeaderMaker(
          size: size,
          user: user,
          roomId: roomId,
        ),
        CardGridMaker(roomId: roomId),
      ],
    );
  }
}

Future<Tuple2<String, User>> backProperties(
    {BuildContext context, roomId, User user}) async {
  LocalStorage localStorage = LocalStorage.instance;

  if (roomId == null || user == null) {
    String idStorage = await localStorage.getRoomId();
    User userStorage = await localStorage.getUser();

    if (idStorage == 'null') {
      Navigator.pop(context);
    }

    if (userStorage.id == 'null' || userStorage.id.isEmpty) {
      Navigator.pop(context);
    }

    roomId = idStorage;
    user = userStorage;
  } else {
    localStorage.saveRoomId(roomId);
    localStorage.saveUser(user);
  }

  return Tuple2(roomId, user);
}
