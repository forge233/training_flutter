class Brand {
  final String brand;

  const Brand({required this.brand});

  factory Brand.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      final String brandValue = json['brand'];
      return Brand(brand: brandValue);
    } else {
      final List<dynamic> brand = json as List;
      final String firstBrand = brand.first as String;
      return Brand(brand: firstBrand);
    }
  }
}
