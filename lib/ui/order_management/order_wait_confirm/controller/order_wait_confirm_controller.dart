import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';

class OrderWaitConfirmController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderOwnerlessResponse? orderWaitConfirm;

  @override
  void onInit() {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    onGetListOrderWaitConfirm();
  }

  void onGetListOrderWaitConfirm() {
    orderAminRepositories!.onGetListOrderWaitConfirm().then((value) {
      orderWaitConfirm = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }
}
