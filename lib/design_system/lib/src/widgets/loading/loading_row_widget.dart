import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingRowWidget extends StatelessWidget {
  const LoadingRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: const Color.fromARGB(255, 176, 174, 174),
      baseColor: LightColors().kcLightGrey,
      enabled: true,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          width: 220,
          margin: const EdgeInsets.only(right: 32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
        ),
      ),
    );
  }
}
