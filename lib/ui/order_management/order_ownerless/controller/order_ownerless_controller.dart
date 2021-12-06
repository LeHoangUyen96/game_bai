import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_admin_response.dart';

class OrderOwnerlessController extends GetxController
    with SingleGetTickerProviderMixin {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminResponse? orderOwnerless;
  int? total;

  @override
  void onInit() async {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    onGetListOrderAdminOwnerless();
  }

  RefreshController refreshOrderController =
      RefreshController(initialRefresh: false);

  void onGetListOrderAdminOwnerless() {
    orderAminRepositories!.onGetListOrderOwnerless().then((value) {
      orderOwnerless = value;
      total = value.paginate!.total!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onRefreshOrder() async {
    onGetListOrderAdminOwnerless();
    refreshOrderController.refreshCompleted();
  }

  void onLoadingOrder() async {
    onGetListOrderAdminOwnerless();
    refreshOrderController.refreshCompleted();
  }
}
