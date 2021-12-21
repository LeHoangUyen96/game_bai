import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/dashboard_reponsitoy/dashboard_reponsitoy.dart';
import 'package:viet_trung_mobile_admin/data/response/dashboard_admin_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class DashboardAdminController extends GetxController {
  DashboardAdminResponse? dashboardAdminResponse;
  DashboardRepositories? dashboardRepositories;
  Color? color;
  DataOrderWaits? selectedOrderWaits;
  DataTotalOrder? selectedTotalOrder;
  List<DataOrderWaits>? mOrderWaits;
  int? orderWaits;
  int? orderTotal;
  String? timeOrderWait;
  String? timeOrderTotal;
  @override
  void onInit() {
    super.onInit();
    ;
    dashboardRepositories = Injector().dashboard;
    onGetDashBoardAdmin();
  }

  void onGetDashBoardAdmin() {
    dashboardRepositories!.onGetDashboardAdmin().then((value) {
      dashboardAdminResponse = value;
      onChangeOrderTotal(dashboardAdminResponse!.orders![0],
          dashboardAdminResponse!.orders![0].time.toString());
      onChangeOrderWaits(dashboardAdminResponse!.order_waits![0],
          dashboardAdminResponse!.order_waits![0].time.toString());
      update();
    }).catchError((onError) {
      Get.snackbar(PROFILE_NOTIFY, onError.toString());
    });
  }

  void onChangeOrderWaits(DataOrderWaits value, String time) {
    selectedOrderWaits = value;
    timeOrderWait = time;
    onGetOrderWait();
    print("is timeOrderWait ${timeOrderWait}");
    update();
  }

  void onGetOrderWait() {
    for (var i = 0; i < dashboardAdminResponse!.order_waits!.length; i++) {
      if (dashboardAdminResponse!.order_waits![i].time == timeOrderWait) {
        orderWaits = dashboardAdminResponse!.order_waits![i].order_wait;
        print("is OrderWait ${orderWaits}");
      }
    }
  }

  void onChangeOrderTotal(DataTotalOrder value, String time) {
    selectedTotalOrder = value;
    timeOrderTotal = time;
    onGetOrderTotal();
    print("timeOrderTotal ${timeOrderTotal}");
    update();
  }

  void onGetOrderTotal() {
    for (var i = 0; i < dashboardAdminResponse!.orders!.length; i++) {
      if (dashboardAdminResponse!.orders![i].time == timeOrderTotal) {
        orderTotal = dashboardAdminResponse!.orders![i].order;
        print("is orderTotal ${orderTotal}");
      }
    }
  }

  Color ColorStatusName(String order_status_name) {
    switch (order_status_name) {
      case ORDER_LIST_CHINA_WAREHOUSE:
        color = COLOR_ORDER_CHINESE_WAREHOUSE;
        break;
      case ORDER_EXPORT_TO_CHINA:
        color = COLOR_ORDER_EXPORT_TO_CHINA;
        break;
      case ORDER_BORDER_WAREHOUSE:
        color = COLOR_ORDER_BORDER_WAREHOUSE;
        break;
      case ORDER_PROCESS:
        color = COLOR_ORDER_PROCESS;
        break;
      case ORDER_HN_WAREHOUSE:
        color = COLOR_ORDER_HN_WAREHOUSE;
        break;
      case ORDER_SG_WAREHOUSE:
        color = COLOR_ORDER_SG_WAREHOUSE;
        break;
      case ORDER_DN_WAREHOUSE:
        color = COLOR_ORDER_DN_WAREHOUSE;
        break;
      case ORDER_DELIVERY_IN_PROGRESS:
        color = COLOR_ORDER_DELIVERY_IN_PROGRESS;
        break;
      case ORDER_DELIVERY_SUCCESSFULL:
        color = COLOR_ORDER_DELIVERY_SUCCESSFULL;
        break;
    }
    return color!;
  }
}
