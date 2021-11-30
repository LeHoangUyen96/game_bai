import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindingCustomerController extends GetxController  {
  TextEditingController phoneValueController = TextEditingController();
  String  phoneErros = '';
  bool isPhoneValid = true;
  @override
  void onInit() {
    super.onInit();
  }
}