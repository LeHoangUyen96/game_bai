import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_staff_reponsitory/manager_staff_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/response/detail_staff_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class DetailStaffController extends GetxController {
  ManagerStaffRepositories? managerStaffRepositories;
  DetailStaffResponse? detailStaffResponse;
  int? id;
  bool isStatus = true;
  int? status;
  @override
  void onInit() {
    super.onInit();
    managerStaffRepositories = Injector().managerStaff;
    id = Get.arguments;
    print("$id");
    onGetDetailAdmin();
    // onGetStatusStaff();
  }

  void onGetDetailAdmin() {
    managerStaffRepositories!.onGetDetailAdmin(id!).then((value) {
      detailStaffResponse = value;
      //   if( value.data!.status == 1){
      //   isStatus = true;
      // } else isStatus = false;
      update();
    }).catchError((onError) {
      print("-----------------$onError");
    });
  }

  void onGetStatusStaff(bool value) {
    isStatus = value;
    if (isStatus == true) {
      status = 1;
    } else {
      status = 0;
    }
    onChangeStatusAdmin();
    print("$status");
    update();
  }

  void onChangeStatusAdmin() {
    managerStaffRepositories!.onChangeStatusAdmin(id!, status!).then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      onGetDetailAdmin();
      update();
    }).catchError((onError) {
      //Get.defaultDialog(title: onError.toString(), middleText: '');
    });
  }
  void onResetPasswordAdmin(){
     managerStaffRepositories!.onResetPasswordAdmin(id!).then((value) {
      Get.snackbar(NOTIFY, "Thay đổi mật khẩu thành công");
    }).catchError((onError){
      print("-----------------$onError");
    });
  }
}