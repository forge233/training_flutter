class ProductType {
  final String productType;

  const ProductType({required this.productType});

  factory ProductType.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      final String productTypeValue = json['brand'];
      return ProductType(productType: productTypeValue);
    } else {
      final List<dynamic> brand = json as List;
      final String firstProductType = brand.first as String;
      return ProductType(productType: firstProductType);
    }
  }
}
