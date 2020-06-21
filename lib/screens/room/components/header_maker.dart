import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/interfaces/rounded_button.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/screens/room/components/box.dart';
import 'package:planpoker/screens/room/components/user_box.dart';

class HeaderMaker extends StatelessWidget {
  const HeaderMaker({
    @required this.size,
    @required this.user,
  });

  final Size size;
  final User user;

  int crossAxisCount() {
    print('💻 ${size.width}');
    if (size.width <= 730) {
      return 1;
    }

    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return SliverStaggeredGrid.count(
      crossAxisCount: crossAxisCount(),
      staggeredTiles: [
        StaggeredTile.fit(1),
        StaggeredTile.fit(1),
      ],
      children: [
        Box(
          size: size,
          child: UserBox(
            size: size,
            user: user,
          ),
        ),
        Box(
          size: size,
          child: ButtonsBox(size: size),
        ),
      ],
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class ButtonsBox extends StatelessWidget {
  const ButtonsBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedButton(
          size: size,
          color: kSecondaryLightColor,
          text: 'Virar todas as Cartas',
          press: () => {},
        ),
        RoundedButton(
          size: size,
          color: kSecondaryLightColor,
          text: 'Zerar Cartas',
          press: () => {},
        )
      ],
    );
  }
}
