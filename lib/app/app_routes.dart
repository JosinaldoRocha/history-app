import 'package:flutter/material.dart';
import 'package:my_history_app/app/presentation/authentication/views/pages/recover_password_page.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import 'package:my_history_app/app/presentation/history/views/pages/edit_item_page.dart';
import 'presentation/splash/views/pages/splash_page.dart';
import 'presentation/history/views/pages/add_item_page.dart';
import 'presentation/history/views/pages/historic_page.dart';
import 'presentation/home/views/pages/home_page.dart';
import 'presentation/authentication/views/pages/login_page.dart';
import 'presentation/register/data/models/user_model.dart';
import 'presentation/register/views/pages/register_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get all => {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register-page': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/history-page': (context) => HistoricPage(
              args: getArgs(context) as UserModel,
            ),
        '/add-item-page': (context) => const AddItemPage(),
        '/edit-item-page': (context) => EditItemPage(
              history: getArgs(context) as HistoryModel,
            ),
        '/recover-password': (context) => const RecoverPasswordPage(),
      };

  static dynamic getArgs(context) => ModalRoute.of(context)?.settings.arguments;
}
