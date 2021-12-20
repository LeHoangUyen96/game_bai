import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/exchange_rate_reponsitory/exchange_rate_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/exchange_rate_response.dart';

class ExchangeRateImpl extends GetConnect implements ExchangeRateRepositories {
  @override
  Future<ExchangeRateResponse> onGetExchangeRate() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.getExchangeRate;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ExchangeRateResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onUpdateExchangeRate(String exchangeRate) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.updateExchangeRate;
    Map body = {"exchange_rate": exchangeRate};
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
