import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/services/image_services.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../models/product_model.dart';
import '../providers/product_provider.dart';

class ProductFormDialog extends ConsumerWidget {
  final String businessId;
  final Product? productToEdit;

  const ProductFormDialog({super.key, required this.businessId, this.productToEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameCtrl = ref.watch(productNameCtrlProvider);
    final skuCtrl = ref.watch(productSkuCtrlProvider);
    final costCtrl = ref.watch(productCostCtrlProvider);
    final sellCtrl = ref.watch(productSellCtrlProvider);
    final stockCtrl = ref.watch(productStockCtrlProvider);
    final imageUrl = ref.watch(productFormImageProvider);
    final isUploading = ref.watch(isProductUploadingProvider);

    if (productToEdit != null && nameCtrl.text.isEmpty) {
      nameCtrl.text = productToEdit!.name;
      skuCtrl.text = productToEdit!.sku;
      costCtrl.text = productToEdit!.costPrice.toStringAsFixed(0);
      sellCtrl.text = productToEdit!.sellingPrice.toStringAsFixed(0);
      stockCtrl.text = productToEdit!.stockQuantity.toString();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (productToEdit!.imageUrl.isNotEmpty && imageUrl == null) {
          ref.read(productFormImageProvider.notifier).state = productToEdit!.imageUrl;
        }
      });
    }

    return Dialog(
      backgroundColor: KColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 460),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 14,
              children: [
                Text(
                  productToEdit == null ? "Add New Toy" : "Edit Toy",
                  style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: KColors.surfaceSubtle,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: KColors.border),
                          image: imageUrl != null && imageUrl.isNotEmpty
                              ? DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
                              : null,
                        ),
                        child: (imageUrl == null || imageUrl.isEmpty) && !isUploading
                            ? const Icon(Icons.add_a_photo_outlined, size: 36, color: KColors.textMuted)
                            : null,
                      ),
                      if (isUploading) const CircularProgressIndicator(),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: isUploading
                                ? null
                                : () async {
                                    ref.read(isProductUploadingProvider.notifier).state = true;
                                    final uploaded = await ImageUploadService.pickCompressAndUpload(businessId);
                                    ref.read(isProductUploadingProvider.notifier).state = false;
                                    if (uploaded != null) {
                                      ref.read(productFormImageProvider.notifier).state = uploaded;
                                    }
                                  },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Tap box to upload & compress photo",
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodySmall?.copyWith(color: KColors.textMuted),
                ),
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(
                    labelText: "Toy Name",
                    filled: true,
                    fillColor: KColors.surfaceSubtle,
                  ),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: skuCtrl,
                        decoration: const InputDecoration(
                          labelText: "SKU / Code",
                          filled: true,
                          fillColor: KColors.surfaceSubtle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: stockCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Stock",
                          filled: true,
                          fillColor: KColors.surfaceSubtle,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: costCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Cost Price (PKR)",
                          filled: true,
                          fillColor: KColors.surfaceSubtle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: sellCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Sale Price (PKR)",
                          filled: true,
                          fillColor: KColors.surfaceSubtle,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 10,
                  children: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                      onPressed: () async {
                        if (nameCtrl.text.isEmpty) return;
                        await ref
                            .read(productActionsProvider)
                            .saveProduct(businessId: businessId, editProductId: productToEdit?.id);
                        if (context.mounted) Navigator.pop(context);
                      },
                      child: const Text("Save Toy"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
