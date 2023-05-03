import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/delete_user/delete_user_state.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/delete_user/delete_user_state_notifier.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/sign_in_state/sign_in_state_notifier.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/check_email/check_email_state.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/check_email/check_email_state_notifier.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/recover_password/recover_password_state.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/recover_password/recover_password_state_notifier.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/sign_in_state/sign_in_state.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/update_user/update_profile_picture_state.dart';
import '../data/repositories/user_repository.dart';
import '../views/states/sign_up/sign_up_state.dart';
import '../views/states/sign_up/sign_up_state_notifier.dart';
import '../views/states/logout_state/logout_state.dart';
import '../views/states/logout_state/logout_state_notifier.dart';
import '../views/states/update_user/update_profile_picture_state_notifier.dart';

final authenticationRepository = Provider(
  (ref) => AuthenticationRepository(),
);

final userRepositoryProvider = Provider(
  (ref) => UserRepository(),
);

final signUpProvider = StateNotifierProvider<SignUpStateNotifier, SignUpState>(
  (ref) => SignUpStateNotifier(
    ref.read(authenticationRepository),
  ),
);

final signInProvider = StateNotifierProvider<SignInStateNotifier, SignInState>(
  (ref) => SignInStateNotifier(
    authenticationRepository: ref.read(authenticationRepository),
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
    userRepository: ref.read(authenticationRepository),
  ),
);

final checkEmailProvider =
    StateNotifierProvider.autoDispose<CheckEmailStateNotifier, CheckEmailState>(
  (ref) => CheckEmailStateNotifier(
    authenticationRepository: ref.read(authenticationRepository),
  ),
);

final updataProfilePictureProvider = StateNotifierProvider<
    UpdateProfilePictureStateNotifier, UpdateProfilePictureState>(
  (ref) => UpdateProfilePictureStateNotifier(
    userRepository: ref.read(userRepositoryProvider),
  ),
);

final deleteUserProvider =
    StateNotifierProvider<DeleteUserStateNotifier, DeleteUserState>(
  (ref) => DeleteUserStateNotifier(
    repository: ref.read(authenticationRepository),
  ),
);
