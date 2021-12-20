import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_response.dart';

class OrderWaitConfirmController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminResponse? orderWaitConfirm;
  RefreshController refreshOrderController =
      RefreshController(initialRefresh: false);
  int? total;

  @override
  void onInit() {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    onGetListOrderWaitConfirm();
  }

  void onGetListOrderWaitConfirm() {
    orderAminRepositories!.onGetListOrderWaitConfirm().then((value) {
      orderWaitConfirm = value;
      total = value.paginate!.total!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onRefreshOrder() async {
    onGetListOrderWaitConfirm();
    refreshOrderController.refreshCompleted();
  }

  void onLoadingOrder() async {
    onGetListOrderWaitConfirm();
    refreshOrderController.refreshCompleted();
  }
}
