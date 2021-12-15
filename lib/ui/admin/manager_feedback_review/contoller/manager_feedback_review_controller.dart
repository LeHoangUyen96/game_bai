import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/ui/order/view/order_list.dart';

class ManagerFeedbackReviewController extends GetxController
    with SingleGetTickerProviderMixin {
  int positionSelected = 0;
  final List<Status> listStatus = [
    Status('Tất cả'),
    Status('5 sao'),
    Status('4 sao'),
    Status('3 sao'),
    Status('2 sao'),
    Status('1 sao'),
  ];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
  }

  void onRefresh() async {
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    refreshController.refreshCompleted();
  }
}
