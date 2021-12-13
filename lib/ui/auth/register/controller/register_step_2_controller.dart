import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/data/request/auth_request.dart';
import 'package:viet_trung_mobile/data/response/city_response.dart';
import 'package:viet_trung_mobile/data/response/district_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/register_address_response.dart';
import 'package:viet_trung_mobile/data/response/register_response.dart';
import 'package:viet_trung_mobile/data/response/register_step_1_response.dart';
import 'package:viet_trung_mobile/data/response/register_step_2_response.dart';
import 'package:viet_trung_mobile/data/response/wards_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/register/contract/register_contract.dart';
import 'package:viet_trung_mobile/ui/auth/register/view/register_step_3.dart';
import 'package:viet_trung_mobile/widget/loading_dialog_widget.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class RegisterStepTwoController extends GetxController
    implements RegisterContract {
  TextEditingController addressController = TextEditingController();

  late RegisterContract contract;
  late AddressRepository addressRepository;
  late RegisterAddressResponse mDataRegigter;
  List<DataCity>? mcity;
  List<DataDistrict>? mdistric;
  List<DataWards>? mwards;
  bool onChange = false;
  bool check = false;
  String? email;
  String? name;
  String? phone;

  DataCity? selectedCity;
  DataDistrict? selectedDistrict;
  DataWards? selectedWards;
  bool isCheck = false;
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
  late AuthRepository _authRepository;

  @override
  void onInit() {
    super.onInit();
    addressRepository = Injector().address;
    _authRepository = Injector().auth;
    contract = this;
    onGetListCity();
    if (Get.arguments != null) {
      if (Get.arguments['email'] == null) {
        email = null;
      } else {
        email = Get.arguments['email'];
      }
      if (Get.arguments['phone'] == null) {
        phone = null;
      } else {
        phone = Get.arguments['phone'];
      }
      if (Get.arguments['name'] == null) {
        name = null;
      } else {
        name = Get.arguments['name'];
      }
    }
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

  void onRegisterStep2() {
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

    if (addressValid && cityValid && districtValid && wardsValid) {
      AuthRequest _request = AuthRequest(
        address: addressController.text,
        city_id: city,
        district_id: district,
        wards_id: wards,
      );
      _authRepository
          .onRegisterStep2(_request, NetworkConfig.REGISTER_STEP_2)
          .then((value) {
        return contract.onSuccessRegisterStep2(value);
      }).catchError((onError) {
        return contract.onError(onError);
      });
    }
    update();
  }

  @override
  void onError(ErrorResponse msg) {
    Get.snackbar(PROFILE_NOTIFY, msg.message.toString());
    Get.back();
  }

  @override
  void onSuccess(RegisterResponse response) {}

  @override
  void onSuccessGetAddress(RegisterAddressResponse response) {
    Get.back(result: 1);
    Get.back(result: 1);
    Get.dialog(LoadingDialogWidget(
      title: PROFILE_NOTIFY_SUCCESS,
      text: PROFILE_ADD_ADDRESS_SUCCESS,
    ));
    Future.delayed(Duration(seconds: 3), () {
      Get.back();
    });
    update();
  }

  @override
  void onSuccessRegisterStep1(RegisterStep1Response response) {}

  @override
  void onSuccessRegisterStep2(RegisterStep2Response response) {
    Get.to(RegisterStepThreePage(), arguments: {
      'email': email,
      'phone': phone,
      'name': name,
      'city_id': city,
      'district_id': district,
      'wards_id': wards,
      'address': addressController.text,
    });
    update();
  }
}
