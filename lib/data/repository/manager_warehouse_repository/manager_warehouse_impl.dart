import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_warehouse_repository/manager_warehouse_repositories.dart';
import 'package:viet_trung_mobile_admin/data/request/update_warehouse_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/check_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_warehouse_response.dart';
import 'package:get/get_connect/connect.dart';
import 'dart:convert';

class ManagerWarehouseImpl extends GetConnect
    implements ManagerWarehouseRepositories {
  @override
  Future<ListWarehouseResponse> onGetListWarehouse() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listWarehouse;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListWarehouseResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }

  @override
  Future<ListWarehouseResponse> onGetWarehouseDetail(int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.warehouseDetail + id.toString();
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListWarehouseResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onDeleteWarehouse(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.deleteWarehouse + id;
    final body = null;
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }

  @override
  Future<List<DataCheckWarehouse>> onCheckWarehouse(int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.checkWarehouse + id.toString();
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return (responseJson.body as List)
          .map((e) => DataCheckWarehouse.fromJson(e))
          .toList();
    }
    throw Exception(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onUpdateWarehouse(
      UpdateWarehouseRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.updateWarehouse;
    final body = json.encode(request);
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }
}
