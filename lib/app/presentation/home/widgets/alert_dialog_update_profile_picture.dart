import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../../authentication/dependencies/dependencies.dart';

class AlertDialogUpdateProfilePictureWidget extends ConsumerWidget {
  const AlertDialogUpdateProfilePictureWidget({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.start,
      alignment: Alignment.topLeft,
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              onPressed: () async {
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  ref
                      .read(updataProfilePictureProvider.notifier)
                      .load(user, pickedFile.path);
                }
                Navigator.pop(context);
              },
              child: BoxText.body('Carregar'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.transparent),
              onPressed: () async {
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  ref
                      .read(updataProfilePictureProvider.notifier)
                      .load(user, pickedFile.path);
                }
                Navigator.pop(context);
              },
              child: BoxText.body('Tirar foto'),
            ),
          ],
        ),
      ],
    );
  }
}
