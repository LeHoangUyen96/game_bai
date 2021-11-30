import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/ui/order/contract/order_contract.dart';

class ValidOrderController extends GetxController implements OrderContract {

  OrderRepositories? orderRepositories;
  OrderResponse? orderResponse;

  bool checkFilter = false;
  bool checkFromDay = false;
  bool checkToDay = false;
  bool checkAction = false;
  bool isCheck = false;


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

  void onCheckFilter(){
    checkFilter = !checkFilter;
    update();
  }

 void onCheckAction(){
    checkAction = !checkAction;
    update();
  }

  void onCheckDatetime(){
    checkFilter = !checkFilter;
    update();
  }

  void onChangeDefault(){
    isCheck = !isCheck;
    // if(isCheck==true){
    //   defaults = 1;
    // } else defaults = 0;
    // print("$defaults");
    update();
  }

  // void onCheckFilter(){
  //   checkFilter = !checkFilter;
  //   update();
  // }

}