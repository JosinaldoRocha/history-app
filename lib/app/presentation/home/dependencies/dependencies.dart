import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/home/views/states/home_state.dart';
import 'package:my_history_app/app/presentation/home/views/states/home_state_notifier.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/user_repository.dart';
import '../../register/views/states/clear_register/clear_register_state_notifier.dart';
import '../../register/views/states/clear_register/clear_register_stete.dart';

final userRepositoryProvider = Provider((ref) => UserRepository());

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
  (ref) => HomeStateNotifier(
    userRepository: ref.read(userRepositoryProvider),
  ),
);

final clearRegisterProvider =
    StateNotifierProvider<ClearRegisterStateNotifier, ClearRegisterState>(
  (ref) => ClearRegisterStateNotifier(
    userRepository: ref.read(userRepositoryProvider),
  ),
);
