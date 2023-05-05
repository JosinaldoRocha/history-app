import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
import '../../providers/authentication_provider.dart';
import '../states/authentication_state.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  _listen() {
    ref.listen<AuthenticationState>(
      authenticationProvider,
      (previous, next) {
        if (next is Authenticated) {
          Navigator.pushReplacementNamed(
            context,
            '/home',
            arguments: next.data,
          );
        }
        if (next is UnAuthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(authenticationProvider.notifier).loadAutentication());
  }

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/logo5.png';
    _listen();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(image),
            ),
            const Space.x10(),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
