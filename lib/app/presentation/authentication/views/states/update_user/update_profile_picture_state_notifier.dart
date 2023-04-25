import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/user_repository.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/update_user/update_profile_picture_state.dart';
import '../../../data/models/user_model.dart';

class UpdateProfilePictureStateNotifier
    extends StateNotifier<UpdateProfilePictureState> {
  UpdateProfilePictureStateNotifier({required this.userRepository})
      : super(InitialUpdateProfilePictureState());
  final UserRepository userRepository;

  void load(UserModel user, String image) async {
    state = LoadingUpdateProfilePictureState();
    try {
      await userRepository.updateProfilePicture(user, image);
      final result = await userRepository.getCurrentUser();
      state = SuccessUpdateProfilePictureState(data: result);
    } catch (e) {
      state = FailureUpdateProfilePictureState(
          errorMessage: 'Erro ao carregar imagem.');
    }
  }
}
