import 'package:viet_trung_mobile_admin/data/response/list_warehouse_response.dart';

abstract class ManagerWarehouseRepositories {
  Future<ListWarehouseResponse> onGetListWarehouse();
  Future<ListWarehouseResponse> onGetWarehouseDetail(String id);
}
