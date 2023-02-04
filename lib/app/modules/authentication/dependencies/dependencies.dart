import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/modules/authentication/states/authentication_state.dart';
import 'package:my_history_app/app/modules/authentication/states/authentication_state_notifier.dart';

final authenticationRepository = Provider(
  (ref) => AuthenticationRepository(),
);

final authenticationProvider =
    StateNotifierProvider<AuthenticationStateNotifier, AuthenticationState>(
  (ref) => AuthenticationStateNotifier(
    ref.read(authenticationRepository),
  ),
);
