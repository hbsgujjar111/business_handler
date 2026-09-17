import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../dashboard/providers/dashboard_provider.dart';

final expenseTitleControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController();
  ref.onDispose(c.dispose);
  return c;
});

final expenseAmountControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController();
  ref.onDispose(c.dispose);
  return c;
});

final selectedExpenseCategoryProvider = StateProvider.autoDispose<String>((ref) => 'Marketing & Ads');
final selectedExpensePayerProvider = StateProvider.autoDispose<String>((ref) => 'Business Wallet');

final expenseActionsProvider = Provider((ref) => ExpenseActions(ref));

class ExpenseActions {
  final Ref ref;

  ExpenseActions(this.ref);

  Future<void> submitExpense(String businessId) async {
    final title = ref.read(expenseTitleControllerProvider).text.trim();
    final amount = double.tryParse(ref.read(expenseAmountControllerProvider).text) ?? 0;
    final category = ref.read(selectedExpenseCategoryProvider);
    final paidBy = ref.read(selectedExpensePayerProvider);

    await Supabase.instance.client.from('expenses').insert({
      'business_id': businessId,
      'title': "$title ($category)",
      'expense_type': category,
      'amount': amount,
      'paid_by': paidBy,
      'is_reimbursed': paidBy == 'Business Wallet',
    });

    ref.read(dashboardFinancialsProvider.notifier).refresh();
  }
}
