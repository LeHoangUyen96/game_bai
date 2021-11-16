import 'dart:convert';

import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/request/packing_order_requets.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/data/response/warehouse_response.dart';

class OrderImpl extends GetConnect implements OrderRepositories {

  @override
  Future<OrderResponse> onGetListOrder(int type) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.ORDER_LIST + "?type=$type";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<WarehouseResponse> onGetListWarehouse() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.WAREHOUSE;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return WarehouseResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<bool> onPackingOrder(PackingOrderRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.PACKING_ORDER;
    final body = jsonEncode(request);
    final responseJson = await post(url,body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return true;
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}