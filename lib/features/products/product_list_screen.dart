import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants/colors.dart';
import '../../utils/extensions/context_extensions.dart';
import 'providers/product_provider.dart';
import 'widgets/add_product_dialog.dart';

class ProductsListScreen extends ConsumerWidget {
  final String businessId;

  const ProductsListScreen({super.key, required this.businessId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsListProvider(businessId));

    return Scaffold(
      backgroundColor: KColors.background,
      appBar: AppBar(
        title: const Text("Toy Catalog"),
        backgroundColor: KColors.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: KColors.primary),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => ProductFormDialog(businessId: businessId),
            ),
          ),
        ],
      ),
      body: productsAsync.when(
        data: (products) {
          if (products.isEmpty) {
            return const Center(child: Text("No products added yet."));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final p = products[index];
              return Container(
                color: KColors.surface,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Row(
                  spacing: 12,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: KColors.surfaceSubtle,
                        borderRadius: BorderRadius.circular(10),
                        image: p.imageUrl.isNotEmpty
                            ? DecorationImage(image: NetworkImage(p.imageUrl), fit: BoxFit.cover)
                            : null,
                      ),
                      child: p.imageUrl.isEmpty ? const Icon(Icons.toys_outlined, color: KColors.textMuted) : null,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2,
                        children: [
                          Text(p.name, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                          Text(
                            "Cost: PKR ${p.costPrice.toStringAsFixed(0)} | Sell: PKR ${p.sellingPrice.toStringAsFixed(0)}",
                            style: context.textTheme.bodySmall?.copyWith(color: KColors.textSecondary),
                          ),
                          Text(
                            "Stock: ${p.stockQuantity} units ${p.sku.isNotEmpty ? '• SKU: ${p.sku}' : ''}",
                            style: context.textTheme.bodySmall?.copyWith(color: KColors.cash),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit_outlined, size: 20, color: KColors.textSecondary),
                      onPressed: () {
                        ref.read(productActionsProvider).prepareForEdit(p);
                        showDialog(
                          context: context,
                          builder: (_) => ProductFormDialog(businessId: businessId, productToEdit: p),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 20, color: KColors.expense),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Delete Toy"),
                          content: Text("Are you sure you want to delete '${p.name}'?"),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: KColors.expense),
                              onPressed: () async {
                                await ref
                                    .read(productActionsProvider)
                                    .deleteProduct(businessId: businessId, productId: p.id);
                                if (ctx.mounted) Navigator.pop(ctx);
                              },
                              child: const Text("Delete", style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );
  }
}
