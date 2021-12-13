import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile/data/repository/manager_user_reponsitory/manager_user_reponsitory.dart';
import 'package:viet_trung_mobile/data/request/create_user_request.dart';
import 'package:viet_trung_mobile/data/response/city_response.dart';
import 'package:viet_trung_mobile/data/response/create_admin_response.dart';
import 'package:viet_trung_mobile/data/response/district_response.dart';
import 'package:viet_trung_mobile/data/response/list_user_response.dart';
import 'package:viet_trung_mobile/data/response/errors_create_admin.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/wards_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_user/contract/manager_user_contract.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class CreateUserController extends GetxController implements ManagerUserContract {
 TextEditingController addressController = TextEditingController();
 TextEditingController nameController = TextEditingController();
 TextEditingController phoneController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 bool isNameValid = true;
 bool isPhoneValid = true;
 bool isEmailValid = true;
 String nameError = "";
 String phoneError = "";
 String emailError = "";
  late AddressRepository addressRepository;
  ManagerUserRepositories ? managerUserRepositories;
  ManagerUserContract ? contract;
  List<DataCity>? mcity;
  List<DataDistrict>? mdistric;
  List<DataWards>? mwards;
  DataCity? selectedCity;
  DataDistrict? selectedDistrict;
  DataWards? selectedWards;
  bool addressValid = true;
  bool cityValid = true;
  bool districtValid = true;
  bool wardsValid = true;
  String? addressError;
  String? cityError;
  String? districtError;
  String? wardsError;
  int city = 0;
  int district = 0;
  int wards = 0;
  @override
  void onInit() {
    super.onInit();
    addressRepository = Injector().address;
    managerUserRepositories = Injector().managerUser;
    contract = this;
    onGetListCity();
  }

  void onGetListCity() {
    addressRepository.onGetCity().then((value) {
      mcity = value;
      print(mcity!.length.toString());
      update();
      // return contract.onSuccess(value);
    }).catchError((onError) {
      //Get.defaultDialog(title: (onError).message.toString(), middleText: '');
      print("Error");
    });
    update();
  }

  void onChangeCity(DataCity value, int id) {
    selectedCity = value;
    city = id;
    selectedDistrict = null;
    selectedWards = null;
    onGetListDistrict(id);
    update();
  }
  void onGetListDistrict(int id) {
    Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    addressRepository.onGetDistric(id).then((value) {
      Get.back();
      mdistric = value;
      print(mdistric!.length.toString());
      update();
      // return contract.onSuccess(value);
    }).catchError((onError) {
      // Get.back();
      // Get.defaultDialog(title: (onError).message.toString(), middleText: '');
      print("Error");
    });
    update();
  }

  void onChangeDistrict(DataDistrict value, int id) {
    selectedDistrict = value;
    district = id;
    selectedWards = null;
    onGetListWards(id);
    update();
  }
  void onGetListWards(int id) {
    Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    addressRepository.onGetWards(id).then((value) {
      Get.back();
      mwards = value;
      print(mwards!.length.toString());
      update();
      // return contract.onSuccess(value);
    }).catchError((onError) {
      // Get.back();
      // Get.defaultDialog(title: (onError).message.toString(), middleText: '');
      print("Error");
    });
    update();
  }

  void onChangeWards(DataWards value, int id) {
    selectedWards = value;
    wards = id;
    update();
  }
  void onCreateUser(){
     if (nameController.text.isEmpty) {
      isNameValid = false;
      nameError = ERROR_NAME;
    } else {
      isNameValid = true;
    }
    if (emailController.text.isEmpty) {
      isEmailValid = false;
      emailError = "Email không được để trống";
    } else {
      isEmailValid = true;
    }

    if (phoneController.text.length < 9 || phoneController.text.length > 11) {
      isPhoneValid = false;
      phoneError = ERROR_PHONE;
    } else {
      isPhoneValid = true;
    }
    if (addressController.text.isEmpty) {
      addressValid = false;
      addressError = ERROR_ADDRESS;
    } else {
      addressValid = true;
    }
    if (city == 0) {
      cityValid = false;
      cityError = ERROR_CITY;
    } else {
      cityValid = true;
    }

    if (district == 0) {
      districtValid = false;
      districtError = ERROR_DISTRICT;
    } else {
      districtValid = true;
    }

    if (wards == 0) {
      wardsValid = false;
      wardsError = ERROR_WARDS;
    } else {
      wardsValid = true;
    }

    if (isNameValid &&
        isPhoneValid &&
        isEmailValid &&
        addressValid &&
        cityValid &&
        districtValid &&
        wardsValid) {
          CreateUserRequest request = CreateUserRequest(
            address: addressController.text,
            name: nameController.text,
            phone: phoneController.text,
            email: emailController.text,
            city_id: city,
            district_id: district,
            wards_id: wards,
            );
            managerUserRepositories!.onCreateUser(request).then((value) {
              Get.snackbar(NOTIFY, value.message.toString());
            }).catchError((onError){
              return contract!.onCreatetUserError(onError);
            });
        }
  }

  @override
  void onCreateUserSuccess(CreateAdminResponse data) {
    // TODO: implement onCreateUserSuccess
  }

  @override
  void onCreatetUserError(ErrorCreateAdminResponse msg) {
     if (msg.error!.phone!.toList().isNotEmpty) {
      isPhoneValid = false;
      phoneError = msg.error!.phone![0].toString();
      update();
    } else {
      isPhoneValid = true;
      update();
    }

    if (msg.error!.email!.toList().isNotEmpty) {
      isEmailValid = false;
      emailError = msg.error!.email![0].toString();
      update();
    } else {
      isEmailValid = true;
      update();
    }
    if (msg.error!.address!.toList().isNotEmpty) {
      addressValid = false;
      addressError = msg.error!.user_code![0].toString();
      update();
    } else {
      addressValid = true;
      update();
    }
    if (msg.error!.name!.toList().isNotEmpty) {
      isNameValid = false;
      nameError = msg.error!.name![0].toString();
      update();
    } else {
      isNameValid = true;
      update();
    }
    update();
  }

  @override
  void onGetListUserError(ErrorResponse error) {
    // TODO: implement onGetListUserError
  }

  @override
  void onGetListUserSuccess(ListUserResponse data) {
    // TODO: implement onGetListUserSuccess
  }
}