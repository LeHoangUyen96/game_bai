import 'package:viet_trung_mobile/data/request/add_packing_request.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/exchange_rate_response.dart';

abstract class ExchangeRateRepositories {
  Future<ExchangeRateResponse> onGetExchangeRate();
  Future<ForgotPassResponse> onUpdateExchangeRate(String exchangeRate);
}
