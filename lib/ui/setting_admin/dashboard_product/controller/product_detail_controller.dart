import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/dashboard_product_reponsitory/dashboard_product_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/response/product_detail_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class ProductDetailController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  DashboardProductRepositories? dashboardProductRepository;
  TextEditingController nameProductController = TextEditingController();
  int? editName = 0;
  bool nameValid = true;
  String? nameError;
  String? productId;
  ProductDetailResponse? productDetail;

  @override
  void onInit() {
    super.onInit();
    dashboardProductRepository = Injector().dashboardProduct;
    if (Get.arguments == null) {
      productId = null;
    } else {
      productId = Get.arguments;
    }
    getProductDetail(productId!);
  }

  void getProductDetail(String id) {
    dashboardProductRepository!.onGetProductDetail(productId!).then((value) {
      productDetail = value;
      nameProductController = TextEditingController(text: value.data!.name!);
      update();
    }).catchError((onError) {
      update();
    });
  }

  void onUpdateProduct(String id) {
    if (nameProductController.text.isEmpty) {
      nameValid = false;
      nameError = errorName;
    } else {
      nameValid = true;
    }

    if (nameValid) {
      dashboardProductRepository!
          .onUpdateProduct(productId!, nameProductController.text)
          .then((value) {
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
