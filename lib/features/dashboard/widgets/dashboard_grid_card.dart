import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';

class DashboardGridCard extends StatelessWidget {
  final String title;
  final double amount;
  final Color color;
  final IconData icon;

  const DashboardGridCard({
    super.key,
    required this.title,
    required this.amount,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: KColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: KColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textTheme.bodySmall?.copyWith(color: KColors.textSecondary, fontWeight: FontWeight.w600),
              ),
              Icon(icon, size: 16, color: color),
            ],
          ),
          Text(
            "PKR ${amount.toStringAsFixed(0)}",
            style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}
