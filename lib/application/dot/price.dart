class Price {
  final String price;

  Price({required this.price});

  factory Price.fromJson(dynamic json) {
    if (json is String) {
      return Price(price: json);
    } else {
      final List<dynamic> price = json as List<dynamic>;
      final String firstPrice = price.first as String;
      return Price(price: firstPrice);
    }
  }
}
