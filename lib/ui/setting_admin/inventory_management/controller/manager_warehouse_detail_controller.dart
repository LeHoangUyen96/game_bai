import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_warehouse_repository/manager_warehouse_repositories.dart';
import 'package:viet_trung_mobile_admin/data/response/list_warehouse_response.dart';

class ManagerWarehouseDetailController extends GetxController {
  ManagerWarehouseRepositories? repository;
  ListWarehouseResponse? response;
  String? warehouseId;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().warehouse;
    if (Get.arguments == null) {
      warehouseId = null;
    } else {
      warehouseId = Get.arguments;
    }
    onGetListWarehouse(warehouseId!);
  }

  void onGetListWarehouse(String id) {
    repository!.onGetWarehouseDetail(warehouseId!).then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }
}
