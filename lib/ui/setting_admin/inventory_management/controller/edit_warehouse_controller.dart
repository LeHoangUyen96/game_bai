import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_warehouse_repository/manager_warehouse_repositories.dart';
import 'package:viet_trung_mobile_admin/data/request/update_warehouse_request.dart';
import 'package:viet_trung_mobile_admin/data/response/check_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class EditWarehouseController extends GetxController {
  ManagerWarehouseRepositories? repository;
  List<DataCheckWarehouse>? data;
  int? warehouseId;
  List<int> city = [];

  @override
  void onInit() {
    super.onInit();
    repository = Injector().warehouse;
    if (Get.arguments == null) {
      warehouseId = null;
    } else {
      warehouseId = Get.arguments;
    }
    onCheckWarehouse(warehouseId!);
  }

  void onCheckWarehouse(int id) {
    repository!.onCheckWarehouse(warehouseId!).then((value) {
      data = value;
      for (var item in data!) {
        if (item.status == 1) {
          item.isCheck = true;
          city.add(item.id!);
        }
      }
      update();
    }).catchError((onError) {
      update();
    });
  }

  void onCheck(DataCheckWarehouse data) {
    data.isCheck = !data.isCheck!;
    if (data.isCheck == true) {
      city.add(data.id!);
    }
    if (data.isCheck == false) {
      // data.status = 0;
      city.remove(data.id!);
    }
    update();
  }

  void onSave() {
    UpdateWarehouseRequest request = UpdateWarehouseRequest(
      warehouseId: warehouseId,
      cityIds: city,
    );
    repository!.onUpdateWarehouse(request).then((value) {
      Get.back(result: true);
      Get.snackbar(NOTIFY, value.message!);
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }
}
