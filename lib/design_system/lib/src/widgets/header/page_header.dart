import 'package:flutter/material.dart';

import '../../../design_system.dart';

class PageHeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool primaryColor;
  const PageHeaderWidget(
      {Key? key, required this.title, this.subtitle, this.primaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 18, left: 24, right: 24, top: 7),
      color: !primaryColor
          ? Theme.of(context).secondaryHeaderColor
          : Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Spacing.x4),
            child: BoxText.headingThree(
              title,
            ),
          ),
          if (subtitle != null) const Space.x1(),
          BoxText.captionBold(subtitle),
        ],
      ),
    );
  }
}
