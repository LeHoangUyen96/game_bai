import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/request/create_bag_request.dart';
import 'package:viet_trung_mobile/data/request/list_order_add_bag_request.dart';
import 'package:viet_trung_mobile/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/create_bag_page.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class ListOrderAddToBagController extends GetxController {
  TextEditingController numberPackageController = TextEditingController();
  TextEditingController searchBillCodeController = TextEditingController();
  ListOrderAddBagResponse ? listOrderAddBagResponse;
  List< DataListOrderAddBagResponse> ? mDataListOrderAddBagResponse =[];
  List< DataListOrderAddBagResponse> ? mDataListOrder =[];
  BagRepositories ? bagRepositories;
  int? transport_form_id;
  String? warehouse_back_code;
  int? order_id;
  int? number_package;
  List<DataOrderCreateBag>? mListOrders = [];
  DataOrderCreateBag ? mDataOrderCreateBag;
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
     numberPackageController = TextEditingController();
    print("transport_form_id:$transport_form_id");
    print("warehouse_back_code:$warehouse_back_code");
    onGetListOrderAddToBag();
  }
  void onGetListOrderAddToBag(){
    //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    ListOrderAddBagRequest request = ListOrderAddBagRequest(
      warehouse_back_code: warehouse_back_code,
      transport_form_id: transport_form_id,
    );
      bagRepositories!.onGetListOrderAddBag(request).then((value) {
        //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
        listOrderAddBagResponse = value;
        mDataListOrderAddBagResponse!.addAll(listOrderAddBagResponse!.data!);
        update();
      }).catchError((onError){
       return onError(onError);
      });
    
    update();
  }
  void onSearchBillCode (){
    bagRepositories!.onSearchBillCode(searchBillCodeController.text, warehouse_back_code!, transport_form_id!)
       .then((value) {
        listOrderAddBagResponse = value;
        mDataListOrderAddBagResponse!.addAll(listOrderAddBagResponse!.data!);
        update();
       }).catchError((onError){
         Get.snackbar(PROFILE_NOTIFY, onError.toString());
       });
       update();
  }
  void onChangeNumberPackage(String val,int idOrder){
    for(var i = 0; i < mDataListOrderAddBagResponse!.length; i++){
      if(mDataListOrderAddBagResponse![i].id == idOrder 
           && number_package! <= mDataListOrderAddBagResponse![i].number_package_remain! && number_package! > 0){
             mDataListOrderAddBagResponse![i].isCheck = true;
             if(mDataListOrderAddBagResponse![i].isCheck = true){
              mDataListOrder!.add(mDataListOrderAddBagResponse![i]);
              mDataListOrderAddBagResponse![i].number_package_remain = number_package;

              //update();
             }
           }
    }
    // number_package = int.parse(val,onError: (val) => -1) ;
    // print('onchange ${numberPackageController}');
    //update();
  }
  void onAddBag(){
    for (var i = 0; i < mDataListOrderAddBagResponse!.length; i++) {
      if(mDataListOrderAddBagResponse![i].isCheck = true){
        //mDataListOrder!.add(mDataListOrderAddBagResponse![i]);
          print("order_id: $order_id");
          print("number_package: $number_package");
          Get.back(result: mDataListOrder);
          update();
      }
      // if(number_package! <= mDataListOrderAddBagResponse![i].number_package_remain! && number_package! > 0){
      //   mDataListOrderAddBagResponse![i].isCheck = true;
      //   if(mDataListOrderAddBagResponse![i].isCheck = true){
      //     mDataListOrderAddBagResponse![i].number_package_remain = number_package;
      //     mDataListOrder!.add(mDataListOrderAddBagResponse![i]);
          // mDataListOrderAddBagResponse![i].id = order_id;
          // mListOrders!.add(DataOrderCreateBag(
          //   order_id : mDataListOrderAddBagResponse![i].id,
          //   number_package : number_package,
          // ));
          // Get.to(CreateBagPage(),arguments: {
          //   "order_id" : order_id,
          //   "number_package" : number_package,
          // });
      //     print("order_id: $order_id");
      //     print("number_package: $number_package");
      //     Get.back(result: mDataListOrder);
      //     update();
      //   }
      // }
      

    }
  }
}