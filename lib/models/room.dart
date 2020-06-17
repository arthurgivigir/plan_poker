import 'package:planpoker/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  String id;
  String name;
  List<User> users = [];

  Room({this.id, this.name});

  Room.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        users = snapshot['users'] ?? [];

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
      'users': FieldValue.arrayUnion(
        convertUserListToJson(),
      )
    };
  }
}
