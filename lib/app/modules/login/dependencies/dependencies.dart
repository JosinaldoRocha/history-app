import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state_notifier.dart';

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(),
);
