import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/request/confirm_order_request.dart';
import 'package:viet_trung_mobile/data/response/address_response.dart';
import 'package:viet_trung_mobile/data/response/order_detail_response.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class ConfirmOrderController extends GetxController {
  TextEditingController noteValueController = TextEditingController();
  OrderRepositories? orderRepositories;
  OrderResponse? orderResponse;
  OrderDetailsResponse? orderDetailsResponse;
  AddressRepository? addressRepository;
  List<DataAddress>? mdataAddress = [];
  DataAddress? selectAddress;
  int? id;
  Color? color;
  int? selectedType = 1;
  int address = 0;
  int? type;
@override
  void onInit() {
    super.onInit();
    orderRepositories = Injector().order;
    addressRepository = Injector().address;
    // id = Get.arguments;
    // print("$id");
    //onGetDetailsOrder();
    onGetAddressAll();
     if(Get.arguments != null){
      if(Get.arguments['id'] == null){
        id = null;
      }else{
        id = Get.arguments['id'];
      }
      if(Get.arguments['orderDetailsResponse'] == null){
      }else{
        orderDetailsResponse = Get.arguments['orderDetailsResponse'];
      }
      if(Get.arguments['type'] == null){
        type = 0;
      }else{
        type = Get.arguments['type'];
      }
     }
     print("isType $type");
  }
   Color ColorStatusName( String order_status_name) {
    switch (order_status_name) {
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
    return color!;
  }
 void onSelecteType(int value){
      if(value == 1){
        selectedType = 1;
        update();
      }  else if (value == 2){
        selectedType = 2;
        update();
      }
      print("isType $selectedType");
      update(); 
  }
  void onChangeAddress(DataAddress value, int id){
    selectAddress = value;
    address = id;
    update();
  }
  void onGetAddressAll() {
    addressRepository!.onGetAddress().then((value) {
      //mdataAddress!.clear();
      mdataAddress!.addAll(value);
      update();
      if (mdataAddress!.length > 0) {
        for (int i = 0; i < mdataAddress!.length; i++) {
          print('AddressController mdatas![i] ${mdataAddress![i]}');
        }
      }
      print(mdataAddress!.length.toString());
      update();
    }).catchError((onError) {
      // Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
      print("Error");
    });
    update();
  }

  // void onGetDetailsOrder(){
  //   orderRepositories!.onGetDetailsOrder(id!).then((value) {
  //     orderDetailsResponse = value;
  //     update();
  //   }).catchError((onError){
  //     Get.defaultDialog(title: (onError).message.toString(), middleText: '');
  //     update();
  //   });
  //   update();
  // }
  void onConfirmOrder(){
    if(address != 0){
      ConfirmOrderRequest request = ConfirmOrderRequest(
        order_id : ParseNumber.parseInt(id),
        type : selectedType,
        note: noteValueController.text.toString(),
        address_id : address,
      );
      orderRepositories!.onConfirmOrder(request).then((value){
        Get.snackbar(NOTIFY, "Xác nhận đơn hàng thành công");
          }).catchError((onError) {
            return onError(onError);
          });
      Get.back(result: request);
      update();    
    }
      
      
      update();
   }
}