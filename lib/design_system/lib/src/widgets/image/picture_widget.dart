import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class PictureWidget {
  PictureWidget._();
  static Widget asset(String image,
      {Color? color, AnimationController? animationController, BoxFit? fit}) {
    if (image.contains('.svg')) {
      return SvgPicture.asset(
        image,
        package: 'design_system',
        color: color,
        fit: fit ?? BoxFit.contain,
      );
    }

    if (image.contains('.json')) {
      return Lottie.asset(
        image,
        package: 'design_system',
      );
    }
    return Image.asset(
      image,
      package: 'design_system',
      fit: BoxFit.contain,
      color: color,
    );
  }

  static Widget circle(String? file, {Color? color}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            file ?? '',
            package: 'design_system',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
