import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/find_user_reponsitory/find_user_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/response/find_user_reponse.dart';
import 'package:viet_trung_mobile_admin/ui/admin/inventory_management/view/enter_warehouse_page.dart';

class FindingCustomerController extends GetxController {
  TextEditingController phoneValueController = TextEditingController();
  String phoneErros = '';
  bool isPhoneValid = true;
  FindUserResponse? findUserResponse;
  FindUserRepositories? findUserRepositories;
  @override
  void onInit() {
    super.onInit();
    findUserRepositories = Injector().findUser;
  }

  void onFindUser() {
    if (phoneValueController.text.isEmpty) {
      isPhoneValid = false;
      phoneErros = "Số điện thoại hoặc mã khách hàng không được để trống";
    } else {
      isPhoneValid = true;
    }
    if (isPhoneValid) {
      findUserRepositories!
          .onGetFindUser(phoneValueController.text)
          .then((value) {
        findUserResponse = value;
        if (findUserResponse!.data == null) {
          isPhoneValid = false;
          phoneErros = findUserResponse!.message.toString();
        }
        print("onFindUser findUserResponse ${findUserResponse!.data!.name}");
        phoneValueController.clear();
        Get.to(EnterWarehousePage(), arguments: {
          'user_code': findUserResponse!.data!.user_code,
          'user_id': findUserResponse!.data!.id,
          'phone': findUserResponse!.data!.phone,
          'name': findUserResponse!.data!.name,
        });
        update();
      }).catchError((onError) {
        //Get.snackbar(PROFILE_NOTIFY, onError.toString());

        print('isErorrs');
        update();
      });
    }
    // print('${phoneValueController.text}');
    update();
  }

  void onImportStorageNoInfo() {
    if (phoneValueController.text.isEmpty) {
      isPhoneValid = false;
      phoneErros = "Số điện thoại không được để trống";
    } else if (phoneValueController.text.length < 9 ||
        phoneValueController.text.length > 11) {
      isPhoneValid = false;
      phoneErros = "Số điện thoại không đúng định dạng";
    } else {
      isPhoneValid = true;
    }
    if (isPhoneValid) {
       //
      Get.to(EnterWarehousePage(),
          arguments: {'phone': phoneValueController.text});
    }
    phoneValueController.clear();
    update();
  }
}
