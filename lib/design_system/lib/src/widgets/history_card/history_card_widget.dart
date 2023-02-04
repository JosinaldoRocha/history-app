import 'package:flutter/material.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    Key? key,
    required this.date,
    required this.clickCard,
    required this.image,
    this.contentEmphasis = true,
  }) : super(key: key);

  final String date;
  final String image;
  final Function() clickCard;
  final bool contentEmphasis;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickCard,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  package: 'design_system',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff828282),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
