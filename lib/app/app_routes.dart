import 'package:flutter/material.dart';
import 'package:my_history_app/app/modules/authentication/views/pages/recover_password_page.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import 'package:my_history_app/app/modules/history/views/pages/edit_item_page.dart';
import 'modules/authentication/views/pages/splash_page.dart';
import 'modules/history/views/pages/add_item_page.dart';
import 'modules/history/views/pages/historic_page.dart';
import 'modules/home/views/pages/home_page.dart';
import 'modules/login/views/pages/login_page.dart';
import 'modules/register/data/models/user_model.dart';
import 'modules/register/views/pages/register_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get all => {
        '/': (contexto) => const SplashPage(),
        '/login': (contexto) => const LoginPage(),
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
