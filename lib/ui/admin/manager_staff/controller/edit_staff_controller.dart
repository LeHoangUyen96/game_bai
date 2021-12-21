import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_staff_reponsitory/manager_staff_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/role_admin_reponsitory/role_admin_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/request/update_admin_request.dart';
import 'package:viet_trung_mobile_admin/data/response/detail_staff_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_role_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ulti/helper/handle_image.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';

class EditStaffController extends GetxController  {
TextEditingController userCodeController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
RoleResponse ? roleResponse;
List<DataRole>? mDataRole =[];
RoleAdminRepositories ? roleAdminRepositories;
ManagerStaffRepositories ? managerStaffRepositories;
DetailStaffResponse ? detailStaffResponse;
String userCodeErros = '';
bool isUserCodeValid = true;
String nameErros = '';
bool isNameValid = true;
String emailErros = '';
bool isEmailValid = true;
String phoneErros = '';
bool isPhoneValid = true;
List<File>? images;
String? img;
List<Asset>? selectedAssetsPrevious;
int? id;
bool isStatus  = true;
int? role_id;
int? status;
  @override
  void onInit() {
    super.onInit();
    roleAdminRepositories = Injector().role;
    managerStaffRepositories = Injector().managerStaff;
    id = Get.arguments;
    print("$id");
    images = <File>[];
    selectedAssetsPrevious = <Asset>[];
    onGetListRole();
    onGetDetailAdmin();
  }
  void onGetDetailAdmin(){
    managerStaffRepositories!.onGetDetailAdmin(id!).then((value) {
      detailStaffResponse = value;
      update();
    }).catchError((onError){
      print("-----------------$onError");
    });
  }
  void onUpdateAdmin(){
    if (userCodeController.text.isEmpty) {
      isUserCodeValid = false;
      userCodeErros = "Mã nhân viên không được để trống";
    } else {
      isUserCodeValid = true;
    }
    if (phoneController.text.length < 9 ||
        phoneController.text.length > 11) {
      isPhoneValid = false;
      phoneErros = "Số điện thoại không được để trống";
    } else {
      isPhoneValid = true;
    }
    if (nameController.text.isEmpty) {
      isNameValid = false;
      nameErros = "Họ và tên không được để trống";
    } else {
      isNameValid = true;
    }
    if (emailController.text.isEmpty) {
      isEmailValid = false;
      emailErros = "Email không được để trống";
    } else if (!GetUtils.isEmail(emailController.text)) {
      isEmailValid = false;
      emailErros = "Email không đúng định dạng";
    } else {
      isEmailValid = true;
    }
    if(isUserCodeValid && isPhoneValid && isNameValid && isEmailValid){
      UpdateAdminRequest request = UpdateAdminRequest(
       user_code: userCodeController.text,
       email: emailController.text,
       phone: phoneController.text,
       name: nameController.text,
       avatar: img == null ? detailStaffResponse!.data!.avatar : img,
       role_id: role_id.toString() == "null" ? detailStaffResponse!.data!.role_id.toString() : role_id.toString() ,
    );
    managerStaffRepositories!.onUpdateAdmin(request, id!).then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      update();
    }).catchError((onError){
      Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
    update();
    }
    
  }
  void onUploadImage() {
    managerStaffRepositories!.onUploadAvatarStaff(images!).then((value) {
     // Get.snackbar(PROFILE_NOTIFY, "upload image Success");
      print("-isImage-$value");
      img = value;
      images!.clear();
      Get.back(result: 0);
      update();
    }).catchError((onError) {
      Get.back();
      Get.snackbar(NOTIFY, onError.toString());
    });
  }
  void onGetStatusStaff (bool value){
    isStatus = value;
    if( isStatus == true){
      status = 1;
    } else { status = 0;}
    onChangeStatusAdmin();
    print("$status");
    update();
  }
  void onPickerImage(ImageSource imageSource){
    //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    HandleImage().pickerImage(imageSource).then((value) {
      images!.add(value!);
      //Get.back(result: img);
      onUploadImage();
    }).catchError((onError){
      Get.back();
      Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
  }
  void onPickerMultiImage(){
    Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    HandleImage().multiPickerImage(selectedAssetsPrevious!).then((value) async {
      if(value.length != 0){
        selectedAssetsPrevious = value;
        images = await HandleImage().convertAssetToFile(value);
        //Get.back(result: images);
      }
    }).catchError((onError){
      //
      Get.back();
      Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
  }
  void onChangeStatusAdmin(){
    managerStaffRepositories!.onChangeStatusAdmin(id!, status!).then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      onGetDetailAdmin();
      update();
    }).catchError((onError){
      //Get.defaultDialog(title: onError.toString(), middleText: '');
    });
  }
  Future<List<DataRole>>  onGetListRole() async{
    roleAdminRepositories!.onGetListRole().then((value) {
      roleResponse = value;
      mDataRole!.addAll(roleResponse!.data!);
      update();
    }).catchError((onError) {
    });
    return mDataRole!;
    
  }
  void onDeleteStaff() {
    managerStaffRepositories!.onDeleteAdmin(id!).then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      Get.back();
      update();
    }).catchError((onError) {
      Get.defaultDialog(
          title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
  }
}