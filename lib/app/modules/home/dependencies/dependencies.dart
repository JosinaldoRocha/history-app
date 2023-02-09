import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/home/views/states/home_state.dart';
import 'package:my_history_app/app/modules/home/views/states/home_state_notifier.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/register_repository.dart';
import '../../register/views/states/clear_register/clear_register_state_notifier.dart';
import '../../register/views/states/clear_register/clear_register_stete.dart';

final registerRepositoryProvider = Provider((ref) => RegisterRepository());

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
  (ref) => HomeStateNotifier(
    registerRepository: ref.read(registerRepositoryProvider),
  ),
);

final clearRegisterProvider =
    StateNotifierProvider<ClearRegisterStateNotifier, ClearRegisterState>(
  (ref) => ClearRegisterStateNotifier(
    registerRepository: ref.read(registerRepositoryProvider),
  ),
);
