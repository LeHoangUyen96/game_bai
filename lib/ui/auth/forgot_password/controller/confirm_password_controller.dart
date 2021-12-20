import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile_admin/data/request/confirm_pass_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/forgot_error_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/auth/forgot_password/contract/forgotpasss_contract.dart';
import 'package:viet_trung_mobile_admin/ui/auth/login/view/login_page.dart';

class ConfirmPasswordController extends GetxController
    implements ForgotPassContract {
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  bool passValid = true;
  String? passError = '';
  bool confirmPassValid = true;
  String? confirmPassError = '';
  bool codeValid = true;
  String? codeError = '';

  late AuthRepository authRepository;
  late ForgotPassContract contract;
  String? mesenger;

  String? emailUser;

  @override
  void onInit() {
    super.onInit();
    authRepository = Injector().auth;
    if (Get.arguments == null) {
      emailUser = null;
    } else {
      emailUser = Get.arguments;
    }
    contract = this;
  }

  void onConfirmPass() {
    if (codeController.text.isEmpty) {
      codeValid = false;
      codeError = codeError;
    } else
      codeValid = true;

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

    if (codeValid && confirmPassValid && passValid) {
      ConfirmPassRequest request = ConfirmPassRequest(
        email: emailUser,
        code: codeController.text,
        pass: passController.text,
        confirmPass: confirmPassController.text,
      );
      authRepository.onForgotPassStep2(request).then((value) {
        Get.offAll(() => LoginPage());
        Get.snackbar(NOTIFY, AUTH_FORGOT_PASS_ERROR_CONFIRM_SUCCESS);
        update();
      }).catchError((onError) {
        return onError;
      });
    }

    update();
  }

  @override
  void onError(ForgotErrorResponse msg) {}

  @override
  void onSuccess(ForgotPassResponse response) {}
}
