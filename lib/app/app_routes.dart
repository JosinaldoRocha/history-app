import 'package:flutter/material.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import 'package:my_history_app/app/presentation/authentication/views/pages/recover_password_page.dart';
import 'package:my_history_app/app/presentation/authentication/views/pages/sign_up/sign_up_page.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import 'package:my_history_app/app/presentation/history/views/pages/edit_item_page.dart';
import 'presentation/splash/views/pages/splash_page.dart';
import 'presentation/history/views/pages/add_history_page.dart';
import 'presentation/history/views/pages/historic_page.dart';
import 'presentation/home/views/pages/home_page.dart';
import 'presentation/authentication/views/pages/sign_in/sign_in_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get all => {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/home': (context) => HomePage(
              args: getArgs(context),
            ),
        '/history-page': (context) => HistoricPage(
              args: getArgs(context),
            ),
        '/add-history-page': (context) => AddHistoryPage(
              args: getArgs(context),
            ),
        '/edit-item-page': (context) => EditItemPage(
              history: getArgs(context),
            ),
        '/recover-password': (context) => const RecoverPasswordPage(),
      };

  static dynamic getArgs(context) => ModalRoute.of(context)?.settings.arguments;
}
