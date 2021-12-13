import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/packing_admin_reponsitory/packing_admin_repositories.dart';
import 'package:viet_trung_mobile/data/request/add_packing_request.dart';
import 'package:viet_trung_mobile/data/response/packing_detail_response.dart';

class PackingDetailController extends GetxController {
  PackingAdminRepositories? repository;
  String? formFeeId;
  TextEditingController feeController = TextEditingController();
  bool nameValid = true;
  bool feeValid = true;
  String? nameError;
  String? feeError;
  String? packingId;
  PackingDetailResponse? response;
  bool isEdit = false;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().packing;
    if (Get.arguments == null) {
      packingId = null;
    } else {
      packingId = Get.arguments;
    }
    onGetPackingDetail(packingId!);
  }

  void onGetPackingDetail(String id) {
    repository!.onGetPackingDetail(packingId!).then((value) {
      response = value;
      feeController =
          TextEditingController(text: value.data!.packingFee!.toString());
      update();
    }).catchError((onError) {
      update();
    });
  }

  void onDeletePacking(String id) {
    repository!.onDeletePacking(packingId!).then((value) {
      Get.back();
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      update();
    });
  }

  void editFee() {
    isEdit = !isEdit;
    update();
  }

  void onUpdatePacking(
    String id,
  ) {
    AddPackingRequest request = AddPackingRequest(
      name: response!.data!.name!,
      status: 1,
      packingFee: feeController.text,
    );
    repository!.onUpdatePacking(packingId!, request).then((value) {
      Get.back();
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      update();
    });
  }
}
