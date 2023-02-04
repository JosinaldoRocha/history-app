import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/register_repository.dart';
import 'package:my_history_app/app/modules/register/views/states/register_state.dart';
import 'package:my_history_app/app/modules/register/views/states/register_state_notifier.dart';

final registerRepository = Provider(
  (ref) => RegisterRepository(),
);

final registerProvider =
    StateNotifierProvider<RegisterStateNotifier, RegisterState>(
  (ref) => RegisterStateNotifier(
    ref.read(registerRepository),
  ),
);
