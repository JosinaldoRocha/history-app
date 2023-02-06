import 'package:hive/hive.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';

class HistoryRepository {
  final box = Hive.box<HistoryModel>('history');
  final boxInt = Hive.box<int>('index');

  Future<List<HistoryModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    final values = box.values.toList();
    values.sort(
      (a, b) => a.name.compareTo(b.name),
    );
    return values;
  }

  Future<void> addItem(int key, HistoryModel item) async {
    await box.put(key, item);
  }

  Future<void> deleteItem(HistoryModel item) async {
    await item.delete();
  }

  Future<void> editHistory(int index, HistoryModel history) async {
    await box.putAt(index, history);
  }

  List<int> getIndex() {
    final values = boxInt.values.toList();
    return values;
  }

  void addIndex(int index) async {
    await boxInt.add(index);
  }

  Future<List<String>> getCivilStatusList() async {
    return [
      'Solteira',
      'Casada',
      'Namorando',
      'Saindo com alguém',
      'Mais de um estado',
      'Não fui informado'
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
      'Beijos e transa',
      'Beijos, sexo oral e transa',
      'Transa',
      'Sexo oral'
    ];
  }

  Future<List<String>> getListOfTimes() async {
    return ['1 vez', '2 vezes', '3 vezes', 'Acima de 3 vezes', 'Não lembro'];
  }

  Future<List<String>> getPeriodList() async {
    return [
      '1 período',
      '2 períodos',
      '3 períodos',
      'Acima de 3 períodos',
      'Não lembro'
    ];
  }
}
