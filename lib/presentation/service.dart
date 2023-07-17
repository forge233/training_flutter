import 'dart:convert';
import 'package:http/http.dart' as http;
import '../application/dot/currency.dart';
import '../application/dot/result.dart';

class ServiceJson {
  static Future<List<Result>> fetchDataToDto() async {
    String url = 'https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json';


    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);

    final List<Result> result = List<Result>.from(responseData.map((json) {
      return Result(
        currencyData: Currency.fromJson(json),
      );
    }));

    return result;
  }
}
