import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_warehouse_repository/manager_warehouse_repositories.dart';
import 'package:viet_trung_mobile_admin/data/response/list_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class ManagerWarehouseDetailController extends GetxController {
  ManagerWarehouseRepositories? repository;
  ListWarehouseResponse? response;
  int? warehouseId;

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

  void onGetListWarehouse(int id) {
    repository!.onGetWarehouseDetail(warehouseId!).then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onDeleteWarehouse(String id) {
    repository!.onDeleteWarehouse(id).then((value) {
      Get.snackbar(NOTIFY, value.message!);
      Get.back();
      Get.back();
      onGetListWarehouse(warehouseId!);
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }
}
