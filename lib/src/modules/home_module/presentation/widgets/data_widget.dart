import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  final String title;
  final String value;

  const DataWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: AutoSizeText(title)),
            Expanded(child: AutoSizeText(value))
          ],
        ),
        const Divider()
      ],
    );
  }
}
