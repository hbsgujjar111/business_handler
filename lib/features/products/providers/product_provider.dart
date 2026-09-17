import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/product_model.dart';

final productsListProvider = FutureProvider.family<List<Product>, String>((ref, businessId) async {
  final res = await Supabase.instance.client
      .from('products')
      .select()
      .eq('business_id', businessId)
      .order('created_at', ascending: true);
  return (res as List).map((e) => Product.fromMap(e)).toList();
});

final productFormImageProvider = StateProvider.autoDispose<String?>((ref) => null);
final isProductUploadingProvider = StateProvider.autoDispose<bool>((ref) => false);

final productNameCtrlProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController();
  ref.onDispose(c.dispose);
  return c;
});

final productSkuCtrlProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController();
  ref.onDispose(c.dispose);
  return c;
});

final productCostCtrlProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController();
  ref.onDispose(c.dispose);
  return c;
});

final productSellCtrlProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController();
  ref.onDispose(c.dispose);
  return c;
});

final productStockCtrlProvider = Provider.autoDispose<TextEditingController>((ref) {
  final c = TextEditingController(text: "10");
  ref.onDispose(c.dispose);
  return c;
});

final productActionsProvider = Provider((ref) => ProductActions(ref));

class ProductActions {
  final Ref ref;

  ProductActions(this.ref);

  void prepareForEdit(Product product) {
    ref.read(productNameCtrlProvider).text = product.name;
    ref.read(productSkuCtrlProvider).text = product.sku;
    ref.read(productCostCtrlProvider).text = product.costPrice.toStringAsFixed(0);
    ref.read(productSellCtrlProvider).text = product.sellingPrice.toStringAsFixed(0);
    ref.read(productStockCtrlProvider).text = product.stockQuantity.toString();
    ref.read(productFormImageProvider.notifier).state = product.imageUrl.isEmpty ? null : product.imageUrl;
  }

  Future<void> saveProduct({required String businessId, String? editProductId}) async {
    final payload = {
      'business_id': businessId,
      'name': ref.read(productNameCtrlProvider).text.trim(),
      'sku': ref.read(productSkuCtrlProvider).text.trim(),
      'cost_price': double.tryParse(ref.read(productCostCtrlProvider).text) ?? 0,
      'selling_price': double.tryParse(ref.read(productSellCtrlProvider).text) ?? 0,
      'stock_quantity': int.tryParse(ref.read(productStockCtrlProvider).text) ?? 0,
      'image_url': ref.read(productFormImageProvider) ?? '',
    };

    if (editProductId == null) {
      await Supabase.instance.client.from('products').insert(payload);
    } else {
      await Supabase.instance.client.from('products').update(payload).eq('id', editProductId);
    }

    ref.invalidate(productsListProvider(businessId));
  }

  Future<void> deleteProduct({required String businessId, required String productId}) async {
    await Supabase.instance.client.from('products').delete().eq('id', productId);
    ref.invalidate(productsListProvider(businessId));
  }
}
