import 'package:cloud_firestore/cloud_firestore.dart';
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
  String? id;
  @HiveField(8)
  String? userId;
  @HiveField(9)
  String image;

  HistoryModel({
    required this.name,
    required this.reference,
    required this.civilStatus,
    required this.relationship,
    required this.whatHappened,
    required this.amountTimes,
    required this.amountPeriod,
    this.id,
    this.userId,
    required this.image,
  });

  Map<String, dynamic> toMap(String userId) {
    return <String, dynamic>{
      'name': name,
      'reference': reference,
      'civil-status': civilStatus,
      'relationship': relationship,
      'what-happened': whatHappened,
      'amount-times': amountTimes,
      'amount-period': amountPeriod,
      'user-id': userId,
      'image': image,
    };
  }

  Map<String, dynamic> updateToMap() {
    return <String, dynamic>{
      'name': name,
      'reference': reference,
      'civil-status': civilStatus,
      'relationship': relationship,
      'what-happened': whatHappened,
      'amount-times': amountTimes,
      'amount-period': amountPeriod,
      'id': id,
      'user-id': userId,
      'image': image,
    };
  }

  factory HistoryModel.fromSnapShot(
      QueryDocumentSnapshot<Map<String, dynamic>> data) {
    return HistoryModel(
      name: (data.data()["name"] ?? '') as String,
      reference: (data.data()["reference"] ?? 0) as String,
      civilStatus: (data.data()["civil-status"] ?? 0) as String,
      relationship: (data.data()["relationship"] ?? 0) as String,
      whatHappened: (data.data()["what-happened"] ?? '') as String,
      amountTimes: (data.data()["amount-times"] ?? '') as String,
      amountPeriod: (data.data()["amount-period"] ?? '') as String,
      id: data.id,
      userId: (data.data()["user-id"] ?? '') as String,
      image: (data.data()["image"] ?? '') as String,
    );
  }
}
