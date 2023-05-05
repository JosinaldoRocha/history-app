import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/delete_user/delete_user_state.dart';
import 'package:my_history_app/app/presentation/history/data/repositories/history_repository.dart';

class DeleteUserStateNotifier extends StateNotifier<DeleteUserState> {
  DeleteUserStateNotifier({
    required this.repository,
    required this.historyRepository,
  }) : super(InitialDeleteUserState());

  final AuthenticationRepository repository;
  final HistoryRepository historyRepository;

  void deleteUser(String id) async {
    state = LoadingDeleteUserState();

    try {
      await historyRepository.deleteUserHistory(id);
      await repository.deleteUserData(id);
      await repository.deleteCurrentUser();
      state = DeletedUserState();
    } catch (e) {
      state = NotDeletedUserState(errorMessage: 'Erro ao excluir usuário');
    }
  }
}
