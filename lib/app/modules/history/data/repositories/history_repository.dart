import 'package:hive/hive.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';

class HistoryRepository {
  final box = Hive.box<HistoryModel>('history');

  Future<List<HistoryModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    final values = box.values.toList();
    values.sort(
      (a, b) => a.name.compareTo(b.name),
    );
    return values;
  }

  Future<void> addItem(HistoryModel item) async {
    await box.add(item);
  }

  Future<void> deleteItem(HistoryModel item) async {
    await item.delete();
  }

  Future<List<String>> getCivilStatusList() async {
    //await Future.delayed(const Duration(seconds: 1));
    return [
      'Solteira',
      'Casada',
      'Namorando',
      'Saindo com alguém',
      'Não fui informado'
    ];
  }

  Future<List<String>> getRelationshipList() async {
    // await Future.delayed(const Duration(seconds: 1));
    return ['Paqueramos', 'Ficamos', 'Namoramos'];
  }

  Future<List<String>> getListWhatHappened() async {
    // await Future.delayed(const Duration(seconds: 1));
    return [
      'Selinho(s)',
      'Beijo(s)',
      'Beijos e amassos',
      'Beijos e sexo oral',
      'Beijos e sexo vaginal',
      'Beijos, sexo oral e vaginal',
      'Sexo vaginal',
      'Sexo oral'
    ];
  }

  Future<List<String>> getListOfTimes() async {
    //await Future.delayed(const Duration(seconds: 1));
    return ['1 vez', '2 vezes', '3 vezes', 'Acima de 3 vezes', 'Não lembro'];
  }

  Future<List<String>> getPeriodList() async {
    //await Future.delayed(const Duration(seconds: 1));
    return ['1 período', '2 períodos', 'Acima de 2 períodos', 'Não lembro'];
  }
}
