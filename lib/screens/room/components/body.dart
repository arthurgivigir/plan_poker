import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:planpoker/interfaces/card_flip.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/services/room_service.dart';
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

    // roomId = 'RMAI7N07nmhO6ccZhi2h';
    // userId = 'LfzjxfHqnzPPE2iSELSNTTLKflK4NkWwnvE4Qqua2Fw=';

    print(userId);

    return Center(
      child: StreamBuilder(
        stream: RoomService.instance.getSnapshot(roomId: roomId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading");
          }

          List<Widget> cards = [];
          List<StaggeredTile> cardsSize = [];

          var documentData = snapshot.data;
          var usersMap = documentData['users'] as List;

          for (var userMap in usersMap) {
            var user = User.fromJson(userMap);

            cards.add(
              Column(
                children: [
                  CardFlip(
                    width: 80,
                    height: 120,
                    frontColor: Colors.orange,
                    backColor: Colors.red,
                    numberCard: user.cardValue,
                  ),
                  Text('${user.name}'),
                ],
              ),
            );

            cardsSize.add(StaggeredTile.fit(1));
          }

          return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: StaggeredGridView.count(
              crossAxisCount: 3,
              staggeredTiles: cardsSize,
              children: cards,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              padding: const EdgeInsets.all(4.0),
            ),
          );
        },
      ),
    );
  }
}
