import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/ui/order/contract/order_contract.dart';

class OrderController extends GetxController implements OrderContract {

  OrderRepositories? orderRepositories;
  OrderResponse? orderResponse;

@override
  void onInit() {
    super.onInit();
    orderRepositories = Injector().order;
    onGetListOrder();
  }

  void onGetListOrder(){
    orderRepositories!.onGetListOrder(1).then((value) {
      orderResponse = value;
      update();
    }).catchError((onError){
      print("Lỗiiiiiiii");
      update();
    });
    update();
  }

}