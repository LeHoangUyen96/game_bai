import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/models/unit.dart';
import 'package:viet_trung_mobile/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';
import 'package:viet_trung_mobile/data/request/add_transport_form_fee_request.dart';
import 'package:viet_trung_mobile/data/response/list_product_response.dart';
import 'package:viet_trung_mobile/data/response/transport_fee_detail_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class EditTransportFormFeeController extends GetxController {
  TransportAdminRepositories? repository;
  String? transportFeeId;
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
  TransportFeeDetailResponse? response;
  List<ItemProduct>? nameProduct;
  ItemProduct? selectedItemProduct;
  ListProductResponse? productResponse;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().transport;
    if (Get.arguments == null) {
      transportFeeId = null;
    } else {
      transportFeeId = Get.arguments;
    }
    onGetTransportFeeDetail();
    onGetListProduct();
  }

  void onChangeUnit(Unit value, int id) {
    selectedUnit = value;
    editUnit = id;
    update();
  }

  void onChangeProduct(ItemProduct value) {
    selectedItemProduct = value;
    update();
  }

  void onGetTransportFeeDetail() {
    repository!.onGetTransportFeeDetail(transportFeeId!).then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
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
    AddTransportFormFeeRequest _request = AddTransportFormFeeRequest(
      transportFormId: transportFeeId!,
      from: fromController.text,
      to: toController.text,
      transportfeeDN: feeDNController.text,
      transportfeeHN: feeHNController.text,
      transportfeeSG: feeSGController.text,
      unit: selectedUnit!.name,
    );
    repository!.onAddTransportFee(_request).then((value) {
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      update();
    });
  }
}
