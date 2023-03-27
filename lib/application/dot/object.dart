class ObjectOfUniversity {
  List<String>? domains;
  String? country;
  List<String>? webPages;
  String? name;
  String? alphaTwoCode;

  ObjectOfUniversity({
    this.domains,
    this.country,
    this.webPages,
    this.name,
    this.alphaTwoCode,
  });

  ///TODO ЗАпята ctrl alt l

  ObjectOfUniversity.fromJson(Map<String, dynamic> json) {
    domains = json['domains'];
    country = json['country'];
    webPages = json['web_pages'];
    name = json['name'];
    alphaTwoCode = json['alpha_two_code'];
  }
}
