import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<BottomBarItem> items;
  final int selectedIndex;

  const BottomBarWidget({
    required this.onTabSelected,
    required this.items,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BottomAppBar(
        color: Theme.of(context).backgroundColor,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              widget.items.length,
              (i) {
                return _buildTabIcon(
                  index: i,
                  item: widget.items[i],
                  onPressed: widget.onTabSelected,
                  context: context,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabIcon({
    required int index,
    required BottomBarItem item,
    required ValueChanged<int> onPressed,
    required BuildContext context,
  }) {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.selectedIndex == index
                        ? LightColors.brand1
                        : const Color(0xffefefef),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: PictureWidget.asset(
                      item.icon,
                      color: widget.selectedIndex == index
                          ? Colors.white
                          : LightColors.brand1,
                    ),
                  ),
                ),
                const Space.x2(),
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
