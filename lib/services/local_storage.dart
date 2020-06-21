import 'dart:html';

import 'package:planpoker/models/user.dart';

class LocalStorage {
  static var instance = LocalStorage();
  final Storage _localStorage = window.localStorage;

  Future saveUser(User user) async {
    _localStorage['user_id'] = user.id;
    _localStorage['user_name'] = user.name;
    _localStorage['user_is_admin'] = user.isAdmin.toString().toLowerCase();
  }

  Future saveRoomId(String userId) async {
    _localStorage['room_id'] = userId;
  }

  Future<User> getUser() async {
    User user = User();
    user.id = _localStorage['user_id'];
    user.name = _localStorage['user_name'];
    user.isAdmin = _localStorage['user_is_admin'].parseBool();
    return user;
  }

  Future<String> getRoomId() async => _localStorage['room_id'];

  Future invalidate() async {
    _localStorage.remove('user_id');
    _localStorage.remove('room_id');
    _localStorage.remove('user_name');
    _localStorage.remove('user_is_admin');
  }
}

extension BoolParsing on String {
  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
}
