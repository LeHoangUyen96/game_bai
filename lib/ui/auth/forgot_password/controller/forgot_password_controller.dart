import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/forgot_error_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/auth/forgot_password/contract/forgotpasss_contract.dart';
import 'package:viet_trung_mobile_admin/ui/auth/forgot_password/view/confirm_password_page.dart';

class ForgotController extends GetxController implements ForgotPassContract {
  TextEditingController emailController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  bool isEmailValid = true;
  String? emailError;

  late AuthRepository _authRepository;
  late ForgotPassContract contract;
  String? mesenger;

  @override
  void onInit() {
    super.onInit();
    _authRepository = Injector().auth;
    contract = this;
  }

  void onForgotPass() {
    if (emailController.text.isEmpty) {
      isEmailValid = false;
      emailError = AUTH_FORGOT_PASS_ERROR_INPUT;
    } else if (!GetUtils.isEmail(emailController.text)) {
      isEmailValid = false;
      emailError = AUTH_FORGOT_PASS_ERROR;
    } else {
      isEmailValid = true;
    }

    if (isEmailValid) {
      _authRepository.onForgotPassStep1(emailController.text).then((value) {
        Get.snackbar(NOTIFY, value.message.toString());
        Get.to(() => ConfirmPage(), arguments: emailController.text);
        update();
      }).catchError((onError) {
        return onError;
      });
    }

    update();
  }

  @override
  void onError(ForgotErrorResponse msg) {
    Get.snackbar(NOTIFY, msg.message.toString());
    if (msg.message!.isNotEmpty) {
      isEmailValid = false;
      emailError = msg.message.toString();
      update();
    } else {
      isEmailValid = true;
      update();
    }
    update();
  }

  @override
  void onSuccess(ForgotPassResponse response) {
    Get.snackbar(NOTIFY, response.message.toString());
    Get.to(() => ConfirmPage());
    print("Successss");
    update();
  }
}
