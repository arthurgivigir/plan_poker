import 'package:flutter/material.dart';
import 'package:planpoker/screens/room/components/card_grid_maker.dart';
import 'package:planpoker/screens/room/components/header_maker.dart';
import 'package:tuple/tuple.dart';

class Body extends StatelessWidget {
  Body({
    this.args,
  });

  static int size = 1;
  final Tuple2<String, String> args;

  @override
  Widget build(BuildContext context) {
    String roomId = args?.item1;
    String userId = args?.item2;

    roomId = 'RMAI7N07nmhO6ccZhi2h';
    userId = 'LfzjxfHqnzPPE2iSELSNTTLKflK4NkWwnvE4Qqua2Fw=';
    Size size = MediaQuery.of(context).size;

    print(userId);

    return Scaffold(
      appBar: AppBar(
        title: Text('PlanPoker'),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: [
          HeaderMaker(size: size),
          CardGridMaker(roomId: roomId),
        ],
      ),
    );
  }
}
