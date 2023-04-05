class Name {
  final String name;

  const Name({required this.name});

  factory Name.fromJson(dynamic json) {
    if (json is String) {
      return Name(name: json);
    } else {
      final List<dynamic> name = json as List<dynamic>;
      final String firstName = name.first as String;
      return Name(name: firstName);
    }
  }
}
