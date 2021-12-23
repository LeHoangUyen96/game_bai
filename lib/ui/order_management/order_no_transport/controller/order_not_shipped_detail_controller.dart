import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/models/method_send.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile_admin/data/request/update_order_no_transport.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_detail_response.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:viet_trung_mobile_admin/data/response/admin_add_image_enter_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ulti/helper/handle_image.dart';

class OrderNoTransportDetailController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminDetailResponse? orderNoTransport;
  TextEditingController noteController = TextEditingController();
  TextEditingController? surchargeController = TextEditingController();
  TextEditingController? transportFeeController = TextEditingController();
  String? orderId;
  int? currentMethodSend = 0;
  MethodSend? selectedMethodSend;
  final methodSend = [
    MethodSend(2, storage),
    MethodSend(3, returnSupplie),
  ];
  bool isEditTransport = false;
  bool isEditSurcharge = false;
  String? textTransportFee;
  String? textSurcharge;
  List<DataImagesEnterWareHouseResponse>? mImages = [];
  String? mDataUploadImage;
  int? id;
  List<File>? images;
  List<Asset>? selectedAssetsPrevious;
  String? img;
  List<String>? imgs;
  ProfileRepositories? profileRepositories;

  @override
  void onInit() {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    profileRepositories = Injector().profile;
    if (Get.arguments == null) {
      orderId = null;
    } else {
      orderId = Get.arguments;
    }
    onGetOrderDetail(orderId!);
    images = <File>[];
    selectedAssetsPrevious = <Asset>[];
    transportFeeController = TextEditingController(text: textTransportFee);
    surchargeController = TextEditingController(text: textSurcharge);
  }

  void onGetOrderDetail(String id) {
    orderAminRepositories!.onGetOrderDetail(id).then((value) {
      orderNoTransport = value;
      textTransportFee = value.data!.transportFee!.toString();
      textSurcharge = value.data!.surcharge!;
      imgs = value.data!.image!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onChangeTransportFee() {
    isEditTransport = true;
    update();
  }

  void onChangeSurcharge() {
    isEditSurcharge = true;
    update();
  }

  void onChangeMethodSend(MethodSend value, int id) {
    currentMethodSend = value.id!;
    update();
  }

  void onPickerImage(ImageSource imageSource) {
    HandleImage().pickerImage(imageSource).then((value) {
      images!.add(value!);
      mImages!.add(DataImagesEnterWareHouseResponse(
          key: "", path: "", file: value, isNetWork: false));
      onUpLoadImage();
      Get.back(result: images);
      update();
    }).catchError((onError) {
      Get.back();
    });
  }

  void onClearImage(int index) {
    mImages!.removeAt(index);
    update();
  }

  void onUpLoadImage() {
    profileRepositories!.onUploadImageProfile(images!).then((response) {
      imgs!.add(response);
      update();
    }).catchError((onError) {
      return onError;
    });
  }

  void onSave(int id) {
    UpdateOrderNoTransport request = UpdateOrderNoTransport(
      surcharge: textSurcharge,
      transportFee: textTransportFee,
      image: imgs,
      type: currentMethodSend! + 2,
      note: noteController.text,
    );
    orderAminRepositories!
        .onUpdateOrderNoTransport(request, orderId!)
        .then((value) {
      Get.back();
      Get.snackbar(NOTIFY, value.message!);
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }
}
