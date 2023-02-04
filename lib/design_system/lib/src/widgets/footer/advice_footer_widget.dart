import 'package:flutter/material.dart';

import '../../../design_system.dart';

class AdviceFooterWidget extends StatelessWidget {
  const AdviceFooterWidget(
      {Key? key, this.primaryColor = false, required this.adviceText})
      : super(key: key);

  final String adviceText;
  final bool primaryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).disabledColor.withOpacity(0.2),
          child: Icon(
            Icons.lock_outline_rounded,
            color: Theme.of(context).secondaryHeaderColor,
            size: 26,
          ),
        ),
        const Flexible(
          flex: 1,
          child: SizedBox(
            width: 15,
          ),
        ),
        Flexible(
          flex: 8,
          child: BoxText.midCaption(
            adviceText,
            color: Theme.of(context).disabledColor,
          ),
        ),
      ],
    );
  }
}
