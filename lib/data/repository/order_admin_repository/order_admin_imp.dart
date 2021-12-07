import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/request/confirm_order_wait_confirm_request.dart';
import 'package:viet_trung_mobile/data/request/update_fee_warhouse_china.dart';
import 'package:viet_trung_mobile/data/request/verifi_order_ownerless.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile/data/response/order_admin_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';

class OrderAdminImpl extends GetConnect implements OrderAdminRepositories {
  @override
  Future<OrderAdminResponse> onGetListOrderOwnerless() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderOwnerless;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
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

  Future<OrderAdminResponse> onGetListOrderValidShipBack() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderValidShipBack;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderValidStorage() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderValidStorage;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<ForgotPassResponse> onVerifiOrderOwnerless(
      VerifiOrderOwnerlessRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.onVerifiOrderOwnerless;
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<ForgotPassResponse> onVerifiOrder(
      VerifiOrderConfirmRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.onVerifiOrderOwnerless;
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderNoTransport() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderNoTransport;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderWaitConfirm() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderWaitConfirm;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminDetailResponse> onGetOrderDetail(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.orderAdminDetail + id;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminDetailResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<ForgotPassResponse> onConfirmOrderWaitConfirm(
      VerifiOrderWaitConfirmRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.confirmOrderAdmin;
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<ForgotPassResponse> onUpdateFeeWarhouseChina(
      UpdateFeeWarhouseChina request, String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.updateFeeWarhouseChina + id;
    final body = json.encode(request);
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
