class WebPage {
  final String webPage;

  const WebPage({required this.webPage});

  factory WebPage.fromJson(dynamic json) {
    if (json is String) {
      return WebPage(webPage: json);
    } else {
      final List<dynamic> webPages = json as List<dynamic>;
      final String firstWebPage = webPages.first as String;
      return WebPage(webPage: firstWebPage);
    }
  }
}
