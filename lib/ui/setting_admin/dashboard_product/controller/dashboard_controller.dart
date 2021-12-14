import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/dashboard_product_reponsitory/dashboard_product_reponsitories.dart';
import 'package:viet_trung_mobile/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/list_product_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class DashboardProductController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  TransportAdminRepositories? transportRepository;
  DashboardProductRepositories? dashboardProductRepository;
  ListProductResponse? productResponse;
  List<ItemProduct>? listProducts;
  TextEditingController nameProductController = TextEditingController();
  int? editName = 0;
  bool nameValid = true;
  String? nameError;

  @override
  void onInit() {
    super.onInit();
    transportRepository = Injector().transport;
    dashboardProductRepository = Injector().dashboardProduct;
    onGetListProduct();
  }

  void onGetListProduct() {
    transportRepository!.onGetListProduct().then((value) {
      productResponse = value;
      listProducts = value.data!;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onRefresh() async {
    onGetListProduct();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    onGetListProduct();
    refreshController.refreshCompleted();
  }

  void onDeleteProduct(String id) {
    dashboardProductRepository!.onDeleteProduct(id).then((value) {
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onCreateTransportFee() {
    if (nameProductController.text.isEmpty) {
      nameValid = false;
      nameError = errorName;
    } else {
      nameValid = true;
    }

    if (nameValid) {
      dashboardProductRepository!
          .onAddProduct(nameProductController.text)
          .then((value) {
        nameProductController.clear();
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
