import 'package:flutter/material.dart';
import 'package:my_history_app/app/presentation/about/views/pages/about_page.dart';
import 'package:my_history_app/app/presentation/authentication/views/pages/recover_password/recover_password_page.dart';
import 'package:my_history_app/app/presentation/authentication/views/pages/sign_up/sign_up_page.dart';
import 'package:my_history_app/app/presentation/authentication/views/pages/sent_email/sent_email_page.dart';
import 'presentation/splash/views/pages/splash_page.dart';
import 'presentation/history/views/pages/add_history/add_history_page.dart';
import 'presentation/history/views/pages/history/historic_page.dart';
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
        '/recover-password': (context) => const RecoverPasswordPage(),
        '/sent-email': (context) => const SentEmailPage(),
        '/about-page': (context) => const AboutPage(),
      };

  static dynamic getArgs(context) => ModalRoute.of(context)?.settings.arguments;
}
