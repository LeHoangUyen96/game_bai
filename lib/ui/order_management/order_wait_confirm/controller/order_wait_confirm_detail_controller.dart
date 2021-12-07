import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/models/method_send.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/request/confirm_order_wait_confirm_request.dart';
import 'package:viet_trung_mobile/data/response/admin_add_image_enter_warehouse_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ulti/helper/handle_image.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class OrderWaitConfirmDetailController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminDetailResponse? orderWaitConfirmDetail;
  TextEditingController noteController = TextEditingController();
  TextEditingController? surchargeController = TextEditingController();
  TextEditingController? transportFeeController = TextEditingController();
  String? orderId;
  int? currentMethodSend = 0;
  List<DataPackingForm>? packingForm;
  List<DataTransportForm>? transportForm;
  DataPackingForm? selectedPackingForm;
  DataTransportForm? selectedTransportForm;
  int? selectedMethodSend;
  final methodSend = [
    MethodSend(1, packOrderBack),
    MethodSend(2, storage),
  ];

  bool transportValid = true;
  bool packingValid = true;
  String? transportError;
  String? packingError;
  int packing = 0;
  int transport = 0;
  bool isEditTransport = false;
  bool isEditSurcharge = false;
  String? textTransportFee;
  String? textSurcharge;
  int? selectedReason;
  List<DataImagesEnterWareHouseResponse>? mImages = [];
  String? mDataUploadImage;
  int? id;
  List<File>? images;
  List<String>? img;
  List<Asset>? selectedAssetsPrevious;

  @override
  void onInit() {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    if (Get.arguments == null) {
      orderId = null;
    } else {
      orderId = Get.arguments;
    }
    print("$id");
    images = <File>[];
    img = <String>[];
    selectedAssetsPrevious = <Asset>[];
    onGetOrderDetail(orderId!);
    onGetListTransport();
    onGetListPacking();
    transportFeeController = TextEditingController(text: textTransportFee);
    surchargeController = TextEditingController(text: textSurcharge);
  }

  @override
  void dispose() {
    transportFeeController!.dispose();
    super.dispose();
  }

  void onGetOrderDetail(String id) {
    orderAminRepositories!.onGetOrderDetail(id).then((value) {
      orderWaitConfirmDetail = value;
      textTransportFee = value.data!.transportFee!.toString();
      textSurcharge = value.data!.surcharge!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onChangeMethodSend(MethodSend value, int id) {
    currentMethodSend = value.id! - 1;
    selectedMethodSend = value.id!;
    update();
  }

  void onGetListPacking() {
    orderAminRepositories!.onGetListPackingForm().then((value) {
      packingForm = value.data!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onGetListTransport() {
    orderAminRepositories!.onGetListTransportForm().then((value) {
      transportForm = value.data!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onChangePacking(DataPackingForm value, int id) {
    selectedPackingForm = value;
    packing = id;
    update();
  }

  void onChangeTransport(DataTransportForm value, int id) {
    selectedTransportForm = value;
    transport = id;
    update();
  }

  void onChangeTransportFee() {
    isEditTransport = true;
    update();
  }

  void onChangeSurcharge() {
    isEditSurcharge = true;
    update();
  }

  void onPickerImage(ImageSource imageSource) {
    HandleImage().pickerImage(imageSource).then((value) {
      images!.add(value!);
      mImages!.add(DataImagesEnterWareHouseResponse(
          key: "", path: "", file: value, isNetWork: false));
      Get.back(result: images);
      img!.add(value.path);

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
        // img = await HandleImage().convertAssetToString(value);
        Get.back();
        Get.back(result: images);
      }
    }).catchError((onError) {
      Get.back();
      Get.defaultDialog(
          title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
  }

  void onClearImage(int index) {
    if (images!.length > index) {
      images!.removeAt(index);
    }
    update();
  }

  void onConfirmOrder(DataOrderAdminDetail data) {
    if (transport == 0) {
      transportValid = false;
      transportError = errorTransport;
    } else {
      transportValid = true;
    }

    if (packing == 0) {
      packingValid = false;
      packingError = errorPacking;
    } else {
      packingValid = true;
    }
    if (transportValid && packingValid) {
      VerifiOrderWaitConfirmRequest request = VerifiOrderWaitConfirmRequest(
        orderId: data.id,
        transportId: selectedTransportForm!.id,
        packingId: selectedPackingForm!.id,
        type: selectedMethodSend,
        note: noteController.text,
        transportFee: textTransportFee,
        image: img,
      );
      onConfirm(request);
    }
    update();
  }

  void onConfirm(VerifiOrderWaitConfirmRequest request) {
    orderAminRepositories!.onConfirmOrderWaitConfirm(request).then((value) {
      Get.back();
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }
}
