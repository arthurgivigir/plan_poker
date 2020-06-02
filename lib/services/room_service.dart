import 'package:cloud_firestore/cloud_firestore.dart';

class RoomService {
  static var instance = RoomService();

  var _firestore = Firestore.instance;

  Future<String> add({String roomName}) async {
    String documentId = "";

    try {
      DocumentReference result = await _firestore.collection('rooms').add(
        {'name': roomName},
      );
      documentId = result.documentID;
    } catch (error) {
      return Future.error('Ocorreu um erro ao criar a sua sala...');
    }

    return documentId;
  }

  Future<DocumentSnapshot> get({String roomId}) async {
    try {
      final result = _firestore.document('rooms/$roomId');
      return await result.get();
    } catch (error) {
      return Future.error(
          'Ocorreu um erro ao entrar na sua sala... ${'rooms/$roomId'} $error');
    }
  }
}
