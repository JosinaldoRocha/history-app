import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';

class HistoryRepository {
  final box = Hive.box<HistoryModel>('history');
  final _firestore = FirebaseFirestore.instance;

  // Future<List<HistoryModel>> getAll(int id) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   final values = box.values.toList();
  //   values.retainWhere((element) => element.id == id);
  //   values.sort(
  //     (a, b) => a.name.compareTo(b.name),
  //   );
  //   return values;
  // }

  Future<List<QueryDocumentSnapshot>> getAll(String id) async {
    final collection = _firestore.collection('history');
    final getDocs = await collection.where('id', isEqualTo: id).get();
    final result = getDocs.docs;
    result.sort((a, b) => a['name'].compareTo(b['name']));
    return result;
  }

  Future<void> saveHistory(HistoryModel history) async {
    final collection = _firestore.collection('history');

    Map<String, dynamic> historyData = {
      'name': history.name,
      'reference': history.reference,
      'civil-status': history.civilStatus,
      'relationship': history.relationship,
      'whatHappened': history.whatHappened,
      'amountTimes': history.amountTimes,
      'amountPeriod': history.amountPeriod,
      'id': history.id,
    };
    await collection.add(historyData);
  }

  Future<void> deleteItem(HistoryModel history) async {
    await history.delete();
  }

  Future<void> editHistory(HistoryModel history) async {
    history.save();
  }

  Future<List<String>> getCivilStatusList() async {
    return [
      'Solteira',
      'Casada',
      'Namorando',
      'Saindo com alguém',
      'Mais de um estado civil',
      'Não fui informado',
    ];
  }

  Future<List<String>> getRelationshipList() async {
    return ['Paqueramos', 'Ficamos', 'Namoramos'];
  }

  Future<List<String>> getListWhatHappened() async {
    return [
      'Selinho(s)',
      'Beijo(s)',
      'Beijos e amassos',
      'Beijos e sexo oral',
      'Beijos e sexo vaginal',
      'Beijos e sexo anal',
      'Beijos, sexo vaginal e oral',
      'Beijos, sexo vaginal e anal',
      'Beijos, sexo oral e anal',
      'Beijos, sexo vaginal, anal e oral',
      'Sexo vaginal',
      'Sexo oral',
      'Sexo anal',
      'Sexo vaginal e oral',
      'Sexo vaginal e anal',
      'Sexo vaginal, anal e oral',
    ];
  }

  Future<List<String>> getListOfTimes() async {
    return [
      '1 vez',
      '2 vezes',
      '3 vezes',
      'Acima de 3 vezes',
      'Inúmeras vezes',
      'Não lembro',
    ];
  }

  Future<List<String>> getPeriodList() async {
    return [
      '1 período',
      '2 períodos',
      '3 períodos',
      'Acima de 3 períodos',
      'Não lembro',
    ];
  }
}
