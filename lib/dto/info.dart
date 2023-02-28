class Info {
  final String seed;
  final int results;
  final int page;
  final String version;

  const Info({
    required this.seed,
    required this.page,
    required this.version,
    required this.results,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      seed: json['seed'],
      page: json['page'],
      version: json['version'],
      results: json['results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'seed': seed, 'page': page, 'version': version, 'results': results};
  }
}
