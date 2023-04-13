import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/user_repository.dart';
import '../views/states/add_user/add_user_state.dart';
import '../views/states/add_user/add_user_state_notifier.dart';

final userRepository = Provider(
  (ref) => UserRepository(),
);

final addUserProvider =
    StateNotifierProvider<AddUserStateNotifier, AddUserState>(
  (ref) => AddUserStateNotifier(
    ref.read(userRepository),
  ),
);
