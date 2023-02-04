import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class BigCardWidget extends StatefulWidget {
  const BigCardWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.image,
    this.child,
    this.color,
    this.height,
  }) : super(key: key);
  final String title;
  final Function()? onPressed;
  final String? image;
  final Widget? child;
  final Color? color;
  final double? height;

  @override
  State<BigCardWidget> createState() => _BigCardWidgetState();
}

class _BigCardWidgetState extends State<BigCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: const Color.fromRGBO(207, 233, 248, 1),
          backgroundColor:
              widget.color ?? const Color.fromRGBO(207, 233, 248, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: widget.onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoxText.body(widget.title),
              if (widget.image != null) const Expanded(child: SizedBox()),
              if (widget.image != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PictureWidget.asset(widget.image!),
                ),
              if (widget.child != null) widget.child!,
            ],
          ),
        ),
      ),
    );
  }
}
