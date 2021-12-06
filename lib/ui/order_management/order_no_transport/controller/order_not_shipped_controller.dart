import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_admin_response.dart';

class OrderNoTransportController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminResponse? orderNotTranport;
  RefreshController refreshOrderController =
      RefreshController(initialRefresh: false);
  int? total;

  @override
  void onInit() {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    onGetListOrderNoTransport();
  }

  void onGetListOrderNoTransport() {
    orderAminRepositories!.onGetListOrderNoTransport().then((value) {
      orderNotTranport = value;
      total = value.paginate!.total!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onRefreshOrder() async {
    onGetListOrderNoTransport();
    refreshOrderController.refreshCompleted();
  }

  void onLoadingOrder() async {
    refreshOrderController.refreshCompleted();
  }
}
