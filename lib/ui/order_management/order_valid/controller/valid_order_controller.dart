import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/ui/order/contract/order_contract.dart';

class ValidOrderController extends GetxController implements OrderContract {
  OrderRepositories? orderRepositories;
  OrderResponse? orderResponse;
  OrderAdminRepositories? orderAminRepositories;
  OrderOwnerlessResponse? orderShipBack;
  OrderOwnerlessResponse? orderStorage;
  RefreshController refreshOrderShipBackController =
      RefreshController(initialRefresh: false);

  RefreshController refreshOrderStorageController =
      RefreshController(initialRefresh: false);

  bool checkFilter = false;
  bool checkFromDay = false;
  bool checkToDay = false;
  bool checkAction = false;
  bool isCheck = false;

  @override
  void onInit() {
    super.onInit();
    orderRepositories = Injector().order;
    orderAminRepositories = Injector().orderAmin;
    onGetListOrderShipBack();
    onGetListOrderStorage();
    onGetListOrder();
  }

  void onGetListOrder() {
    orderRepositories!.onGetListOrder(1).then((value) {
      orderResponse = value;
      update();
    }).catchError((onError) {
      print("Lỗiiiiiiii");
      update();
    });
    update();
  }

  void onGetListOrderShipBack() {
    orderAminRepositories!.onGetListOrderValidShipBack().then((value) {
      orderShipBack = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListOrderStorage() {
    orderAminRepositories!.onGetListOrderValidStorage().then((value) {
      orderStorage = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onRefreshOrderShipBack() async {
    onGetListOrderShipBack();
    refreshOrderShipBackController.refreshCompleted();
  }

  void onLoadingOrderShipBack() async {
    onGetListOrderShipBack();
    refreshOrderShipBackController.refreshCompleted();
  }

  void onRefreshOrderStorage() async {
    onGetListOrderStorage();
    refreshOrderStorageController.refreshCompleted();
  }

  void onLoadingOrderStorage() async {
    onGetListOrderStorage();
    refreshOrderStorageController.refreshCompleted();
  }

  void onCheckFilter() {
    checkFilter = !checkFilter;
    update();
  }

  void onCheckAction() {
    checkAction = !checkAction;
    update();
  }

  void onCheckDatetime() {
    checkFilter = !checkFilter;
    update();
  }

  void onChangeDefault() {
    isCheck = !isCheck;
    update();
  }
}
