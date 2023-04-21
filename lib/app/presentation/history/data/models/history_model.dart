import 'package:hive/hive.dart';
part 'history_model.g.dart';

@HiveType(typeId: 1)
class HistoryModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String reference;

  @HiveField(7)
  String id;
  @HiveField(8)
  String? userId;

  HistoryModel({
    required this.name,
    required this.reference,
    required this.id,
    required this.userId,
  });

  Map<String, dynamic> toMap(String userId) {
    return <String, dynamic>{
      'name': name,
      'reference': reference,
      'id': id,
      'user-id': userId,
    };
  }

  Map<String, dynamic> updateToMap() {
    return <String, dynamic>{
      'name': name,
      'reference': reference,
      'id': id,
      'user-id': userId,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map, String id) {
    return HistoryModel(
      name: (map["name"] ?? '') as String,
      reference: (map["reference"] ?? 0) as String,
      id: (id),
      //id: (map["id"] ?? '') as String,
      userId: (map["user-id"] ?? '') as String,
    );
  }
}
