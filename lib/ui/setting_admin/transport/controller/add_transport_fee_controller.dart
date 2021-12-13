import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/models/unit.dart';
import 'package:viet_trung_mobile/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';
import 'package:viet_trung_mobile/data/request/add_transport_form_fee_request.dart';
import 'package:viet_trung_mobile/data/response/list_product_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class AddTransportFormFeeController extends GetxController {
  TransportAdminRepositories? repository;
  String? formFeeId;
  TextEditingController feeHNController = TextEditingController();
  TextEditingController feeSGController = TextEditingController();
  TextEditingController feeDNController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  List<Unit> unit = [
    Unit(1, kg),
    Unit(2, m3),
  ];
  int? editUnit = 0;
  Unit? selectedUnit;
  ListProductResponse? productResponse;
  List<ItemProduct>? nameProduct;
  ItemProduct? selectedItemProduct;
  int? editName = 0;
  bool fromValid = true;
  bool toValid = true;
  bool feeHNValid = true;
  bool feeDNValid = true;
  bool feeSGValid = true;
  bool productValid = true;
  bool unitValid = true;
  String? fromError;
  String? toError;
  String? feeHNError;
  String? feeDNError;
  String? feeSGError;
  String? unitError;
  String? productError;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().transport;
    if (Get.arguments == null) {
      formFeeId = null;
    } else {
      formFeeId = Get.arguments;
    }
    onGetListProduct();
  }

  void onChangeUnit(Unit value, int id) {
    selectedUnit = value;
    editUnit = id;
    update();
  }

  void onChangeProduct(ItemProduct value) {
    selectedItemProduct = value;
    editName = value.id!;
    update();
  }

  void onGetListProduct() {
    repository!.onGetListProduct().then((value) {
      productResponse = value;
      nameProduct = value.data!;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onCreateTransportFee() {
    if (toController.text.isEmpty) {
      fromValid = false;
      fromError = errorQuantity;
    } else {
      fromValid = true;
    }

    if (fromController.text.isEmpty) {
      toValid = false;
      toError = errorQuantity;
    } else {
      toValid = true;
    }

    if (feeHNController.text.isEmpty) {
      feeHNValid = false;
      feeHNError = errorFee;
    } else {
      feeHNValid = true;
    }

    if (feeDNController.text.isEmpty) {
      feeDNValid = false;
      feeDNError = errorFee;
    } else {
      feeDNValid = true;
    }
    if (feeSGController.text.isEmpty) {
      feeDNValid = false;
      feeDNError = errorFee;
    } else {
      feeDNValid = true;
    }
    if (editName == 0) {
      productValid = false;
      productError = errorProduct;
    } else {
      productValid = true;
    }

    if (editUnit == 0) {
      unitValid = false;
      unitError = errorUnit;
    } else {
      unitValid = true;
    }
    if (toValid &&
        fromValid &&
        feeHNValid &&
        feeDNValid &&
        feeSGValid &&
        unitValid &&
        productValid) {
      AddTransportFormFeeRequest _request = AddTransportFormFeeRequest(
        transportFormId: formFeeId!,
        from: fromController.text,
        to: toController.text,
        transportfeeDN: feeDNController.text,
        transportfeeHN: feeHNController.text,
        transportfeeSG: feeSGController.text,
        unit: selectedUnit!.name,
        productId: editName!,
      );
      repository!.onAddTransportFee(_request).then((value) {
        Get.back();
        Get.snackbar('Thông báo', value.message!);
        update();
      }).catchError((onError) {
        update();
      });
    }
    update();
  }
}
