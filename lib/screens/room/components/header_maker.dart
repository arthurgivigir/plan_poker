import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/interfaces/card_flip.dart';
import 'package:planpoker/interfaces/rounded_button.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/screens/room/components/box.dart';
import 'package:planpoker/screens/room/components/user_box.dart';
import 'package:planpoker/services/room_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HeaderMaker extends StatelessWidget {
  const HeaderMaker({
    @required this.size,
    @required this.user,
    @required this.roomId,
  });

  final Size size;
  final User user;
  final String roomId;

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
            roomId: roomId,
          ),
        ),
        Box(
          size: size,
          child: ButtonsBox(
            size: size,
            roomId: roomId,
            user: user,
          ),
        ),
      ],
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class ButtonsBox extends StatelessWidget {
  const ButtonsBox({
    @required this.size,
    @required this.roomId,
    @required this.user,
  });

  final Size size;
  final String roomId;
  final User user;

  @override
  Widget build(BuildContext context) {
    int fibonacci(int n) {
      if (n == 0 || n == 1) return n;
      return fibonacci(n - 1) + fibonacci(n - 2);
    }

    var listNumbers = List<String>.generate(9, (i) {
      return fibonacci(i).toString();
    });

    listNumbers.removeAt(0);
    listNumbers.removeAt(1);
    listNumbers.insert(listNumbers.length, '☕️');

    List<Widget> listCards = [];
    for (var number in listNumbers) {
      listCards.add(
        CardFlip(
          width: 80,
          height: 120,
          frontColor: kPrimaryDarkerColor,
          backColor: kSecondaryColor,
          numberCard: number,
          flipNow: true,
          onTap: () {
            Navigator.pop(context);
            RoomService.instance.updateMyCard(
              roomId: roomId,
              userId: user.id,
              value: number,
            );
          },
        ),
      );
    }

    void alertSelectCard() {
      Alert(
        context: context,
        title: "Selecione sua carta",
        content: Row(
          children: listCards,
        ),
      ).show();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedButton(
          color: kDarkButtonColor,
          text: 'Selecionar sua Carta',
          textColor: Colors.white70,
          onPressed: () => alertSelectCard(),
          padding: EdgeInsets.all(10),
        ),
        RoundedButton(
          color: kDarkButtonColor,
          text: 'Virar todas as Cartas',
          textColor: Colors.white70,
          onPressed: () => RoomService.instance.flipCards(roomId: roomId),
          padding: EdgeInsets.all(10),
        ),
        RoundedButton(
          color: kDarkButtonColor,
          text: 'Zerar Cartas',
          textColor: Colors.white70,
          onPressed: () =>
              RoomService.instance.defaultValuesCards(roomId: roomId),
          padding: EdgeInsets.all(10),
        )
      ],
    );
  }
}
