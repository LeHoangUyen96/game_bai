import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/ui/auth/register/contract/register_contract.dart';

class RegisterStepTwoController extends GetxController {

  late RegisterContract contract;


  String errorAPI = "";

  late AuthRepository _authRepository;


  final tokens = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _authRepository = Injector().auth;
  }

  



}