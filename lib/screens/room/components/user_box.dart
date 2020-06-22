import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planpoker/commons/constants.dart';
import 'package:planpoker/interfaces/card_flip.dart';
import 'package:planpoker/interfaces/rounded_button.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/services/room_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserBox extends StatelessWidget {
  const UserBox({
    Key key,
    @required this.size,
    @required this.user,
    @required this.roomId,
  }) : super(key: key);

  final Size size;
  final User user;
  final String roomId;

  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  @override
  Widget build(BuildContext context) {
    var listNumbers = List<int>.generate(9, (i) {
      return fibonacci(i);
    });

    listNumbers.removeAt(0);
    listNumbers.removeAt(1);

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
            RoomService.instance
                .updateMyCard(roomId: roomId, userId: user.id, value: number);
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
          )).show();
    }

    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: new BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: new Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            user.name,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  'ID da Sala: $roomId',
                  style: const TextStyle(color: Colors.grey),
                  toolbarOptions: ToolbarOptions(
                    copy: true,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.content_copy),
                  tooltip: 'Copiar valor...',
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: roomId),
                    );
                  },
                ),
              ],
            )),
        RoundedButton(
          size: size,
          color: kPrimaryDarkColor,
          text: 'Selecionar sua carta',
          press: () => alertSelectCard(),
        ),
      ],
    );
  }
}
