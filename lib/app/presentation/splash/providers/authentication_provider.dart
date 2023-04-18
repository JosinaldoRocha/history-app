import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/user_repository.dart';
import 'package:my_history_app/app/presentation/splash/views/states/authentication_state_notifier.dart';
import '../views/states/authentication_state.dart';

final userRepository = Provider(
  (ref) => UserRepository(),
);

final authenticationProvider =
    StateNotifierProvider<AuthenticationStateNotifier, AuthenticationState>(
  (ref) => AuthenticationStateNotifier(
    userRepository: ref.read(userRepository),
  ),
);
