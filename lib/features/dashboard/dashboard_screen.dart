import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/services/local_storage_service.dart';
import '../../utils/constants/colors.dart';
import '../../utils/extensions/context_extensions.dart';
import '../authentication/providers/auth_provider.dart';
import '../expense/widgets/record_expense_sheet.dart';
import '../products/providers/product_provider.dart';
import '../products/widgets/add_product_dialog.dart';
import '../sales/widgets/record_sale_sheet.dart';
import 'models/business.dart';
import 'providers/dashboard_provider.dart';
import 'widgets/dashboard_grid_card.dart';
import 'widgets/dashboard_product_row.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  void _openResponsiveSheet(BuildContext context, Widget child) {
    if (context.isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: child,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => Dialog(backgroundColor: Colors.transparent, child: child),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessesAsync = ref.watch(businessesListProvider);
    final activeBusiness = ref.watch(activeBusinessProvider);
    final state = ref.watch(dashboardFinancialsProvider);
    final notifier = ref.read(dashboardFinancialsProvider.notifier);

    return businessesAsync.when(
      data: (businesses) {
        if (businesses.isEmpty) {
          return const Scaffold(body: Center(child: Text("No business linked to this account.")));
        }

        if (activeBusiness == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final savedId = StorageService.getSelectedBusiness();
            final initial = businesses.firstWhere((b) => b.id == savedId, orElse: () => businesses.first);
            ref.read(activeBusinessProvider.notifier).select(initial);
          });
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final productsAsync = ref.watch(productsListProvider(activeBusiness.id));

        return Scaffold(
          backgroundColor: KColors.background,
          appBar: AppBar(
            backgroundColor: KColors.surface,
            elevation: 0,
            title: DropdownButtonHideUnderline(
              child: DropdownButton<Business>(
                value: businesses.firstWhere((b) => b.id == activeBusiness.id),
                items: businesses.map<DropdownMenuItem<Business>>((Business b) {
                  return DropdownMenuItem<Business>(
                    value: b,
                    child: Text(b.name, style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  );
                }).toList(),
                onChanged: (Business? val) {
                  if (val != null) ref.read(activeBusinessProvider.notifier).select(val);
                },
              ),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.refresh_rounded), onPressed: notifier.refresh),
              IconButton(
                icon: const Icon(Icons.logout_rounded),
                onPressed: () async {
                  await ref.read(authNotifierProvider.notifier).signOut();
                  if (context.mounted) context.go('/login');
                },
              ),
            ],
          ),
          body: Skeletonizer(
            enabled: state.isLoading,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 16,
                  children: [
                    GridView.count(
                      crossAxisCount: context.isMobile ? 2 : 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisExtent: 120,
                      children: [
                        DashboardGridCard(
                          title: "Wallet Cash",
                          amount: state.walletCash,
                          color: KColors.cash,
                          icon: Icons.account_balance_wallet_rounded,
                        ),
                        DashboardGridCard(
                          title: "Owed for Toys",
                          amount: state.pendingToyCost,
                          color: KColors.debt,
                          icon: Icons.inventory_2_rounded,
                        ),
                        DashboardGridCard(
                          title: "Owed to Partners",
                          amount: state.pendingReimbursements,
                          color: KColors.reimbursement,
                          icon: Icons.receipt_long_rounded,
                        ),
                        DashboardGridCard(
                          title: "Retained Profit",
                          amount: state.reinvestedProfit,
                          color: KColors.profit,
                          icon: Icons.trending_up_rounded,
                        ),
                      ],
                    ),

                    // --- 2. ACTION BUTTONS ROW ---
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: KColors.profit,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            icon: const Icon(Icons.add_shopping_cart_rounded, size: 18),
                            label: const Text("Record Sale"),
                            onPressed: () =>
                                _openResponsiveSheet(context, RecordSaleSheet(businessId: activeBusiness.id)),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: KColors.expense,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            icon: const Icon(Icons.remove_circle_outline_rounded, size: 18),
                            label: const Text("Add Expense"),
                            onPressed: () =>
                                _openResponsiveSheet(context, RecordExpenseSheet(businessId: activeBusiness.id)),
                          ),
                        ),
                        if (state.pendingToyCost > 0)
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: KColors.debt,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              icon: const Icon(Icons.check_circle_outline, size: 18),
                              label: const Text("Settle Supplier"),
                              onPressed: notifier.clearToyBills,
                            ),
                          ),
                      ],
                    ),

                    // --- 3. INLINE PRODUCT CATALOG SECTION ---
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: KColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: KColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 12,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Product Catalog",
                                style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextButton.icon(
                                style: TextButton.styleFrom(foregroundColor: KColors.primary),
                                icon: const Icon(Icons.add, size: 18),
                                label: const Text("Add Product"),
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (_) => ProductFormDialog(businessId: activeBusiness.id),
                                ),
                              ),
                            ],
                          ),
                          productsAsync.when(
                            data: (products) {
                              if (products.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 24),
                                  child: Center(child: Text("No products in catalog yet. Tap '+ Add Product' above.")),
                                );
                              }
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: products.length,
                                separatorBuilder: (_, _) => const Divider(height: 1, color: KColors.surfaceSubtle),
                                itemBuilder: (context, index) =>
                                    DashboardProductRow(product: products[index], businessId: activeBusiness.id),
                              );
                            },
                            loading: () => const Center(
                              child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator()),
                            ),
                            error: (e, _) => Text("Failed to load products: $e"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text("Error: $e"))),
    );
  }
}
