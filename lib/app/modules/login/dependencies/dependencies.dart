import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state_notifier.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/user_repository.dart';

final userRepositoryProvider = Provider(
  (ref) => UserRepository(),
);

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(
    userRepository: ref.read(userRepositoryProvider),
  ),
);
