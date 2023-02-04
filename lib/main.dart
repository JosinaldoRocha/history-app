import 'package:flutter/material.dart';
import 'package:my_history_app/app/core/hive.dart';
import 'app/app_widget.dart';

void main() async {
  HiveInit.load();
  runApp(const MyApp());
}
