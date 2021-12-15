import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';
import 'package:viet_trung_mobile/data/request/enter_warehouse_request.dart';
import 'package:viet_trung_mobile/data/response/admin_add_image_enter_warehouse_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/errors_enter_warehouse.dart';
import 'package:viet_trung_mobile/data/response/list_product_response.dart';
import 'package:viet_trung_mobile/data/response/ramdom_bill_order_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ulti/helper/handle_image.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class EnterWarehouseController extends GetxController {
  TextEditingController barCodeValueController = TextEditingController();
  TextEditingController billCodeValueController = TextEditingController();
  TextEditingController itemValueController = TextEditingController();
  TextEditingController transportFeeController = TextEditingController();
  TextEditingController numberPackageController = TextEditingController();
  //int? is_prohibited_item;
  String phoneErros = '';
  bool isPhoneValid = true;
  bool isCheck = false;
  int is_prohibited_item = 1;
  String? scanBarcode = "Khong co gi het";
  bool? isCheckInfoUser;
  String? user_code;
  int? user_id;
  String? name;
  String? phone;
  String? image;
  int product_id = 0;
  RamdomBillOrderResponse? ramdomBillOrderResponse;
  OrderRepositories? orderRepositories;
  ListProductResponse ? listProductResponse;
  List<ItemProduct>? mDataItemProduct = [];
  TransportAdminRepositories ? transportAdminRepositories;
  List<File>? images;
  List<Asset>? selectedAssetsPrevious;
  List<DataImagesEnterWareHouseResponse>? mImages = [];
  String? mDataUploadImage;
  List<String>? img;
  String billCodeErros = '';
  bool isBillCodeValid = true;
  String productIdErros = '';
  bool isProductIdValid = true;
  String numberPackageErros = '';
  bool isNumberPackageValid = true;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      if (Get.arguments['user_code'] == null) {
        //this.onError(ErrorResponse(message: 'Mã khách hàng trống'));
        user_code = null;
      } else {
        user_code = Get.arguments['user_code'];
      }
      if (Get.arguments['phone'] == null) {
        //this.onError(ErrorResponse(message: 'Số điện thoại trống'));
      } else {
        phone = Get.arguments['phone'];
      }
      if (Get.arguments['name'] == null) {
        //this.onError(ErrorResponse(message: 'Tên khách hàng trống'));
        name = "Không xác định";
      } else {
        name = Get.arguments['name'];
      }
      if (Get.arguments['user_id'] == null) {
        user_id = 0;
      } else {
        user_id = Get.arguments['user_id'];
      }
    }
    orderRepositories = Injector().order;
    transportAdminRepositories = Injector().transport;
    images = <File>[];
    img = <String>[];
    selectedAssetsPrevious = <Asset>[];
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
      barCodeValueController = TextEditingController(text: barcodeScanRes);
      print(" isBarCode +$scanBarcode");
    }
    update();
  }

  void onRamdomBillOrder() {
    orderRepositories!.onRamdomBillOrder(user_id!).then((value) {
      ramdomBillOrderResponse = value;
      barCodeValueController =
          TextEditingController(text: ramdomBillOrderResponse!.data!.bill_code);
      print(
          "isRamdomBillCode + ${ramdomBillOrderResponse!.data!.bill_code.toString()}");
      update();
    }).catchError((onError) {
      print('isErorrs');
    });
    update();
    print(user_id);
  }
Future<List<ItemProduct>> getDataProduct () async {
    transportAdminRepositories!.onGetListProduct().then((value){
      listProductResponse = value;
      mDataItemProduct!.addAll(listProductResponse!.data!);
    }).catchError((onError){
    });
    return mDataItemProduct!;
  }
  void onEnterWareHouse() {
    if (product_id == 0) {
      isProductIdValid = false;
      productIdErros = "Mặt hàng không được để trống";
    } else {
      isProductIdValid = true;
    }
    if (barCodeValueController.text.isEmpty) {
      isBillCodeValid = false;
      billCodeErros = "Mã bill không được để trống";
    } else {
      isBillCodeValid = true;
    }
    if (numberPackageController.text.isEmpty) {
      isNumberPackageValid = false;
      numberPackageErros = "Số kiện hàng không được để trống";
    } else {
      isNumberPackageValid = true;
    }
    if(isProductIdValid && isBillCodeValid && isNumberPackageValid){
      EnterWareHouseRequest request = EnterWareHouseRequest(
      user_id: user_id != 0 ? user_id : null,
      phone: phone,
      bill_code: barCodeValueController.text.toString(),
      product_id: product_id,
      transport_fee: ParseNumber.parseDouble(transportFeeController.text),
      number_package: ParseNumber.parseInt(numberPackageController.text),
      images: img,
      is_prohibited_item: is_prohibited_item,
    );
    orderRepositories!.onEnterWarehouse(request).then((value) {
      Get.snackbar(NOTIFY, "Nhập kho thành công");
    }).catchError((onError) {
      return onEnterWareHouseError(onError);
    });
    Get.back(result: request);
    }
    update();
  }

  void onChangeDefault() {
    isCheck = !isCheck;
    if (isCheck == true) {
      is_prohibited_item = 2;
    } else
      is_prohibited_item = 1;
    print("$is_prohibited_item");
    update();
  }
  
  void onEnterWareHouseError (ErrorsEnterWarehouseResponse msg){
    if (msg.errors!.bill_code!.toList().isNotEmpty) {
      isBillCodeValid = false;
      billCodeErros = msg.errors!.bill_code![0].toString();
      update();
    } else {
      isBillCodeValid = true;
      update();
    }
  }

  @override
  void onError(ErrorResponse msg) {
    Get.snackbar(PROFILE_NOTIFY, msg.message.toString());
    // Get.snackbar("Thông báo", msg.message.toString());
    Get.back();
  }
  void onClearImage(int index) {
    mImages!.removeAt(index);
    update();
  }
  void onPickerImage(ImageSource imageSource) {
    //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    HandleImage().pickerImage(imageSource).then((value) {
      images!.add(value!);
      mImages!.add(DataImagesEnterWareHouseResponse(
          key: "", path: "", file: value, isNetWork: false));
      // uploadImageComplain();
      img!.add(value.path);
      Get.back(result: images);
      update();
    }).catchError((onError) {
      Get.back();
    });
  }

  void onPickerMultiImage() {
    Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    HandleImage().multiPickerImage(selectedAssetsPrevious!).then((value) async {
      if (value.length != 0) {
        selectedAssetsPrevious = value;
        images = await HandleImage().convertAssetToFile(value);
        //uploadImageComplain();
        Get.back();
        Get.back(result: images);
      }
    }).catchError((onError) {
      //
      Get.back();
      Get.defaultDialog(
          title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
  }
  
}
