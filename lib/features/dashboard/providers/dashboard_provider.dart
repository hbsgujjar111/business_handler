import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/services/local_storage_service.dart';
import '../models/business.dart';
import '../models/financial_state.dart';

final businessesListProvider = FutureProvider<List<Business>>((ref) async {
  final res = await Supabase.instance.client.from('businesses').select();
  return (res as List).map((e) => Business.fromMap(e)).toList();
});

final activeBusinessProvider = StateNotifierProvider<ActiveBusinessNotifier, Business?>((ref) {
  return ActiveBusinessNotifier();
});

class ActiveBusinessNotifier extends StateNotifier<Business?> {
  ActiveBusinessNotifier() : super(null);

  void select(Business b) {
    StorageService.saveSelectedBusiness(b.id);
    state = b;
  }
}

final dashboardFinancialsProvider = StateNotifierProvider<DashboardFinancialsNotifier, FinancialState>((ref) {
  final business = ref.watch(activeBusinessProvider);
  return DashboardFinancialsNotifier(business?.id);
});

class DashboardFinancialsNotifier extends StateNotifier<FinancialState> {
  final String? businessId;
  final _supabase = Supabase.instance.client;

  DashboardFinancialsNotifier(this.businessId) : super(const FinancialState(isLoading: true)) {
    if (businessId != null) refresh();
  }

  Future<void> refresh() async {
    if (businessId == null) return;
    state = state.copyWith(isLoading: true);

    final sales = await _supabase.from('sales').select().eq('business_id', businessId!);
    final expenses = await _supabase.from('expenses').select().eq('business_id', businessId!);
    final members = await _supabase.from('business_members').select('partner_name').eq('business_id', businessId!);

    List<String> partnerNames = (members as List).map((m) => m['partner_name'] as String).toList();

    double revenue = 0, cogsOwed = 0, cogsPaid = 0;
    for (var s in sales) {
      double rev = (s['selling_price'] as num).toDouble();
      double cost = (s['toy_cost'] as num).toDouble();
      revenue += rev;
      s['is_toy_cost_paid'] == true ? cogsPaid += cost : cogsOwed += cost;
    }

    double totalExp = 0, directExp = 0, reimbursed = 0, pendingReimb = 0;
    double capitalDeposits = 0; // 👈 Track injected cash

    for (var e in expenses) {
      double amt = (e['amount'] as num).toDouble();
      String paidBy = e['paid_by'];
      String category = e['expense_type'] ?? '';
      bool isReimb = e['is_reimbursed'] ?? false;

      // 1. If it's a Capital Deposit:
      if (category == 'Capital / Wallet Deposit') {
        capitalDeposits += amt; // Adds cash directly to business
        continue; // Don't count as an operating cost or reduce profit!
      }

      // 2. Normal operational expenses:
      totalExp += amt;
      if (paidBy == 'Business Wallet') {
        directExp += amt;
      } else {
        isReimb ? reimbursed += amt : pendingReimb += amt;
      }
    }

    state = state.copyWith(
      // Wallet Cash = Sales Revenue + Injected Capital - Outflows
      walletCash: (revenue + capitalDeposits) - (cogsPaid + directExp + reimbursed),
      pendingToyCost: cogsOwed,
      pendingReimbursements: pendingReimb,
      // Profit remains accurate (Revenue - Toy Costs - Real Operating Expenses)
      reinvestedProfit: revenue - (cogsPaid + cogsOwed) - totalExp,
      partners: partnerNames,
      isLoading: false,
    );
  }

  Future<void> clearToyBills() async {
    if (businessId == null) return;
    await _supabase
        .from('sales')
        .update({'is_toy_cost_paid': true})
        .eq('business_id', businessId!)
        .eq('is_toy_cost_paid', false);
    await refresh();
  }
}
