class Currency {
  final int r030;
  final String txt;
  final double rate;
  final String cc;
  final String exchangedate;

  Currency({
    required this.r030,
    required this.txt,
    required this.rate,
    required this.cc,
    required this.exchangedate,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      r030: json['r030'],
      txt: json['txt'],
      rate: json['rate'],
      cc: json['cc'],
      exchangedate: json['exchangedate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['r030'] = r030;
    data['txt'] = txt;
    data['rate'] = rate;
    data['cc'] = cc;
    data['exchangedate'] = exchangedate;
    return data;
  }
}
