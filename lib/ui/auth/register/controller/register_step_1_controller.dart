import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/data/request/auth_request.dart';
import 'package:viet_trung_mobile/data/response/register_response.dart';
import 'package:viet_trung_mobile/data/response/register_address_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/register_step_1_response.dart';
import 'package:viet_trung_mobile/data/response/register_step_2_response.dart';
import 'package:viet_trung_mobile/ui/auth/register/contract/register_contract.dart';
import 'package:viet_trung_mobile/ui/auth/register/view/resigter_step_2.dart';

class RegisterStepOneController extends GetxController
    implements RegisterContract {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  // ScreenshotController screenshotController = ScreenshotController();

  late RegisterContract contract;

  bool isEmailValid = true;
  bool isNameValid = true;
  bool isPhoneNumberValid = true;

  String emailError = "";
  String phoneNumberError = "";
  String nameError = "";

  String errorAPI = "";

  late AuthRepository _authRepository;

  final tokens = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _authRepository = Injector().auth;
    contract = this;
  }

  void onResgiterStep1() {
    if (emailController.text.isEmpty) {
      isEmailValid = false;
      emailError = "Email không được để trống";
    } else if (!GetUtils.isEmail(emailController.text)) {
      isEmailValid = false;
      emailError = "Email không đúng định dạng";
    } else {
      isEmailValid = true;
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

    if (isEmailValid && isPhoneNumberValid && isNameValid) {
      AuthRequest _request = AuthRequest(
        email: emailController.text,
        phone: phoneNumberController.text,
        name: nameController.text,
      );
      _authRepository
          .onRegisterStep1(_request, NetworkConfig.REGISTER_STEP_1)
          .then((value) {
        return contract.onSuccessRegisterStep1(value);
      }).catchError((onError) {
        //Get.snackbar("Notification", "Register Failllllllllll");
        return contract.onError(onError);
      });
    }
    update();
  }

  @override
  void onError(ErrorResponse msg) {
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
  }

  @override
  void onSuccess(RegisterResponse response) {}

  @override
  void onSuccessGetAddress(RegisterAddressResponse response) {}

  @override
  void onSuccessRegisterStep1(RegisterStep1Response response) {
    Get.to(
      RegisterStepTwoPage(),
      arguments: {
        'email': emailController.text,
        'phone': phoneNumberController.text,
        'name': nameController.text,
      },
    );
    update();
  }

  @override
  void onSuccessRegisterStep2(RegisterStep2Response response) {}
}
