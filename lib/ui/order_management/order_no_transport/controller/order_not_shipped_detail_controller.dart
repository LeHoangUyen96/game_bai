import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/models/method_send.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class OrderNoTransportDetailController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminDetailResponse? orderNoTransport;
  TextEditingController noteController = TextEditingController();
  String? orderId;
  int? currentMethodSend = 0;
  MethodSend? selectedMethodSend;
  final methodSend = [
    MethodSend(1, returnSupplie),
    MethodSend(2, storage),
  ];

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
  }

  void onGetOrderDetail(String id) {
    orderAminRepositories!.onGetOrderDetail(id).then((value) {
      orderNoTransport = value;
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
}
