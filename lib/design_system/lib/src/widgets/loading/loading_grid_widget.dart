import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingGridWidget extends StatelessWidget {
  const LoadingGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: const Color.fromARGB(255, 176, 174, 174),
      baseColor: LightColors().kcLightGrey,
      enabled: true,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        crossAxisSpacing: 10,
        childAspectRatio: 220 / 250,
        children: List<Widget>.generate(
          10,
          (index) => Container(
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
          ),
        ),
      ),
    );
  }
}
