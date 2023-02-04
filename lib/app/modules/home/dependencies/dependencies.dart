import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/home/views/states/home_state.dart';
import 'package:my_history_app/app/modules/home/views/states/home_state_notifier.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
  (ref) => HomeStateNotifier(),
);
