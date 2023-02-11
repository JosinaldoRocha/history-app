import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/views/pages/add_item_page.dart';
import 'package:my_history_app/app/modules/history/views/pages/historic_page.dart';
import 'package:my_history_app/app/modules/login/views/pages/login_page.dart';
import 'package:my_history_app/app/modules/authentication/views/pages/splash_page.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';
import 'package:my_history_app/app/modules/register/views/pages/register_page.dart';
import 'package:my_history_app/app/style/my_theme.dart';
import 'modules/home/views/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: MyTheme.myColor,
        ),
        initialRoute: '/',
        routes: {
          '/': (contexto) => const SplashPage(),
          '/login': (contexto) => const LoginPage(),
          '/register-page': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
          '/history-page': (context) => HistoricPage(
                args: ModalRoute.of(context)!.settings.arguments as UserModel,
              ),
          '/add-item-page': (context) => const AddItemPage(),
        },
      ),
    );
  }
}
