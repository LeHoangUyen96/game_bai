import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_user_reponsitory/manager_user_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/request/update_customer_request.dart';
import 'package:viet_trung_mobile_admin/data/response/city_response.dart';
import 'package:viet_trung_mobile_admin/data/response/detail_user_response.dart';
import 'package:viet_trung_mobile_admin/data/response/district_response.dart';
import 'package:viet_trung_mobile_admin/data/response/wards_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class EditCustomerController extends GetxController {
  ManagerUserRepositories? managerUserRepositories;
  DetailUserResponse? detailUserResponse;
  TextEditingController userCode = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userAddress = TextEditingController();
  int? userId;
  bool isStatus = true;
  int? status;
  AddressRepository? addressRepository;
  List<DataCity>? cityResponse;
  List<DataDistrict>? districtResponse;
  List<DataWards>? wardResponse;
  DataCity? selectedCity;
  DataDistrict? selectedDistrict;
  DataWards? selectedWards;
  int city = 0;
  int district = 0;
  int wards = 0;
  int packing = 0;
  int transport = 0;
  int? method = 0;
  bool nameValid = true;
  bool phoneValid = true;
  bool emailValid = true;
  bool addressValid = true;
  bool cityValid = true;
  bool districtValid = true;
  bool wardsValid = true;
  String? nameError;
  String? phoneError;
  String? emailError;
  String? addressError;
  String? cityError;
  String? districtError;
  String? wardsError;

  @override
  void onInit() {
    super.onInit();
    managerUserRepositories = Injector().managerUser;
    addressRepository = Injector().address;
    userId = Get.arguments;
    print("$userId");
    onGetDetailUser();
    onGetListCity();
  }

  void onGetDetailUser() {
    managerUserRepositories!.onGetDetailUser(userId!).then((value) {
      detailUserResponse = value;
      userCode = TextEditingController(text: value.data!.user_code!);
      userName = TextEditingController(text: value.data!.name!);
      userPhone = TextEditingController(text: value.data!.phone!);
      userEmail = TextEditingController(text: value.data!.email!);
      userAddress = TextEditingController(text: value.data!.email!);
      update();
    }).catchError((onError) {
      print("-----------------$onError");
    });
  }

  void onGetListCity() {
    addressRepository?.onGetCity().then((value) {
      cityResponse = value;
      update();
    }).catchError((onError) {
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
    addressRepository!.onGetDistric(id).then((value) {
      districtResponse = value;
      print(districtResponse!.length.toString());
      update();
    }).catchError((onError) {
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
    addressRepository!.onGetWards(id).then((value) {
      wardResponse = value;
      print(wardResponse!.length.toString());
      update();
    }).catchError((onError) {
      print("Error");
    });
    update();
  }

  void onChangeWards(DataWards value, int id) {
    selectedWards = value;
    wards = id;
    update();
  }

  void onSave() {
    if (userName.text.isEmpty) {
      nameValid = false;
      nameError = ERROR_NAME;
    } else {
      nameValid = true;
    }

    if (userPhone.text.length < 9 || userPhone.text.length > 11) {
      phoneValid = false;
      phoneError = ERROR_PHONE;
    } else {
      phoneValid = true;
    }

    if (userEmail.text.isEmpty) {
      emailValid = false;
      emailError = ERROR_MAIL;
    } else {
      emailValid = true;
    }

    if (userAddress.text.isEmpty) {
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

    if (nameValid &&
        phoneValid &&
        emailValid &&
        addressValid &&
        cityValid &&
        districtValid &&
        wardsValid) {
      UpdateCustomerRequest request = UpdateCustomerRequest(
        name: userName.text,
        phone: userPhone.text,
        email: userEmail.text,
        address: userAddress.text,
        cityId: selectedCity!.id,
        districtId: selectedDistrict!.id,
        wardsId: selectedWards!.id,
      );
      managerUserRepositories!
          .onUpdateCustomer(request, userId!.toString())
          .then((value) {
        Get.snackbar(NOTIFY, value.message!);
        update();
      }).catchError((onError) {
        print("-----------------$onError");
      });
    }
  }
}
