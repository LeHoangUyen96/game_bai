import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/errors_response.dart';
import 'package:viet_trung_mobile_admin/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/profile/contract/profile_contract.dart';
import 'dart:io';

class ProfileEditController extends GetxController implements ProfileContract {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  ProfileRepositories? profileRepositories;
  ProfileContract? contract;
  ProfileResponse? mDataProfile;

  @override
  void onInit() {
    super.onInit();
    profileRepositories = Injector().profile;
    contract = this;
    onGetProfile();
  }

  void onGetProfile() {
    profileRepositories!.onGetProfile().then((value) {
      return contract!.onGetProfileSuccess(value);
    }).catchError((onError) {
      return contract!.onGetProfileError(onError);
    });
    update();
  }

  @override
  void onGetProfileError(ErrorsResponse error) {
    Get.snackbar(NOTIFY, error.message.toString());
    update();
  }

  @override
  void onGetProfileSuccess(ProfileResponse data) {
    mDataProfile = data;
    update();
  }

  @override
  void onUploadImageError(ErrorResponse error) {}

  @override
  void onUploadImageSuccess(File file) {}

  @override
  void onUpdateAvatarSuccess(String image) {}

  @override
  void onUpdateAvatarError(ErrorResponse error) {}
}
