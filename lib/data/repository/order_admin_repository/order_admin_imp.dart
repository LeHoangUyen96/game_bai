import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/request/confirm_order_wait_confirm_request.dart';
import 'package:viet_trung_mobile_admin/data/request/update_fee_warehouse_vn.dart';
import 'package:viet_trung_mobile_admin/data/request/update_fee_warhouse_china.dart';
import 'package:viet_trung_mobile_admin/data/request/update_order_no_transport.dart';
import 'package:viet_trung_mobile_admin/data/request/verifi_order_ownerless.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_status_response.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile_admin/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile_admin/data/response/transport_form_response.dart';

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

  Future<OrderAdminResponse> onGetListOrderShipped() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderShipped;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<ForgotPassResponse> onUpdateOrderNoTransport(
      UpdateOrderNoTransport request, String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.updateOrderNoTransport + id;
    final body = json.encode(request);
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<ListStatusResponse> onGetListStatus() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listStatus;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListStatusResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderBorder() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderShipped + '?order_status=warehouse_gate';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderHN() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderShipped + '?order_status=warehouse_HN';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderDN() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderShipped + '?order_status=warehouse_DN';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderSG() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderShipped + '?order_status=warehouse_SG';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderDelivery() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderShipped + '?order_status=delivering';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderCN() async {
    final header = NetworkConfig.onBuildHeader();
    final url =
        NetworkConfig.listOrderShipped + '?order_status=export_warehouse_china';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderProcedure() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderShipped + '?order_status=procedure';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<OrderAdminResponse> onGetListOrderReceive() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listOrderShipped + '?order_status=received';
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return OrderAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  Future<ForgotPassResponse> onUpdateFeeWarhouseVN(
      UpdateFeeWarhouseVN request, String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.updateVNFee + id;
    final body = json.encode(request);
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
