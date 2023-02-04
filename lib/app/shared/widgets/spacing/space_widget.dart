import 'package:flutter/material.dart';
import 'package:my_history_app/app/shared/widgets/spacing/spacing.dart';

class Space extends StatelessWidget {
  final double height;

  const Space.x1({Key? key})
      : height = Spacing.x1,
        super(key: key);
  const Space.x2({Key? key})
      : height = Spacing.x2,
        super(key: key);
  const Space.x3({Key? key})
      : height = Spacing.x3,
        super(key: key);
  const Space.x4({Key? key})
      : height = Spacing.x4,
        super(key: key);
  const Space.x5({Key? key})
      : height = Spacing.x5,
        super(key: key);
  const Space.x6({Key? key})
      : height = Spacing.x6,
        super(key: key);
  const Space.x7({Key? key})
      : height = Spacing.x7,
        super(key: key);
  const Space.x8({Key? key})
      : height = Spacing.x8,
        super(key: key);
  const Space.x9({Key? key})
      : height = Spacing.x9,
        super(key: key);
  const Space.x10({Key? key})
      : height = Spacing.x10,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
