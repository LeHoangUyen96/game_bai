import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';

class OrderOwnerlessController extends GetxController
    with SingleGetTickerProviderMixin {
  OrderAdminRepositories? orderAminRepositories;
  OrderOwnerlessResponse? orderOwnerless;

  @override
  void onInit() async {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    onGetListOrderAdminOwnerless();
  }

  void onGetListOrderAdminOwnerless() {
    orderAminRepositories!.onGetListOrderOwnerless().then((value) {
      orderOwnerless = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }
}
