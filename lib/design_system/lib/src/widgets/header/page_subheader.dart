import 'package:flutter/material.dart';

class PageSubHeaderWidget extends StatelessWidget {
  final Widget child;
  final bool primaryColor;
  const PageSubHeaderWidget(
      {Key? key, required this.child, this.primaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
      ),
      color: !primaryColor
          ? Theme.of(context).secondaryHeaderColor
          : Theme.of(context).primaryColor,
      child: child,
    );
  }
}
