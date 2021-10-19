import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class ExchangeRateResponse{
  DataExchangeRate ? data;
  ExchangeRateResponse({this.data});
  ExchangeRateResponse.fromJson(Map<String, dynamic> json){
    this.data = json['data'] != null ? DataExchangeRate.fromJson(json['data']) : null;
  }

}

class DataExchangeRate{
  int? exchange_rate;
  DataExchangeRate({
     this.exchange_rate,

  });
  DataExchangeRate.fromJson(Map<String, dynamic> json){
    this.exchange_rate =  ParseNumber.parseInt(json['exchange_rate']);
  
  }

}