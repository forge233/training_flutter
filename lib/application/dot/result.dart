import 'package:exchange_currency/application/dot/currency.dart';

class Result {
  final Currency currencyData;

  Result({required this.currencyData});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      currencyData: Currency.fromJson(json['currencyData']),
    );
  }

  Result copyWith({bool? exchangeStateVisibility}) {
    return Result(
      currencyData: currencyData,
    );
  }
}

