import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/ui/auth/register/contract/register_contract.dart';

class RegisterStepThreeController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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

  late AuthRepository _authRepository;


  final tokens = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _authRepository = Injector().auth;
  }

  



}