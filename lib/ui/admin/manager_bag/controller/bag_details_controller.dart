import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/bag_details_response.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class BagDetailsController extends GetxController  {
  List< DataListStatusBagResponse> ? mDataListStatusBagResponse =[];
  BagRepositories ? bagRepositories;
  ListStatusBagResponse ? listStatusBagResponse;
  DataBagDetailsResponse ? mDataBagDetailsResponse;
  BagDetailsResponse ? bagDetailsResponse;
  String? item_code;
  bool changeBill = false;
  int? id;
  Color? color;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    id = Get.arguments;
    print('$id');
    onGetDetailBag();
  }
  Future<List<DataListStatusBagResponse>> getDataStatusBag () async {
    bagRepositories!.onGetListBagStatus().then((value){
      listStatusBagResponse = value;
      mDataListStatusBagResponse!.addAll(listStatusBagResponse!.data!);
    }).catchError((onError){
    });
    return mDataListStatusBagResponse!;
  }
  void onChange (int change){
    if(change == 1){
      changeBill = !changeBill;
    }
    update();
  }
  void isShowCard(DataSearchCustomer data) {
    
    update();
  }
  void onGetDetailBag() {
    bagRepositories!.onGetDetailsBag(id!).then((value){
      bagDetailsResponse = value;
      update();
   }).catchError((onError){
     Get.defaultDialog(title: (onError).message.toString(), middleText: '');
      update();
    });
  }
  void onUpdateStatusBag() {
    bagRepositories!
        .onUpdateSatusBag(item_code!, id!)
        .then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      print("--------------$value");
      update();
    }).catchError((onError) {
      Get.snackbar(PROFILE_NOTIFY, onError.toString());
    });
  }
  Color ColorStatusName( String parent_pack_status_name) {
    switch (parent_pack_status_name) {
      case ORDER_LIST_CHINA_WAREHOUSE:
        color = COLOR_ORDER_CHINESE_WAREHOUSE;
        break;
      case ORDER_EXPORT_TO_CHINA:
        color = COLOR_ORDER_EXPORT_TO_CHINA;
        break;
      case ORDER_BORDER_WAREHOUSE:
        color = COLOR_ORDER_BORDER_WAREHOUSE;
        break;
      case ORDER_PROCESS:
        color = COLOR_ORDER_PROCESS;
        break;
      case ORDER_HN_WAREHOUSE:
        color = COLOR_ORDER_HN_WAREHOUSE;
        break;
      case ORDER_SG_WAREHOUSE:
        color = COLOR_ORDER_SG_WAREHOUSE;
        break;
      case ORDER_DN_WAREHOUSE:
        color = COLOR_ORDER_DN_WAREHOUSE;
        break;
      case ORDER_DELIVERY_IN_PROGRESS:
        color = COLOR_ORDER_DELIVERY_IN_PROGRESS;
        break;
      case ORDER_DELIVERY_SUCCESSFULL:
        color = COLOR_ORDER_DELIVERY_SUCCESSFULL;
        break;        
    }
    return color !;
  }
}