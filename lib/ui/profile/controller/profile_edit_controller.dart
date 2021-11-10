import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/data/response/errors_response.dart';
import 'package:viet_trung_mobile/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/profile/contract/profile_contract.dart';

class ProfileEditController extends GetxController implements ProfileContract {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
ProfileRepositories? profileRepositories;
ProfileContract? contract;
ProfileResponse ? mDataProfile;


@override
  void onInit() {
    super.onInit();
    profileRepositories =  Injector().profile;
    contract = this;
    onGetProfile();
  }


  void onGetProfile(){
    profileRepositories!.onGetProfile().then((value) {
      return contract!.onGetProfileSuccess(value);
    }).catchError((onError) {
      return contract!.onGetProfileError(onError);
    });
    update();
  }

 

  @override
  void onGetProfileError(ErrorsResponse error) {
    Get.snackbar(NOTIFY,error.message.toString());
    update();
  }

  @override
  void onGetProfileSuccess(ProfileResponse data) {
     mDataProfile = data;
    update();
  }

}