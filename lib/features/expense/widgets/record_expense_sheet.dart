import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../dashboard/providers/dashboard_provider.dart';
import '../providers/expense_form_provider.dart';

class RecordExpenseSheet extends ConsumerWidget {
  final String businessId;

  const RecordExpenseSheet({super.key, required this.businessId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleCtrl = ref.watch(expenseTitleControllerProvider);
    final amtCtrl = ref.watch(expenseAmountControllerProvider);
    final selectedCategory = ref.watch(selectedExpenseCategoryProvider);
    final selectedPayer = ref.watch(selectedExpensePayerProvider);
    final partners = ref.watch(dashboardFinancialsProvider).partners;

    final categories = [
      'Capital / Wallet Deposit',
      'Marketing & Ads',
      'Courier & Shipping',
      'Packaging',
      'Tech & Hosting',
      'Shop Misc',
    ];
    final payers = ['Business Wallet', ...partners];

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: KColors.surface,
          borderRadius: context.isMobile
              ? const BorderRadius.vertical(top: Radius.circular(20))
              : BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            Text("Record Store Expense", style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: const InputDecoration(labelText: "Expense Category"),
              items: categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (val) => ref.read(selectedExpenseCategoryProvider.notifier).state = val!,
            ),
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: amtCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount (PKR)"),
            ),
            DropdownButtonFormField<String>(
              initialValue: payers.contains(selectedPayer) ? selectedPayer : 'Business Wallet',
              decoration: const InputDecoration(labelText: "Paid By"),
              items: payers.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: (val) => ref.read(selectedExpensePayerProvider.notifier).state = val!,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: KColors.expense,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () async {
                await ref.read(expenseActionsProvider).submitExpense(businessId);
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text("Save Expense"),
            ),
          ],
        ),
      ),
    );
  }
}
