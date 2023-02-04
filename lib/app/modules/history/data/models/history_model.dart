import 'package:hive/hive.dart';
part 'history_model.g.dart';

@HiveType(typeId: 1)
class HistoryModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String reference;
  @HiveField(2)
  String civilStatus;
  @HiveField(3)
  String relationship;
  @HiveField(4)
  String whatHappened;
  @HiveField(5)
  String amountTimes;
  @HiveField(6)
  String amountPeriod;

  HistoryModel({
    required this.name,
    required this.reference,
    required this.civilStatus,
    required this.relationship,
    required this.whatHappened,
    required this.amountTimes,
    required this.amountPeriod,
  });
}
