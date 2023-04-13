import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/splash/views/states/authentication_state_notifier.dart';
import '../../authentication/data/repositories/authentication_repository.dart';
import '../views/states/authentication_state.dart';

final authenticationRepository = Provider(
  (ref) => AuthenticationRepository(),
);

final authenticationProvider =
    StateNotifierProvider<AuthenticationStateNotifier, AuthenticationState>(
  (ref) => AuthenticationStateNotifier(
    authenticationRepository: ref.read(authenticationRepository),
  ),
);
