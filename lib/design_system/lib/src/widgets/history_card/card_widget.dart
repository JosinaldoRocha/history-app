import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatefulWidget {
  const CustomCardWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.image,
    this.child,
    this.color,
    required this.height,
    required this.width,
  }) : super(key: key);
  final String title;
  final Function()? onPressed;
  final String? image;
  final Widget? child;
  final Color? color;
  final double width;
  final double height;

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.image != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PictureWidget.asset(widget.image!),
                ),
              BoxText.body(widget.title),
            ],
          ),
        ),
      ),
    );
  }
}
