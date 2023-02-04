import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.primaryColor = false,
    this.hasHeader = false,
    this.actions = const <Widget>[],
    this.onTapLogo,
    this.title,
    this.elevation = 0,
  }) : super(key: key);

  final String? title;

  final double elevation;

  final bool primaryColor;
  final bool hasHeader;
  final List<Widget> actions;

  final void Function()? onTapLogo;

  @override
  Size get preferredSize => !hasHeader
      ? const Size.fromHeight(kToolbarHeight)
      : const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 0.0,
      elevation: elevation,
      shadowColor: !primaryColor
          ? Theme.of(context).secondaryHeaderColor
          : Theme.of(context).primaryColor,
      backgroundColor:
          !primaryColor ? Colors.white : Theme.of(context).primaryColor,
      leading: Navigator.canPop(context)
          ? IconButton(
              color: LightColors().kcPrimary,
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      centerTitle: true,
      title: title == null
          ? Row(
              children: [
                SizedBox(
                  height: 170,
                  width: 170,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InkWell(onTap: onTapLogo, child: const Text('Logo')),
                  ),
                ),
              ],
            )
          : Text(
              title!,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
      actions: actions,
    );
  }
}
