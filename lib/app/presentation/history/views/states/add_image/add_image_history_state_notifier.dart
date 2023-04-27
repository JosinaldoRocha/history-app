import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_history_app/app/presentation/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/presentation/history/views/states/add_image/add_image_history_state.dart';

class AddImageHistoryStateNotifier extends StateNotifier<AddImageHistoryState> {
  AddImageHistoryStateNotifier({required this.historyRepository})
      : super(InitialAddImageHistoryState());
  final HistoryRepository historyRepository;

  void addImage(String image) async {
    state = LoadingAddImageHistoryState();

    try {
      final result = await historyRepository.addImage(image);
      state = SuccessAddImageHistoryState(data: result);
    } catch (e) {
      state =
          FailureAddImageHistoryState(errorMessage: 'Erro ao adicionar imagem');
    }
  }
}
