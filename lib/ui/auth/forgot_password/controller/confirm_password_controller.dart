import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/forgot_error_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/contract/forgotpasss_contract.dart';
import 'package:viet_trung_mobile/ui/auth/login/view/login_page.dart';

class ConfirmPasswordController extends GetxController
    implements ForgotPassContract {
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  bool passValid = true;
  String? passError = '';
  bool confirmPassValid = true;
  String? confirmPassError = '';

  late AuthRepository authRepository;
  late ForgotPassContract contract;
  String? mesenger;

  @override
  void onInit() {
    super.onInit();
    authRepository = Injector().auth;
    contract = this;
  }

  void onConfirmPass() {
    if (passController.text.isEmpty) {
      passValid = false;
      passError = AUTH_LOGIN_ERROR_PASS_EMPTY;
    } else {
      if (passController.text.length < 8) {
        passValid = false;
        passError = AUTH_LOGIN_ERROR_PASS;
      } else
        passValid = true;
    }

    if (confirmPassController.text.isEmpty) {
      confirmPassValid = false;
      confirmPassError = AUTH_LOGIN_ERROR_PASS_EMPTY;
    } else {
      if (confirmPassController.text != passController.text) {
        confirmPassValid = false;
        confirmPassError = AUTH_FORGOT_PASS_ERROR_CONFIRM_PASS;
      } else
        confirmPassValid = true;
    }

    if (confirmPassValid && passValid) {
      Get.offAll(() => LoginPage());
      Get.snackbar(NOTIFY, AUTH_FORGOT_PASS_ERROR_CONFIRM_SUCCESS);
    }

    update();
  }

  @override
  void onError(ForgotErrorResponse msg) {}

  @override
  void onSuccess(ForgotPassResponse response) {}
}
