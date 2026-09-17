import 'package:flutter/material.dart';

import '../../../utils/extensions/context_extensions.dart';

class RowText extends StatelessWidget {
  const RowText({super.key, required this.leadingText, required this.trailingText});

  final String leadingText;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Expanded(child: Text(leadingText, style: context.textTheme.bodySmall)),
        Text(trailingText, style: context.textTheme.bodySmall),
      ],
    );
  }
}
