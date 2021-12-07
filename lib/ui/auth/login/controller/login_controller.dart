import 'package:screenshot/screenshot.dart';
import 'package:viet_trung_mobile/data/models/user.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/data/response/forgot_error_response.dart';
import 'package:viet_trung_mobile/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/login/contract/login.dart';
import 'package:viet_trung_mobile/ui/main/view/main_page_admin.dart';
import 'package:viet_trung_mobile/ulti/key_storage/key_storage.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/data/request/auth_request.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController implements LoginContract {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  late LoginContract contract;
  ProfileRepositories? profileRepositories;
  ProfileResponse? mDataProfile;

  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isDataValid = true;

  String emailError = "";
  String passwordError = "";
  String errorAPI = "";

  late AuthRepository _authRepository;

  final tokens = GetStorage();
  final isAdmin = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _authRepository = Injector().auth;
    profileRepositories = Injector().profile;
    contract = this;
  }

  void onLogin() {
    if (emailController.text.isEmpty) {
      isEmailValid = false;
      emailError = AUTH_LOGIN_ERROR_EMAIL;
    } else {
      isEmailValid = true;
    }

    if (passwordController.text.isEmpty) {
      isPasswordValid = false;
      passwordError = AUTH_LOGIN_ERROR_PASS_EMPTY;
    } else {
      if (passwordController.text.length < 8) {
        isPasswordValid = false;
        passwordError = AUTH_LOGIN_ERROR_PASS;
      } else {
        isPasswordValid = true;
      }
    }

    if (isEmailValid && isPasswordValid) {
      Get.dialog(LoadingSpinKit(), barrierDismissible: false);
      AuthRequest _request = AuthRequest(
          email: emailController.text, password: passwordController.text);
      _authRepository.onAuth(_request, NetworkConfig.LOGIN).then((value) {
        // tokens.save(value.token);
        tokens.write(KEY_TOKEN, value.token.toString());
        return contract.onSuccess(value);
      }).catchError((onError) {
        Get.back();
        print('onError $onError');
        return contract.onError(onError);
        // Error response here, depend on error code we will show the detail message
      });
    }

    update();
  }

  @override
  void onError(ForgotErrorResponse msg) {
    Get.snackbar(NOTIFY, msg.message.toString());
    update();
  }

  @override
  void onSuccess(User response) {
    profileRepositories!.onGetProfile().then((value) {
      mDataProfile = value;
      GetStorage().write(KEY_ADMIN, mDataProfile!.data!.is_admin);
      Get.offAll(() => MainPageAdmin());
      print('is_admin: ${mDataProfile!.data!.is_admin}');
      update();
    }).catchError((onError) {
      print('onError $onError');
    });
    update();

    print("Successss");
  }
}
