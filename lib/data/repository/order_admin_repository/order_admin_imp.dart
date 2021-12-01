import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';

class OrderAdminImpl extends GetConnect implements OrderAdminRepositories {
  @override
  Future<OrderOwnerlessResponse> onGetListOrderOwnerless() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderOwnerless;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderOwnerlessResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
