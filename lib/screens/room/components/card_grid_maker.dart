import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/interfaces/card_flip.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/services/room_service.dart';

class CardGridMaker extends StatelessWidget {
  const CardGridMaker({
    Key key,
    @required this.roomId,
  }) : super(key: key);

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: RoomService.instance.getSnapshot(roomId: roomId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SliverStaggeredGrid.count(
            crossAxisCount: 3,
            staggeredTiles: [StaggeredTile.fit(1)],
            children: [Card()],
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          );
        }

        List<Widget> cards = [];
        List<StaggeredTile> cardsSize = [];

        var documentData = snapshot.data;
        var usersMap = documentData['users'] as List;
        var flipNow = documentData['flipNow'] as bool;

        for (var userMap in usersMap) {
          var user = User.fromJson(userMap);

          cards.add(
            Column(
              children: <Widget>[
                CardFlip(
                  width: 80,
                  height: 120,
                  frontColor: kPrimaryDarkerColor,
                  backColor: kSecondaryColor,
                  numberCard: user.cardValue,
                  canFlip: user.isAdmin,
                  flipNow: flipNow,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${user.name} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );

          cardsSize.add(StaggeredTile.fit(1));
        }

        return SliverStaggeredGrid.count(
          crossAxisCount: 3,
          staggeredTiles: cardsSize,
          children: cards,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        );
      },
    );
  }
}
