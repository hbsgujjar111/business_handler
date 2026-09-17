import 'package:flutter/material.dart';

import '../../../utils/extensions/context_extensions.dart';

class KCheckbox extends StatelessWidget {
  const KCheckbox({super.key, required this.title, required this.value, required this.onChanged});

  final String title;
  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(value: value, onChanged: onChanged, visualDensity: VisualDensity(horizontal: -4, vertical: -4)),
          Text(title, style: context.textTheme.titleSmall, textDirection: TextDirection.rtl),
        ],
      ),
    );
  }
}
