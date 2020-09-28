import 'package:flutter/material.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/commons/utils.dart';
import 'package:planpoker/interfaces/rounded_button.dart';
import 'package:planpoker/models/room.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/services/room_service.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tuple/tuple.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showCreateRoom = true;

  final _roomNameController = TextEditingController();
  final _roomIdController = TextEditingController();
  final _userNameController = TextEditingController();

  void _createRoom() async {
    try {
      var room = Room(name: _roomNameController.text);
      var admin = User(
        name: _userNameController.text,
        cardValue: '1',
        isAdmin: true,
      );
      room.users.add(admin);

      String roomID = await RoomService.instance.add(room: room);

      print(roomID);
      print(admin.id);
      Navigator.pushNamed(context, kRouteRoomScreen,
          arguments: Tuple2(roomID, admin));
    } catch (error) {
      print(error);
    }
  }

  void _enterRoom() async {
    try {
      Tuple2<String, User> returnTuple = await RoomService.instance.enterRoom(
          roomId: _roomIdController.text, userName: _userNameController.text);
      Navigator.pushNamed(context, kRouteRoomScreen, arguments: returnTuple);
    } catch (error) {
      print(error);
    }
  }

  void _togleView() {
    setState(
      () {
        _showCreateRoom = !_showCreateRoom;
        print("showCreateRoom");
      },
    );
  }

  Widget _userNameTextField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: _userNameController,
        maxLength: 20,
        style: TextStyle(color: kTextColor),
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          border: InputBorder.none,
          counterStyle: TextStyle(
            height: double.minPositive,
          ),
          hintText: "Seu Nome",
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

  Widget _createRoomWidget() {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: Color(0x99ffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
              1.0,
              CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/project.png'),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.6,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[100],
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _roomNameController,
                                maxLength: 20,
                                style: TextStyle(
                                  color: kTextColor,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(Icons.event_seat),
                                  counterStyle: TextStyle(
                                    height: double.minPositive,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Nome da Sala",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            _userNameTextField(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                FadeAnimation(
                  1.4,
                  RoundedButton(
                    text: 'Criar',
                    textColor: Colors.white70,
                    color: Color(0xff527daa),
                    onPressed: () => _createRoom(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _enterRoomWidget() {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: Color(0x99ffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
              1.2,
              CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/brainstorming.png'),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.2,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[100],
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _roomIdController,
                                maxLength: 20,
                                style: TextStyle(color: kTextColor),
                                decoration: InputDecoration(
                                  icon: Icon(Icons.confirmation_number),
                                  counterStyle: TextStyle(
                                    height: double.minPositive,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Código",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            _userNameTextField(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                FadeAnimation(
                  1.8,
                  RoundedButton(
                    text: 'Entrar',
                    textColor: Colors.white70,
                    color: Color(0xff527daa),
                    onPressed: () => _enterRoom(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardCreateRoom() {
    return Column(
      children: [
        _createRoomWidget(),
        FadeAnimation(
          1.8,
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: RoundedButton(
              text: 'Entrar em uma Sala',
              textColor: Color(0xff527daa),
              color: Colors.white70,
              onPressed: () => _togleView(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _cardEnterRoom() {
    return Column(
      children: [
        _enterRoomWidget(),
        FadeAnimation(
          1.8,
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: RoundedButton(
              text: 'Criar uma Sala',
              textColor: Color(0xff527daa),
              color: Colors.white70,
              onPressed: () => _togleView(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    // Determine if we should use mobile layout or not, 600 here is
    // a common breakpoint for a typical 7-inch tablet.
    double containerWidth;

    shortestSide < 600
        ? containerWidth = size.width - 40
        : containerWidth = (size.width / 3);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff73aef5),
                  Color(0xff61a4f1),
                  Color(0xff478de0),
                  Color(0xff398ae5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: containerWidth,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120,
                ),
                child: Column(
                  children: [
                    Text(
                      "Scrun PlanPoker!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Visibility(
                      child: _cardEnterRoom(),
                      visible: _showCreateRoom,
                    ),
                    Visibility(
                      child: _cardCreateRoom(),
                      visible: !_showCreateRoom,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
