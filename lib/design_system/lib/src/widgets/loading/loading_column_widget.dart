import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingColumnWidget extends StatelessWidget {
  const LoadingColumnWidget({
    Key? key,
    this.height = 150,
    this.count = 6,
  }) : super(key: key);

  final double height;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: const Color.fromARGB(255, 176, 174, 174),
      baseColor: LightColors().kcLightGrey,
      enabled: true,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ).copyWith(bottom: 0),
        itemCount: count,
        itemBuilder: (context, index) => Container(
          height: height,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
        ),
      ),
    );
  }
}
