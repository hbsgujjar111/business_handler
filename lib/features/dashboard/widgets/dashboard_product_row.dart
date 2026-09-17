import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../products/models/product_model.dart';
import '../../products/providers/product_provider.dart';
import '../../products/widgets/add_product_dialog.dart';

class DashboardProductRow extends ConsumerWidget {
  final Product product;
  final String businessId;

  const DashboardProductRow({super.key, required this.product, required this.businessId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        spacing: 10,
        children: [
          // Product Thumbnail
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: KColors.surfaceSubtle,
              borderRadius: BorderRadius.circular(8),
              image: product.imageUrl.isNotEmpty
                  ? DecorationImage(image: NetworkImage(product.imageUrl), fit: BoxFit.cover)
                  : null,
            ),
            child: product.imageUrl.isEmpty
                ? const Icon(Icons.toys_outlined, size: 20, color: KColors.textMuted)
                : null,
          ),

          // Product Details (Auto-wraps on small screens)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                Wrap(
                  spacing: 6,
                  runSpacing: 2,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "Cost: ${product.costPrice.toStringAsFixed(0)}",
                      style: context.textTheme.bodySmall?.copyWith(color: KColors.textMuted),
                    ),
                    Text(
                      "Sell: PKR ${product.sellingPrice.toStringAsFixed(0)}",
                      style: context.textTheme.bodySmall?.copyWith(color: KColors.cash, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: product.stockQuantity > 3
                            ? KColors.profit.withValues(alpha: .1)
                            : KColors.expense.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "${product.stockQuantity} in stock",
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: product.stockQuantity > 3 ? KColors.profit : KColors.expense,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Actions
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.edit_outlined, size: 18, color: KColors.textSecondary),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => ProductFormDialog(businessId: businessId, productToEdit: product),
              );
            },
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.delete_outline, size: 18, color: KColors.expense),
            onPressed: () =>
                ref.read(productActionsProvider).deleteProduct(businessId: businessId, productId: product.id),
          ),
        ],
      ),
    );
  }
}
