import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_warehouse_repository/manager_warehouse_repositories.dart';
import 'package:viet_trung_mobile_admin/data/response/list_warehouse_response.dart';
import 'package:get/get_connect/connect.dart';

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
  Future<ListWarehouseResponse> onGetWarehouseDetail(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.warehouseDetail + id;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListWarehouseResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }
}
