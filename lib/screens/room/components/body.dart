import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:planpoker/interfaces/card_flip.dart';

class Body extends StatelessWidget {
  static int size = 10;

  final List<Widget> cards = List.generate(
    size,
    (index) => Column(
      children: [
        CardFlip(
          width: 80,
          height: 120,
          frontColor: Colors.orange,
          backColor: Colors.red,
          numberCard: 1,
        ),
        Text('$index'),
      ],
    ),
  );

  final List<StaggeredTile> cardsSize =
      List.generate(size, (index) => StaggeredTile.fit(1));

  @override
  Widget build(BuildContext context) {
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
  }
}
