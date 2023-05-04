import 'package:flutter/material.dart';

import '../texts/box_text.dart';

class DropdownButtonFormFieldWidget extends StatefulWidget {
  const DropdownButtonFormFieldWidget({
    Key? key,
    required this.items,
    required this.controller,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);
  final List<String> items;
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  @override
  State<DropdownButtonFormFieldWidget> createState() =>
      _DropdownButtonFormFieldWidgetState();
}

class _DropdownButtonFormFieldWidgetState
    extends State<DropdownButtonFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxText.body(widget.labelText),
          const SizedBox(height: 10),
          DropdownButtonFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Selecione um valor';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Color(0xffc1bcbc),
                fontSize: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black45),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            borderRadius: BorderRadius.circular(10),
            value: (widget.controller.text.isEmpty)
                ? null
                : widget.controller.text,
            items: widget.items.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (selectedItem) {
              setState(() {
                widget.controller.text = selectedItem!;
              });
            },
            // onTap: () {
            //   showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         content: Container(
            //           width: double.maxFinite,
            //           child: ListView.builder(
            //             shrinkWrap: true,
            //             itemCount: widget.items.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               return InkWell(
            //                 onTap: () {
            //                   setState(() {
            //                     widget.controller.text = widget.items[index];
            //                   });
            //                   Navigator.of(context).pop();
            //                   Navigator.of(context).pop();
            //                 },
            //                 child: Padding(
            //                   padding:
            //                       const EdgeInsets.symmetric(vertical: 8.0),
            //                   child: Text(widget.items[index]),
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       );
            //     },
            //   );
            // },
          ),
        ],
      ),
    );
  }
}
