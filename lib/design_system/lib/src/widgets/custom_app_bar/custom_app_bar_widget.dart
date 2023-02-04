import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: title,
      elevation: 0.5,
      actions: [
        IconButton(
          onPressed: () {},
          icon: PictureWidget.asset(IconsConstants.google),
        ),
        IconButton(
          onPressed: () {},
          icon: PictureWidget.asset(IconsConstants.google),
        ),
      ],
    );
  }
}
