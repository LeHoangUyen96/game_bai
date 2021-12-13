import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/ui/order/contract/order_contract.dart';

class OrderInventoryListController extends GetxController
    implements OrderContract {
  bool isCheck = false;
  int defaults = 0;
  OrderRepositories? orderRepositories;
  OrderResponse? orderResponse;
  bool selectedAll = false;
  List<int> listOrderId = [];
  DataOrder? mDataOrder;

  @override
  void onInit() {
    super.onInit();
    orderRepositories = Injector().order;
    onGetListOrder();
  }

  void onGetListOrder() {
    orderRepositories!.onGetListOrder(2).then((value) {
      orderResponse = value;
      update();
    }).catchError((onError) {
      print("Lỗiiiiiiii");
      update();
    });
    update();
  }

  void selectAllProduct() {
    if (selectedAll == true) {
      for (var i = 0; i < orderResponse!.data!.length; i++) {
        orderResponse!.data![i].selected = false;
      }
    } else {
      for (var i = 0; i < orderResponse!.data!.length; i++) {
        orderResponse!.data![i].selected = true;
      }
    }
    selectedAll = !selectedAll;
    update();
  }

  void onToggleSelect(int idProduct) {
    for (var i = 0; i < orderResponse!.data!.length; i++) {
      if (orderResponse!.data![i].id == idProduct) {
        orderResponse!.data![i].selected = !orderResponse!.data![i].selected!;
      }
    }
    update();
  }

  void onChangeDefault() {
    isCheck = !isCheck;
    if (isCheck == true) {
      defaults = 1;
    } else
      defaults = 0;
    print("$defaults");
    update();
  }

  // void onChangeCity(Delivery value, int id){
  //   selectedDelivery = value;
  //   checkDelivery = id;
  //   update();
  // }
}
