import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/data/request/edit_profile_request.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class ChangePasswordAdminController extends GetxController {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  ProfileRepositories? profileRepositories;
  bool oldPassValid = true;
  bool newPassValid = true;
  bool confirmPassValid = true;
  String? oldPassError;
  String? newPassError;
  String? confirmPassError;

  @override
  void onInit() {
    super.onInit();
    profileRepositories = Injector().profile;
  }

  void onChangePassword() {
    if (oldPassController.text.isEmpty) {
      oldPassValid = false;
      oldPassError = AUTH_LOGIN_ERROR_PASS_EMPTY;
    } else {
      oldPassValid = true;
    }

    if (newPassController.text.isEmpty) {
      newPassValid = false;
      newPassError = AUTH_LOGIN_ERROR_PASS_EMPTY;
    }
    if (newPassController.text.length < 8) {
      newPassValid = false;
      newPassError = AUTH_LOGIN_ERROR_PASS;
    } else {
      newPassValid = true;
    }

    if (confirmPassController.text.isEmpty) {
      confirmPassValid = false;
      confirmPassError = AUTH_LOGIN_ERROR_PASS_EMPTY;
    }
    if (confirmPassController.text != newPassController.text) {
      confirmPassValid = false;
      confirmPassError = AUTH_FORGOT_PASS_ERROR_CONFIRM_PASS;
    } else {
      confirmPassValid = true;
    }

    if (confirmPassValid && oldPassValid && newPassValid) {
      EditProfileRequest request = EditProfileRequest(
        email: confirmPassController.text,
        name: oldPassController.text,
        phone: newPassController.text,
      );
      profileRepositories!.onEditProfile(request).then((value) {
        Get.snackbar('Thông báo', value.message!);
        update();
      }).catchError((onError) {
        update();
      });
    }
    update();
  }
}
