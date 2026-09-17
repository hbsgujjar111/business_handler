import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../dashboard/providers/dashboard_provider.dart';
import '../../products/models/product_model.dart';

final selectedProductProvider = StateProvider.autoDispose<Product?>((ref) => null);

final saleQtyControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController(text: "1");
  ref.onDispose(c.dispose);
  return c;
});

final salePriceControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController();
  ref.onDispose(c.dispose);
  return c;
});

final saleCostControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController();
  ref.onDispose(c.dispose);
  return c;
});

final saleActionsProvider = Provider((ref) => SaleActions(ref));

class SaleActions {
  final Ref ref;

  SaleActions(this.ref);

  void onSelectProduct(Product? product) {
    ref.read(selectedProductProvider.notifier).state = product;
    if (product != null) {
      final qty = int.tryParse(ref.read(saleQtyControllerProvider).text) ?? 1;
      ref.read(salePriceControllerProvider).text = (product.sellingPrice * qty).toStringAsFixed(0);
      ref.read(saleCostControllerProvider).text = (product.costPrice * qty).toStringAsFixed(0);
    }
  }

  void recalculateByQuantity(String qtyText) {
    final product = ref.read(selectedProductProvider);
    if (product != null) {
      final qty = int.tryParse(qtyText) ?? 1;
      ref.read(salePriceControllerProvider).text = (product.sellingPrice * qty).toStringAsFixed(0);
      ref.read(saleCostControllerProvider).text = (product.costPrice * qty).toStringAsFixed(0);
    }
  }

  Future<void> submitSale(String businessId) async {
    final product = ref.read(selectedProductProvider);
    final qty = int.tryParse(ref.read(saleQtyControllerProvider).text) ?? 1;
    final sell = double.tryParse(ref.read(salePriceControllerProvider).text) ?? 0;
    final cost = double.tryParse(ref.read(saleCostControllerProvider).text) ?? 0;

    await Supabase.instance.client.from('sales').insert({
      'business_id': businessId,
      'product_id': product?.id,
      'toy_name': product?.name ?? 'Manual Sale',
      'quantity': qty,
      'selling_price': sell,
      'toy_cost': cost,
    });

    ref.read(dashboardFinancialsProvider.notifier).refresh();
  }
}
