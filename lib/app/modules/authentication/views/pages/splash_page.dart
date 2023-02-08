import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/authentication/states/authentication_state.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  _listen() {
    ref.listen<AuthenticationState>(authenticationProvider, (previous, next) {
      if (next is Authenticated) {
        Navigator.pushNamed(
          context,
          '/home',
          arguments: next.data,
        );
      }

      if (next is UnAuthenticated) {
        Navigator.pushNamed(context, '/login');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(authenticationProvider.notifier).authentication());
  }

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/logo.png';
    _listen();

    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}
