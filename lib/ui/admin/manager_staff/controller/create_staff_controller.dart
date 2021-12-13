import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateStaffController extends GetxController  {
TextEditingController userCodeController = TextEditingController();

bool isUserCodeValid = true;
String userCodeError = "";
  @override
  void onInit() {
    super.onInit();
  }
}