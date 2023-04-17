import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/login_state/login_state_notifier.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/check_email/check_email_state.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/check_email/check_email_state_notifier.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/recover_password/recover_password_state.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/recover_password/recover_password_state_notifier.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/login_state/login_state.dart';
import '../data/repositories/user_repository.dart';
import '../views/states/sign_up/sign_up_state.dart';
import '../views/states/sign_up/sign_up_state_notifier.dart';
import '../views/states/logout_state/logout_state.dart';
import '../views/states/logout_state/logout_state_notifier.dart';

final authenticationRepository = Provider(
  (ref) => AuthenticationRepository(),
);

final userRepositoryProvider = Provider(
  (ref) => UserRepository(),
);

final signUpProvider = StateNotifierProvider<SignUpStateNotifier, SignUpState>(
  (ref) => SignUpStateNotifier(
    //ref.read(userRepository),
    ref.read(authenticationRepository),
  ),
);

final logoutProvider =
    StateNotifierProvider.autoDispose<LogoutStateNotifier, LogoutState>(
  (ref) => LogoutStateNotifier(
    authenticationRepository: ref.read(authenticationRepository),
  ),
);

final recoverPasswordProvider = StateNotifierProvider.autoDispose<
    RecoverPasswordStateNotifier, RecoverPasswordState>(
  (ref) => RecoverPasswordStateNotifier(
    userRepository: ref.read(userRepositoryProvider),
  ),
);

final checkEmailProvider =
    StateNotifierProvider.autoDispose<CheckEmailStateNotifier, CheckEmailState>(
  (ref) => CheckEmailStateNotifier(
    authenticationRepository: ref.read(authenticationRepository),
  ),
);

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(
    userRepository: ref.read(userRepositoryProvider),
  ),
);
