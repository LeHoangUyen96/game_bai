import 'package:viet_trung_mobile/data/response/register_address_response.dart';
import 'package:viet_trung_mobile/data/response/register_response.dart';
import 'package:viet_trung_mobile/data/response/register_step_1_response.dart';
import 'package:viet_trung_mobile/data/response/register_step_2_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/register/contract/register_contract.dart';
import 'package:viet_trung_mobile/ui/profile/view/profile_page.dart';
import 'package:viet_trung_mobile/ulti/key_storage/key_storage.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:flutter/material.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/data/request/auth_request.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController implements RegisterContract {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  // ScreenshotController screenshotController = ScreenshotController();

  late RegisterContract contract;

  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isNameValid = true;
  bool isUserNameValid = true;
  bool isConfirmPassValid = true;
  bool isPhoneNumberValid = true;

  String emailError = "";
  String passwordError = "";
  String confirmPassError = "";
  String phoneNumberError = "";
  String userNameError = "";
  String nameError = "";

  String errorAPI = "";

  late AuthRepository _authRepository;

  final tokens = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _authRepository = Injector().auth;
    contract = this;
    //onRegister();
  }

  void onRegister() {
    if (emailController.text.isEmpty) {
      isEmailValid = false;
      emailError = "Email không được để trống";
    } else if (!GetUtils.isEmail(emailController.text)) {
      isEmailValid = false;
      emailError = "Email không đúng định dạng";
    } else {
      isEmailValid = true;
    }
    if (passwordController.text.isEmpty) {
      isPasswordValid = false;
      passwordError = "Mật khẩu không được để trống";
    } else if (passwordController.text.length < 8) {
      isPasswordValid = false;
      passwordError = "Mật khẩu tối thiểu 8 kí tự";
    } else {
      isPasswordValid = true;
    }

    if (confirmPassController.text.isEmpty) {
      isConfirmPassValid = false;
      confirmPassError = "Mật khẩu không được để trống";
    } else {
      if (confirmPassController.text != passwordController.text) {
        isConfirmPassValid = false;
        confirmPassError = "Mật khẩu không trùng khớp";
      } else {
        isConfirmPassValid = true;
      }
    }

    if (phoneNumberController.text.length < 9 ||
        phoneNumberController.text.length > 11) {
      isPhoneNumberValid = false;
      phoneNumberError = "Số điện thoại không được để trống";
    } else {
      isPhoneNumberValid = true;
    }
    if (nameController.text.isEmpty) {
      isNameValid = false;
      nameError = "Họ và tên không được để trống";
    } else {
      isNameValid = true;
    }

    if (isEmailValid &&
        isPasswordValid &&
        isConfirmPassValid &&
        isPhoneNumberValid &&
        isNameValid) {
      AuthRequest _request = AuthRequest(
          email: emailController.text,
          phone: phoneNumberController.text,
          name: nameController.text,
          password: passwordController.text,
          password_confirmation: confirmPassController.text);
      _authRepository
          .onRegister(_request, NetworkConfig.REGISTER)
          .then((value) {
        return contract.onSuccess(value);
      }).catchError((onError) {
        // Get.snackbar("Notification", "Register Failllllllllll");
        return contract.onError(onError);
        // Error response here, depend on error code we will show the detail message
      });
    }
    update();
  }

  @override
  void onError(ErrorResponse msg) {
    //Get.snackbar(NOTIFY,msg.message.toString());
    if (msg.error!.phoneError!.toList().isNotEmpty) {
      isPhoneNumberValid = false;
      phoneNumberError = msg.error!.phoneError![0].toString();
      update();
    } else {
      isPhoneNumberValid = true;
      update();
    }

    if (msg.error!.emailError!.toList().isNotEmpty) {
      isEmailValid = false;
      emailError = msg.error!.emailError![0].toString();
      update();
    } else {
      isEmailValid = true;
      update();
    }

    update();
  }

  @override
  void onSuccess(RegisterResponse response) {
    onLogin();
    update();
  }

  void onLogin() {
    Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    AuthRequest _request = AuthRequest(
        email: emailController.text, password: passwordController.text);
    _authRepository.onAuth(_request, NetworkConfig.LOGIN).then((value) {
      // tokens.save(value.token);
      tokens.write(KEY_TOKEN, value.token.toString());
      //Get.offAll(() => MainPage());
      Get.offAll(() => ProfilePage());
      Get.snackbar(NOTIFY, AUTH_REGISTER_SUCCESS);
      print("Successss");
      update();
    }).catchError((onError) {
      Get.back();
      Get.snackbar(NOTIFY, AUTH_REGISTER_ERROR);
      update();
    });
  }

  @override
  void onSuccessGetAddress(RegisterAddressResponse response) {}

  @override
  void onSuccessRegisterStep1(RegisterStep1Response response) {}

  @override
  void onSuccessRegisterStep2(RegisterStep2Response response) {}
}
