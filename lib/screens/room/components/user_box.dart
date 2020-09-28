import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planpoker/models/user.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: Color(0xffFDCF09),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/project.png'),
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
          ),
        ),
      ],
    );
  }
}
