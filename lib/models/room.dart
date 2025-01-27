import 'package:planpoker/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  String id;
  String name;
  List<User> users = [];
  bool flipNow = false;

  Room({this.id, this.name});

  Room.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        users = snapshot['users'] ?? [],
        flipNow = snapshot['flipNow'] ?? false;

  List<Map> convertUserListToJson() {
    List<Map> list = [];
    this.users.forEach((User user) {
      list.add(user.toJson());
    });
    return list;
  }

  toJson() {
    return {
      'name': name,
      'flipNow': flipNow,
      'users': FieldValue.arrayUnion(
        convertUserListToJson(),
      )
    };
  }
}
