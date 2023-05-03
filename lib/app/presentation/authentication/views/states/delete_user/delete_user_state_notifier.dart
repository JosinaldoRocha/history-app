import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/delete_user/delete_user_state.dart';

class DeleteUserStateNotifier extends StateNotifier<DeleteUserState> {
  DeleteUserStateNotifier({required this.repository})
      : super(InitialDeleteUserState());

  final AuthenticationRepository repository;

  void deleteUser(String id) async {
    state = LoadingDeleteUserState();

    try {
      await repository.deleteUserData(id);
      await repository.deleteCurrentUser();
      state = DeletedUserState();
    } catch (e) {
      state = NotDeletedUserState(errorMessage: 'Erro ao excluir usuário');
    }
  }
}
