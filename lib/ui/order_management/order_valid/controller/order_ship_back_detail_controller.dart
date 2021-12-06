import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_admin_detail_response.dart';

class OrderShipBackDetailController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminDetailResponse? orderShipBack;
  String? orderId;
  bool isCheck = false;

  @override
  void onInit() {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    if (Get.arguments == null) {
      orderId = null;
    } else {
      orderId = Get.arguments;
    }
    onGetOrderDetail(orderId!);
  }

  void onGetOrderDetail(String id) {
    orderAminRepositories!.onGetOrderDetail(id).then((value) {
      orderShipBack = value;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onCheck() {
    isCheck = !isCheck;
    update();
  }
}
