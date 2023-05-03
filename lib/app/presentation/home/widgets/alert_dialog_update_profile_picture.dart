import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../../authentication/providers/authentication_providers.dart';

class AlertDialogUpdateProfilePictureWidget extends ConsumerStatefulWidget {
  const AlertDialogUpdateProfilePictureWidget({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AlertDialogUpdateProfilePictureWidgetState();
}

class _AlertDialogUpdateProfilePictureWidgetState
    extends ConsumerState<AlertDialogUpdateProfilePictureWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.start,
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
                      .updateProfilePicture(widget.user, pickedFile.path);
                }
                if (context.mounted) Navigator.of(context).pop();
              },
              child: BoxText.body('Carregar da galeria'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.transparent),
              onPressed: () async {
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  ref
                      .read(updataProfilePictureProvider.notifier)
                      .updateProfilePicture(widget.user, pickedFile.path);
                }
                if (context.mounted) Navigator.of(context).pop();
              },
              child: BoxText.body('Tirar foto'),
            ),
            if (widget.user.image.isNotEmpty)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0, backgroundColor: Colors.transparent),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        Image.network(widget.user.image),
                      ],
                    ),
                  );
                },
                child: BoxText.body('Ver foto de perfil'),
              ),
            if (widget.user.image.isNotEmpty)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0, backgroundColor: Colors.transparent),
                onPressed: () {
                  ref
                      .read(updataProfilePictureProvider.notifier)
                      .removeProfilePicture(widget.user);
                  Navigator.pop(context);
                },
                child: BoxText.body('Remover foto'),
              ),
          ],
        ),
      ],
    );
  }
}
