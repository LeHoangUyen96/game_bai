import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/packing_admin_reponsitory/packing_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/request/add_packing_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_transport_admin_response.dart';
import 'dart:convert';

import 'package:viet_trung_mobile_admin/data/response/packing_detail_response.dart';

class PackingAdminImpl extends GetConnect implements PackingAdminRepositories {
  @override
  Future<TransportFormAdminResponse> onGetListPacking() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listPacking;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return TransportFormAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onAddPacking(AddPackingRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.addPacking;
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onDeletePacking(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.deletePacking + id;
    final responseJson = await delete(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<PackingDetailResponse> onGetPackingDetail(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.packingDetail + id;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return PackingDetailResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onUpdatePacking(
      String id, AddPackingRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.updatePacking + id;
    final body = json.encode(request);
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
