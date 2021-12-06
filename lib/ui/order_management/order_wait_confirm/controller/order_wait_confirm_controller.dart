import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';

class OrderWaitConfirmController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderOwnerlessResponse? orderWaitConfirm;
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
