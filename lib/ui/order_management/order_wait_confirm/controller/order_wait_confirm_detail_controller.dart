import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/models/method_send.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class OrderWaitConfirmDetailController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminDetailResponse? orderWaitConfirmDetail;
  TextEditingController noteController = TextEditingController();
  String? orderId;
  int? currentMethodSend = 0;
  List<DataPackingForm>? packingForm;
  List<DataTransportForm>? transportForm;
  DataPackingForm? selectedPackingForm;
  DataTransportForm? selectedTransportForm;
  MethodSend? selectedMethodSend;
  final methodSend = [
    MethodSend(1, packOrderBack),
    MethodSend(2, storage),
  ];

  bool transportValid = true;
  bool packingValid = true;
  String? transportError;
  String? packingError;
  int packing = 0;
  int transport = 0;

  @override
  void onInit() {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    if (Get.arguments == null) {
      orderId = null;
    } else {
      orderId = Get.arguments;
    }
    onGetOrderDetail(orderId!);
    onGetListTransport();
    onGetListPacking();
  }

  void onGetOrderDetail(String id) {
    orderAminRepositories!.onGetOrderDetail(id).then((value) {
      orderWaitConfirmDetail = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onChangeMethodSend(MethodSend value, int id) {
    currentMethodSend = value.id! - 1;
    update();
  }

  void onGetListPacking() {
    orderAminRepositories!.onGetListPackingForm().then((value) {
      packingForm = value.data!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListTransport() {
    orderAminRepositories!.onGetListTransportForm().then((value) {
      transportForm = value.data!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onChangePacking(DataPackingForm value, int id) {
    selectedPackingForm = value;
    packing = id;
    update();
  }

  void onChangeTransport(DataTransportForm value, int id) {
    selectedTransportForm = value;
    transport = id;
    update();
  }
}
