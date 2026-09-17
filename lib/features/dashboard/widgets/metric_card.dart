import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final double amount;
  final Color accentColor;
  final String subtitle;
  final IconData icon;

  const MetricCard({
    super.key,
    required this.title,
    required this.amount,
    required this.accentColor,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: KColors.border),
      ),
      padding: const EdgeInsets.all(18),
      child: Row(
        spacing: 16,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accentColor, size: 24),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: KColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "PKR ${amount.toStringAsFixed(0)}",
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: KColors.textPrimary,
                  ),
                ),
                Text(subtitle, style: context.textTheme.bodySmall?.copyWith(color: KColors.textMuted)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
