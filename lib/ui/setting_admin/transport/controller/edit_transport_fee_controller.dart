import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
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
  List<String> unit = [
    kg,
    m3,
  ];
  String? selectedUnit;
  TransportFeeDetailResponse? response;
  List<ItemProduct>? nameProduct;
  ItemProduct? selectedItemProduct;
  String? nameItem;
  ListProductResponse? productResponse;
  int? idProduct;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().transport;
    if (Get.arguments == null) {
      transportFeeId = null;
    } else {
      transportFeeId = Get.arguments;
    }
    onGetTransportFeeDetail(transportFeeId!);
    onGetListProduct();
  }

  void onChangeUnit(String value) {
    selectedUnit = value;
    update();
  }

  void onChangeProduct(ItemProduct value) {
    selectedItemProduct = value;
    idProduct = value.id!;
    update();
  }

  void onGetTransportFeeDetail(String id) {
    repository!.onGetTransportFeeDetail(transportFeeId!).then((value) {
      response = value;
      feeHNController =
          TextEditingController(text: value.data!.transportFeeHN!);
      feeDNController =
          TextEditingController(text: value.data!.transportFeeDN!);
      feeSGController =
          TextEditingController(text: value.data!.transportFeeSG!);
      fromController = TextEditingController(text: value.data!.from!);
      toController = TextEditingController(text: value.data!.to!);
      selectedUnit = value.data!.unit!;
      idProduct = value.data!.productId!;
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

  void onUpdateTransportFee(String id) {
    AddTransportFormFeeRequest _request = AddTransportFormFeeRequest(
      transportFormId: transportFeeId!.toString(),
      from: fromController.text,
      to: toController.text,
      transportfeeDN: feeDNController.text,
      transportfeeHN: feeHNController.text,
      transportfeeSG: feeSGController.text,
      unit: selectedUnit!,
      productId: idProduct!,
    );
    repository!.onUpdateTransportFee(transportFeeId!, _request).then((value) {
      Get.back();
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      update();
    });
  }
}
