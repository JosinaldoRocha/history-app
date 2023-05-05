import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/user_repository.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';

class HistoryRepository {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<List<HistoryModel>> getAll(String id) async {
    final getDocuments = await _firestore
        .collection('history')
        .where('user-id', isEqualTo: id)
        .get();
    final documents = getDocuments.docs;
    List<HistoryModel> historics = [];

    for (var docs in documents) {
      final item = HistoryModel.fromSnapShot(docs);
      historics.add(item);
    }
    historics.sort((a, b) => a.name.compareTo(b.name));

    return historics;
  }

  Future<void> saveHistory(HistoryModel history) async {
    final userId = await UserRepository().getCurrentUser();
    final collection = _firestore.collection('history');
    await collection.add(history.toMap(userId.id!));
  }

  Future<void> deleteHistory(String id) async {
    final document = _firestore.collection('history').doc(id);
    await document.delete();
  }

  Future<void> editHistory(HistoryModel history) async {
    final document = _firestore.collection('history').doc(history.id);
    await document.update(history.updateToMap());
  }

  Future<String> addImage(String image) async {
    final Reference reference =
        _storage.ref().child('historyImage/').child(image);
    final UploadTask task = reference.putFile(File(image));
    await task.whenComplete(() => null);
    final imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }

  Future<void> deleteUserHistory(String id) async {
    final getDocuments = _firestore.collection('history');
    final document = await getDocuments.where('user-id', isEqualTo: id).get();

    for (var doc in document.docs) {
      await doc.reference.delete();
    }
  }

  Future<List<String>> getCivilStatusList() async {
    return [
      'Solteira',
      'Casada',
      'Namorando',
      'Saindo com alguém',
      'Mais de um estado civil',
      'Não fui informado',
      'Não lembro'
    ];
  }

  Future<List<String>> getRelationshipList() async {
    return ['Pré-paqueramos', 'Paqueramos', 'Ficamos', 'Namoramos'];
  }

  Future<List<String>> getListWhatHappened() async {
    return [
      'Selinho(s)',
      'Beijo(s)',
      'Amassos',
      'Beijos e amassos',
      'Beijos e sexo oral',
      'Amassos e sexo oral',
      'Beijos, amassos e sexo oral',
      'Beijos e sexo vaginal',
      'Amassos e sexo vaginal',
      'Beijos, amassos e sexo vaginal',
      'Beijos e sexo anal',
      'Amassos e sexo anal',
      'Beijos, amassos e sexo anal',
      'Beijos, sexo vaginal e oral',
      'Amassos, sexo vaginal e oral',
      'Beijos, sexo vaginal e anal',
      'Amassos, sexo vaginal e anal',
      'Beijos, sexo oral e anal',
      'Amassos, sexo oral e anal',
      'Beijos, sexo vaginal, anal e oral',
      'Amassos, sexo vaginal, anal e oral',
      'Sexo vaginal',
      'Sexo oral',
      'Sexo anal',
      'Sexo vaginal e oral',
      'Sexo vaginal e anal',
      'Sexo oral e anal',
      'Sexo vaginal, anal e oral',
      'Não lembro detalhes',
    ];
  }

  Future<List<String>> getListOfTimes() async {
    return [
      '1 vez',
      '2 vezes',
      'Acima de 2 vezes',
      'Várias vezes',
      'Não lembro',
    ];
  }

  Future<List<String>> getPeriodList() async {
    return [
      '1 período',
      '2 períodos',
      'Acima de 2 períodos',
      'Vários períodos',
      'Não lembro',
    ];
  }
}
