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
  @HiveField(7)
  String id;

  HistoryModel({
    required this.name,
    required this.reference,
    required this.civilStatus,
    required this.relationship,
    required this.whatHappened,
    required this.amountTimes,
    required this.amountPeriod,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'reference': reference,
      'civil-status': civilStatus,
      'relationship': relationship,
      'what-happened': whatHappened,
      'amount-times': amountTimes,
      'amount-period': amountPeriod,
      'id': id,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      name: (map["name"] ?? '') as String,
      reference: (map["reference"] ?? 0) as String,
      civilStatus: (map["civil-status"] ?? 0) as String,
      relationship: (map["relationship"] ?? 0) as String,
      whatHappened: (map["what-happened"] ?? '') as String,
      amountTimes: (map["amount-times"] ?? '') as String,
      amountPeriod: (map["amount-period"] ?? '') as String,
      id: (map["id"] ?? '') as String,
    );
  }
}
