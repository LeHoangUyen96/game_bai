import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderInfoController extends GetxController with SingleGetTickerProviderMixin {

  TabController? tabController;

  bool isOpenBottomSheetListOrder = true;
  int? id;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    // id = Get.arguments;
    // print("$id");
  }
  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }
  void onChangePage(int index){
    tabController!.animateTo(index);
    switch (tabController!.index) {
      case 0:
        print("Danh sách hàng về");
        // Get.to(OrderInfoPage());
        break;
      case 1:
        print("Danh sách hàng lưu kho");
        // Get.to(OrderInfoPage());
        break;

    }
    print(tabController!.index.toString());
    print("change page");
  }


}
