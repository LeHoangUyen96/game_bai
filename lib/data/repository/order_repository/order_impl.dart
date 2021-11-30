import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/request/confirm_order_request.dart';
import 'package:viet_trung_mobile/data/request/enter_warehouse_request.dart';
import 'package:viet_trung_mobile/data/request/packing_order_requets.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/errors_enter_warehouse.dart';
import 'package:viet_trung_mobile/data/response/order_detail_response.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/data/response/ramdom_bill_order_response.dart';
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

  @override
  Future<bool> onEnterWarehouse(EnterWareHouseRequest request)async {
   final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.ENTER_WAREHOUSE;
    final body = jsonEncode(request);
    final responseJson = await post(url,body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return true;
    }
    throw ErrorsEnterWarehouseResponse.fromJson(responseJson.body);
  }

  @override
  Future<RamdomBillOrderResponse> onRamdomBillOrder(int user_id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.RAMDOM_BILL_ORDER + "?user_id=$user_id";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RamdomBillOrderResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<String> onUploadImageEnterWarehouse(List<File> request) {
    // TODO: implement onUploadImageEnterWarehouse
    throw UnimplementedError();
  }

  @override
  Future<OrderDetailsResponse> onGetDetailsOrder(int id)async {
     final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.ORDER_DETAILS + "$id";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderDetailsResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<bool> onConfirmOrder(ConfirmOrderRequest request)async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.ORDER_CONFIRM;
    final body = jsonEncode(request);
    final responseJson = await post(url,body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return true;
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
  
}