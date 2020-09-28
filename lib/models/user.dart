import 'package:planpoker/commons/utils.dart';

class User {
  String id = _getId();
  String name;
  String cardValue = '1';
  bool isAdmin = false;

  User({this.name, this.cardValue, this.isAdmin = false});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        cardValue = json['cardValue'] ?? '1',
        isAdmin = json['isAdmin'] ?? false;

  // User.fromDynamic(List<dynamic> json) {
  //   json.
  // }

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
