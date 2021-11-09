import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:screenshot/screenshot.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/ui/auth/register/contract/register_contract.dart';

class RegisterStepOneController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();



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
  }

  



}
