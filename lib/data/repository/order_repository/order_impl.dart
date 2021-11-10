import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';

class OrderImpl extends GetConnect implements OrderRepositories {

  @override
  Future<OrderResponse> onGetListOrder() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.ORDER_LIST + "?type=1";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}