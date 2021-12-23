import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile_admin/data/request/update_fee_warhouse_china.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_detail_response.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:viet_trung_mobile_admin/data/response/admin_add_image_enter_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ulti/helper/handle_image.dart';

class OrderShipBackDetailController extends GetxController {
  OrderAdminRepositories? orderAminRepositories;
  OrderAdminDetailResponse? orderShipBack;
  TextEditingController? surchargeController = TextEditingController();
  TextEditingController? transportFeeController = TextEditingController();
  String? orderId;
  bool isCheck = false;
  bool isEditTransport = false;
  bool isEditSurcharge = false;
  String? textTransportFee;
  String? textSurcharge;
  List<DataImagesEnterWareHouseResponse>? mImages = [];
  String? mDataUploadImage;
  int? id;
  List<File>? images;
  List<Asset>? selectedAssetsPrevious;
  List<String>? imgs;
  String? img;
  ProfileRepositories? profileRepositories;

  @override
  void onInit() {
    super.onInit();
    orderAminRepositories = Injector().orderAmin;
    if (Get.arguments == null) {
      orderId = null;
    } else {
      orderId = Get.arguments;
    }
    images = <File>[];
    selectedAssetsPrevious = <Asset>[];
    onGetOrderDetail(orderId!);
    transportFeeController = TextEditingController(text: textTransportFee);
    surchargeController = TextEditingController(text: textSurcharge);
  }

  void onGetOrderDetail(String id) {
    orderAminRepositories!.onGetOrderDetail(id).then((value) {
      orderShipBack = value;
      textTransportFee = value.data!.transportFee!.toString();
      textSurcharge = value.data!.surcharge!;
      imgs = value.data!.image!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onCheck() {
    isCheck = !isCheck;
    update();
  }

  void onPickerImage(ImageSource imageSource) {
    HandleImage().pickerImage(imageSource).then((value) {
      images!.add(value!);
      mImages!.add(DataImagesEnterWareHouseResponse(
          key: "", path: "", file: value, isNetWork: false));
      Get.back(result: images);
      imgs!.add(value.path);
      onUpLoadImage();
      update();
    }).catchError((onError) {
      Get.back();
    });
  }

  void onUpLoadImage() {
    profileRepositories!.onUploadImageProfile(images!).then((response) {
      imgs!.add(response);
      update();
    }).catchError((onError) {
      return onError;
    });
  }

  void onClearImage(int index) {
    mImages!.removeAt(index);
    imgs!.remove(index);
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

  void onSave(int id) {
    UpdateFeeWarhouseChina request = UpdateFeeWarhouseChina(
      surcharge: textSurcharge,
      transportFee: textTransportFee,
      isProhibitedItem: isCheck == true ? 2 : 1,
      image: imgs,
    );
    orderAminRepositories!
        .onUpdateFeeWarhouseChina(request, orderId!)
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
