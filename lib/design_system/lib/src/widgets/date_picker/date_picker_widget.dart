import 'package:date_format/date_format.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    Key? key,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);
  final Function(DateTime?) onChanged;
  final DateTime? initialValue;

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  void initState() {
    setState(() {
      date = widget.initialValue;
    });
    super.initState();
  }

  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: Colors.grey,
          onPressed: () {
            setState(() {
              date = date?.subtract(const Duration(days: 1));
              widget.onChanged(date);
            });
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 35,
          ),
        ),
        const Expanded(child: SizedBox()),
        BoxText.body(
          formatDate(
            date!,
            [
              dd,
              '/',
              mm,
              '/',
              yyyy,
              ' ',
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          color: Colors.grey,
          onPressed: () {
            setState(() {
              date = date?.add(const Duration(days: 1));
              widget.onChanged(date);
            });
          },
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
            size: 35,
          ),
        ),
      ],
    );
  }
}
