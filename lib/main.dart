import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_history_app/app/core/hive/hive.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveInit.load();
  runApp(const MyApp());
}
