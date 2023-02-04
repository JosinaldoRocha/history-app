import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class BudgetCardWidget extends StatelessWidget {
  const BudgetCardWidget({
    Key? key,
    required this.title,
    required this.clickCard,
    required this.imageUrl,
    required this.message,
    this.contentEmphasis = true,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String message;
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
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff828282),
                      ),
                    ),
                  ),
                  const Space.x1(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      message,
                      style: TextStyle(
                        color: contentEmphasis
                            ? const Color(0xffE8BA78)
                            : const Color(0xff828282),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
