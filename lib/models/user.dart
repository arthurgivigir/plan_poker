import 'package:planpoker/commons/utils.dart';

class User {
  String id = _getId();
  String name;
  int cardValue = 1;
  bool isAdmin = false;

  User({this.name, this.cardValue, this.isAdmin = false});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        cardValue = json['cardValue'] ?? 1,
        isAdmin = json['isAdmin'] ?? false;

  toJson() {
    return {
      'id': id,
      'name': name,
      'cardValue': cardValue,
      'isAdmin': isAdmin,
    };
  }

  static String _getId() {
    return Utils.createCryptoRandomString();
  }
}
