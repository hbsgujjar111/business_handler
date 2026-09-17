class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double costPrice;
  final double sellingPrice;
  final int stockQuantity;
  final String sku;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.costPrice,
    required this.sellingPrice,
    required this.stockQuantity,
    required this.sku,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'] ?? '',
      imageUrl: map['image_url'] ?? '',
      costPrice: (map['cost_price'] as num).toDouble(),
      sellingPrice: (map['selling_price'] as num).toDouble(),
      stockQuantity: map['stock_quantity'] ?? 0,
      sku: map['sku'] ?? '',
    );
  }
}
