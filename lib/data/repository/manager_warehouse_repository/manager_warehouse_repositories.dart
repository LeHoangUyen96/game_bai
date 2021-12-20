import 'package:viet_trung_mobile_admin/data/request/update_warehouse_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/check_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_warehouse_response.dart';

abstract class ManagerWarehouseRepositories {
  Future<ListWarehouseResponse> onGetListWarehouse();
  Future<ListWarehouseResponse> onGetWarehouseDetail(int id);
  Future<ForgotPassResponse> onDeleteWarehouse(String id);
  Future<List<DataCheckWarehouse>> onCheckWarehouse(int id);
  Future<ForgotPassResponse> onUpdateWarehouse(UpdateWarehouseRequest request);
}
