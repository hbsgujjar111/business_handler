import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../products/models/product_model.dart';
import '../../products/providers/product_provider.dart';
import '../providers/sale_form_provider.dart';

class RecordSaleSheet extends ConsumerWidget {
  final String businessId;

  const RecordSaleSheet({super.key, required this.businessId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsListProvider(businessId));
    final selectedProduct = ref.watch(selectedProductProvider);
    final qtyCtrl = ref.watch(saleQtyControllerProvider);
    final sellCtrl = ref.watch(salePriceControllerProvider);
    final costCtrl = ref.watch(saleCostControllerProvider);
    final actions = ref.read(saleActionsProvider);

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
            Text("Record Customer Sale", style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            productsAsync.when(
              data: (products) => DropdownButtonFormField<Product>(
                initialValue: selectedProduct,
                hint: const Text("Select Product from Catalog"),
                isExpanded: true,
                items: products.map((p) {
                  return DropdownMenuItem<Product>(
                    value: p,
                    child: Row(
                      spacing: 10,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: p.imageUrl.isNotEmpty
                                ? DecorationImage(image: NetworkImage(p.imageUrl), fit: BoxFit.cover)
                                : null,
                            color: KColors.surfaceSubtle,
                          ),
                          child: p.imageUrl.isEmpty
                              ? const Icon(Icons.image, size: 16, color: KColors.textMuted)
                              : null,
                        ),
                        Expanded(child: Text("${p.name} (Stock: ${p.stockQuantity})")),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: actions.onSelectProduct,
              ),
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const Text("Failed to load catalog"),
            ),
            if (selectedProduct != null && selectedProduct.imageUrl.isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(selectedProduct.imageUrl, height: 80, width: 80, fit: BoxFit.cover),
                ),
              ),
            TextField(
              controller: qtyCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Quantity", filled: true, fillColor: KColors.surfaceSubtle),
              onChanged: actions.recalculateByQuantity,
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: TextField(
                    controller: sellCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Total Sale (PKR)",
                      filled: true,
                      fillColor: KColors.surfaceSubtle,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: costCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Toy Cost (PKR)",
                      filled: true,
                      fillColor: KColors.surfaceSubtle,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: KColors.profit,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () async {
                await actions.submitSale(businessId);
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text("Confirm Sale"),
            ),
          ],
        ),
      ),
    );
  }
}
