import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/ramdom_bill_order_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class EnterWarehouseController extends GetxController  {
  TextEditingController barCodeValueController = TextEditingController();
  TextEditingController billCodeValueController = TextEditingController();
  String  phoneErros = '';
  bool isPhoneValid = true;
  bool isCheck = false;
  int defaults = 1;
  String? scanBarcode = "Khong co gi het";
  bool? isCheckInfoUser;
  String? user_id;
  String? name;
  String? phone;
  RamdomBillOrderResponse? ramdomBillOrderResponse;
  OrderRepositories? orderRepositories;
  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      if(Get.arguments['user_id'] == null){
        //this.onError(ErrorResponse(message: 'Mã khách hàng trống'));
        user_id = "";
      }else{
        user_id = Get.arguments['user_id'];
      }
      if(Get.arguments['phone'] == null){
        this.onError(ErrorResponse(message: 'Số điện thoại trống'));
      }else{
        phone = Get.arguments['phone'];
      }
      if(Get.arguments['name'] == null){
        //this.onError(ErrorResponse(message: 'Tên khách hàng trống'));
        name ="Không xác định";
      }else{
        name = Get.arguments['name'];
      }  
    }
    orderRepositories =Injector().order; 
    
  }
  
  
   Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;
    if (barcodeScanRes.isNotEmpty &&
        barcodeScanRes != 'Failed to get platform version.') {
      scanBarcode = barcodeScanRes;
      barCodeValueController =TextEditingController(text: barcodeScanRes);
      print(" isBarCode +$scanBarcode");
    }
    update();
  }
  void onRamdomBillOrder(){
    orderRepositories!.onRamdomBillOrder(user_id!).then((value){
      ramdomBillOrderResponse = value;
      barCodeValueController = TextEditingController(text: ramdomBillOrderResponse!.data!.bill_code);
      print("isRamdomBillCode + ${ramdomBillOrderResponse!.data!.bill_code.toString()}");
       update();
    }).catchError((onError){
      print('isErorrs');
      update();
    });
  }

  void onChangeDefault(){
    isCheck = !isCheck;
    if(isCheck==true){
      defaults = 2;
    } else defaults = 1;
    print("$defaults");
    update();
  }
    @override
  void onError(ErrorResponse msg) {
    Get.snackbar(PROFILE_NOTIFY, msg.message.toString());
    // Get.snackbar("Thông báo", msg.message.toString());
    Get.back();
    // TODO: implement onError
  }
}