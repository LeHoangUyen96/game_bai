import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_warehouse_repository/manager_warehouse_repositories.dart';
import 'package:viet_trung_mobile_admin/data/response/list_warehouse_response.dart';

class InventoryManagementcontroller extends GetxController {
  ManagerWarehouseRepositories? repository;
  ListWarehouseResponse? response;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().warehouse;
    onGetListWarehouse();
  }

  void onGetListWarehouse() {
    repository!.onGetListWarehouse().then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }
}
