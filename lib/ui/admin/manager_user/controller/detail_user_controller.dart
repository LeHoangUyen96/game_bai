import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_user_reponsitory/manager_user_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/response/detail_user_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class DetailUserController extends GetxController {
  ManagerUserRepositories? managerUserRepositories;
  DetailUserResponse? detailUserResponse;
  int? id;
  bool isStatus = true;
  int? status;
  @override
  void onInit() {
    super.onInit();
    managerUserRepositories = Injector().managerUser;
    id = Get.arguments;
    print("$id");
    onGetDetailUser();
  }

  void onGetDetailUser() {
    managerUserRepositories!.onGetDetailUser(id!).then((value) {
      detailUserResponse = value;
      update();
    }).catchError((onError) {
      print("-----------------$onError");
    });
  }
  void onResetPassword(){
    managerUserRepositories!.onResetPasswordUser(id!).then((value) {
      Get.snackbar(NOTIFY, "Thay đổi mật khẩu thành công");
    }).catchError((onError){
      print("-----------------$onError");
    });
  }
 
}