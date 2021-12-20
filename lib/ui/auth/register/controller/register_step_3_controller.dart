import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile_admin/data/request/auth_request.dart';
import 'package:viet_trung_mobile_admin/data/response/register_step_2_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_step_1_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_address_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/auth/login/view/login_page.dart';
import 'package:viet_trung_mobile_admin/ui/auth/register/contract/register_contract.dart';
import 'package:viet_trung_mobile_admin/ui/main/view/main_page_admin.dart';
import 'package:viet_trung_mobile_admin/ulti/key_storage/key_storage.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';

class RegisterStepThreeController extends GetxController
    implements RegisterContract {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  late RegisterContract contract;

  bool isEmailValid = true;
  bool isNameValid = true;
  bool isPhoneNumberValid = true;
  bool isPasswordValid = true;
  bool isUserNameValid = true;
  bool isConfirmPassValid = true;

  String emailError = "";
  String phoneNumberError = "";
  String nameError = "";
  String passwordError = "";
  String confirmPassError = "";

  String errorAPI = "";
  String? email;
  String? name;
  String? phone;
  int? city;
  int? district;
  int? wards;
  String? address;

  late AuthRepository _authRepository;

  final tokens = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _authRepository = Injector().auth;
    contract = this;
    if (Get.arguments != null) {
      if (Get.arguments['email'] == null) {
        email = null;
      } else {
        email = Get.arguments['email'];
      }
      if (Get.arguments['phone'] == null) {
        phone = null;
      } else {
        phone = Get.arguments['phone'];
      }
      if (Get.arguments['name'] == null) {
        name = null;
      } else {
        name = Get.arguments['name'];
      }
      if (Get.arguments['city_id'] == null) {
        city = null;
      } else {
        city = Get.arguments['city_id'];
      }
      if (Get.arguments['district_id'] == null) {
        district = null;
      } else {
        district = Get.arguments['district_id'];
      }
      if (Get.arguments['wards_id'] == null) {
        wards = null;
      } else {
        wards = Get.arguments['wards_id'];
      }
      if (Get.arguments['address'] == null) {
        address = null;
      } else {
        address = Get.arguments['address'];
      }
    }
  }

  void onRegister() {
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

    if (isPasswordValid && isConfirmPassValid) {
      AuthRequest _request = AuthRequest(
        email: email,
        phone: phone,
        name: name,
        password: passwordController.text,
        password_confirmation: confirmPassController.text,
        city_id: city,
        district_id: district,
        wards_id: wards,
        address: address,
      );
      _authRepository
          .onRegister(_request, NetworkConfig.REGISTER)
          .then((value) {
        return contract.onSuccess(value);
      }).catchError((onError) {
        //Get.snackbar("Notification", "Register Failllllllllll");
        return contract.onError(onError);
        // Error response here, depend on error code we will show the detail message
      });
    }
    update();
  }

  void onLogin() {
    Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    AuthRequest _request =
        AuthRequest(email: email, password: passwordController.text);
    _authRepository.onAuth(_request, NetworkConfig.LOGIN).then((value) {
      // tokens.save(value.token);
      tokens.write(KEY_TOKEN, value.token.toString());
      Get.offAll(() => MainPageAdmin());
      //Get.offAll(() => ProfilePage());12345
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
  void onError(ErrorResponse msg) {}

  @override
  void onSuccess(RegisterResponse response) {
    //onLogin();
    Get.snackbar(NOTIFY, AUTH_REGISTER_SUCCESS);
    Get.to(LoginPage());
    update();
  }

  @override
  void onSuccessGetAddress(RegisterAddressResponse response) {}

  @override
  void onSuccessRegisterStep1(RegisterStep1Response response) {}

  @override
  void onSuccessRegisterStep2(RegisterStep2Response response) {}
}
