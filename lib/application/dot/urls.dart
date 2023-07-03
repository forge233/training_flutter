class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String small_s3;

  const Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.small_s3,
  });

  factory Urls.fromJson(dynamic json) {
    return Urls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
      small_s3: json['small_s3'],
    );
  }
}
