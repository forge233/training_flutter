class Country {
  final String country;

  const Country({required this.country});

  factory Country.fromJson(dynamic json) {
    if (json is String) {
      return Country(country: json);
    } else {
      final List<dynamic> country = json as List<dynamic>;
      final String firstCountry = country.first as String;
      return Country(country: firstCountry);
    }
  }
}
