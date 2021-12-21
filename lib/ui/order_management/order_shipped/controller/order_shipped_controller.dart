import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/response/list_status_response.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_response.dart';

class OrderShippedController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminResponse? orderShipped;
  RefreshController refreshOrderController =
      RefreshController(initialRefresh: false);
  int? total;
  int positionSelected = 0;
  ListStatusResponse? statusResponse;
  OrderAdminResponse? orderCN;
  OrderAdminResponse? orderSG;
  OrderAdminResponse? orderHN;
  OrderAdminResponse? orderDN;
  OrderAdminResponse? orderReceive;
  OrderAdminResponse? orderDelivery;
  OrderAdminResponse? orderProcedure;
  OrderAdminResponse? orderBorder;

  @override
  void onInit() {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    onGetListOrderShipped();
    onGetListStatus();
    onGetListOrderCN();
    onGetListOrderBorder();
    onGetListOrderDN();
    onGetListOrderHN();
    onGetListOrderSG();
    onGetListOrderDelivery();
    onGetListOrderProcedure();
    onGetListOrderReceive();
  }

  void onSelect(int index) {
    positionSelected = index;
    update();
  }

  void onGetListOrderShipped() {
    orderAminRepositories!.onGetListOrderShipped().then((value) {
      orderShipped = value;
      total = value.paginate!.total!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListOrderCN() {
    orderAminRepositories!.onGetListOrderCN().then((value) {
      orderCN = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListOrderHN() {
    orderAminRepositories!.onGetListOrderHN().then((value) {
      orderHN = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListOrderDN() {
    orderAminRepositories!.onGetListOrderDN().then((value) {
      orderDN = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListOrderSG() {
    orderAminRepositories!.onGetListOrderSG().then((value) {
      orderSG = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListOrderBorder() {
    orderAminRepositories!.onGetListOrderBorder().then((value) {
      orderBorder = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListOrderReceive() {
    orderAminRepositories!.onGetListOrderReceive().then((value) {
      orderReceive = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListOrderDelivery() {
    orderAminRepositories!.onGetListOrderDelivery().then((value) {
      orderDelivery = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListOrderProcedure() {
    orderAminRepositories!.onGetListOrderProcedure().then((value) {
      orderProcedure = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListStatus() {
    orderAminRepositories!.onGetListStatus().then((value) {
      statusResponse = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onRefreshOrder() async {
    onGetListOrderShipped();
    refreshOrderController.refreshCompleted();
  }

  void onLoadingOrder() async {
    onGetListOrderShipped();
    refreshOrderController.refreshCompleted();
  }
}
