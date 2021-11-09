import 'package:get/get.dart';
import 'package:viet_trung_mobile/ui/order/contract/order_contract.dart';

class OrderInventoryListController extends GetxController implements OrderContract {
  bool isCheck = false;
  int defaults = 0;
@override
  void onInit() {
    super.onInit();
   
  }
 
 void onChangeDefault(){
    isCheck = !isCheck;
    if(isCheck==true){
      defaults = 1;
    } else defaults = 0;
    print("$defaults");
    update();
  }
}