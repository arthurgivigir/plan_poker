import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planpoker/models/room.dart';
import 'package:planpoker/models/user.dart';
import 'package:planpoker/services/base_service.dart';
import 'package:tuple/tuple.dart';

class RoomService extends BaseService {
  static var instance = RoomService();

  Future<String> add({Room room}) async {
    String documentId = "";

    try {
      DocumentReference result = await firestore.collection('rooms').add(
            room.toJson(),
          );
      print('OLAAAR $result');
      documentId = result.documentID;
    } catch (error) {
      return Future.error('Ocorreu um erro ao criar a sua sala... $error');
    }

    return documentId;
  }

  Future<Tuple2<String, User>> enterRoom(
      {String roomId, String userName}) async {
    try {
      User user = User(name: userName, cardValue: 1);

      final result = firestore.document('rooms/$roomId');
      print('Passo 2');
      await result.updateData(
        {
          'users': FieldValue.arrayUnion([user.toJson()])
        },
      );
      print('Passo 3 ${user.id}');

      return Tuple2(result.documentID, user);
    } catch (error) {
      return Future.error(
          'Ocorreu um erro ao entrar na sua sala... ${'rooms/$roomId'} $error');
    }
  }

  Future<DocumentSnapshot> get({String roomId}) async {
    try {
      final result = firestore.document('rooms/$roomId');
      return await result.get();
    } catch (error) {
      return Future.error(
          'Ocorreu um erro ao entrar na sua sala... ${'rooms/$roomId'} $error');
    }
  }

  Stream<DocumentSnapshot> getSnapshot({String roomId}) =>
      firestore.collection('rooms').document(roomId).snapshots();
}
