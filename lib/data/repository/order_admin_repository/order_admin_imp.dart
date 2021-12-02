import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';

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

  @override
  Future<SearchCustomerResponse> onGetListSearchCustomer(
      String valueSearch) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listSearchCustomer + valueSearch;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return SearchCustomerResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<PackingFormResponse> onGetListPackingForm() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listPackingForm;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return PackingFormResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<TransportFormResponse> onGetListTransportForm() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listTransportForm;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return TransportFormResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
