  import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/request/list_order_add_bag_request.dart';
import 'package:viet_trung_mobile/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class ListOrderAddToBagController extends GetxController  {
  ListOrderAddBagResponse ? listOrderAddBagResponse;
  List< DataListOrderAddBagResponse> ? mDataListOrderAddBagResponse =[];
  BagRepositories ? bagRepositories;
  int? transport_form_id;
  String? warehouse_back_code;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
     if (Get.arguments != null) {
      if (Get.arguments['transport_form_id'] == null) {
        transport_form_id = null;
      } else {
        transport_form_id = Get.arguments['transport_form_id'];
      }
      if (Get.arguments['warehouse_back_code'] == null) {
      } else {
        warehouse_back_code = Get.arguments['warehouse_back_code'];
      }
      
    }
    onGetListOrderAddToBag();
  }
  void onGetListOrderAddToBag(){
    ListOrderAddBagRequest request = ListOrderAddBagRequest(
      warehouse_back_code : warehouse_back_code,
      transport_form_id : transport_form_id,
    );
      bagRepositories!.onGetListOrderAddBag(request).then((value) {
        listOrderAddBagResponse = value;
        mDataListOrderAddBagResponse!.addAll(listOrderAddBagResponse!.data!);
      }).catchError((onError){
        Get.snackbar(PROFILE_NOTIFY, onError.toString());
      });
    
    update();
  }
}