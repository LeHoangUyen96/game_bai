import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class EnterWarehouseController extends GetxController  {
  TextEditingController phoneValueController = TextEditingController();
  TextEditingController barCodeValueController = TextEditingController();
  String  phoneErros = '';
  bool isPhoneValid = true;
  bool isCheck = false;
  int defaults = 0;
  String? scanBarcode = "Khong co gi het";
  @override
  void onInit() {
    super.onInit();
    
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

  void onChangeDefault(){
    isCheck = !isCheck;
    if(isCheck==true){
      defaults = 1;
    } else defaults = 0;
    print("$defaults");
    update();
  }
}