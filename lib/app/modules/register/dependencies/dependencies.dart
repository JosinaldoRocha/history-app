import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/register_repository.dart';

import '../views/states/add_register/add_register_state.dart';
import '../views/states/add_register/add_register_state_notifier.dart';

final registerRepository = Provider(
  (ref) => RegisterRepository(),
);

final addRegisterProvider =
    StateNotifierProvider<AddRegisterStateNotifier, AddRegisterState>(
  (ref) => AddRegisterStateNotifier(
    ref.read(registerRepository),
  ),
);
