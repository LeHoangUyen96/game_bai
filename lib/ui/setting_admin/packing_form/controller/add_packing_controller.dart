import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/packing_admin_reponsitory/packing_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/request/add_packing_request.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class AddPackingController extends GetxController {
  PackingAdminRepositories? repository;
  String? formFeeId;
  TextEditingController nameController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  bool nameValid = true;
  bool feeValid = true;
  String? nameError;
  String? feeError;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().packing;
  }

  void onCreatePackingFee() {
    if (nameController.text.isEmpty) {
      nameValid = false;
      nameError = errorFee;
    } else {
      nameValid = true;
    }

    if (feeController.text.isEmpty) {
      feeValid = false;
      feeError = errorFee;
    } else {
      feeValid = true;
    }

    if (feeValid && nameValid) {
      AddPackingRequest request = AddPackingRequest(
        name: nameController.text,
        packingFee: feeController.text,
        status: 1,
      );
      repository!.onAddPacking(request).then((value) {
        Get.back();
        Get.snackbar(NOTIFY, value.message!);
        update();
      }).catchError((onError) {
        update();
      });
    }
    update();
  }
}
