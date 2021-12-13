import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class ExchangeRateResponse {
  DataExchangeRate? data;
  ExchangeRateResponse({this.data});
  ExchangeRateResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] != null ? DataExchangeRate.fromJson(json['data']) : null;
  }
}

class DataExchangeRate {
  int? exchangeRate;
  DataExchangeRate({
    this.exchangeRate,
  });
  DataExchangeRate.fromJson(Map<String, dynamic> json) {
    this.exchangeRate = ParseNumber.parseInt(json['exchange_rate']);
  }
}
