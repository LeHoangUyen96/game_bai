import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile/data/request/address_request.dart';
import 'package:viet_trung_mobile/data/response/address_error_response.dart';
import 'package:viet_trung_mobile/data/response/address_response.dart';
import 'package:viet_trung_mobile/data/response/city_response.dart';
import 'package:viet_trung_mobile/data/response/district_response.dart';
import 'package:viet_trung_mobile/data/response/register_address_response.dart';
import 'package:viet_trung_mobile/data/response/wards_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/address/contract/address_contract.dart';
import 'package:viet_trung_mobile/widget/loading_dialog_widget.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class UpdateAddressController extends GetxController
    implements AddressContract {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  late AddressContract contract;
  late AddressRepository addressRepository;
  List<DataCity>? mcity;
  List<DataDistrict>? mdistric;
  List<DataWards>? mwards;
  bool onChange = false;
  bool check = false;

  DataCity? selectedCity;
  DataDistrict? selectedDistrict;
  DataWards? selectedWards;
  bool isCheck = false;
  bool nameValid = true;
  bool phoneValid = true;
  bool addressValid = true;
  bool cityValid = true;
  bool districtValid = true;
  bool wardsValid = true;
  String? nameError;
  String? phoneError;
  String? addressError;
  String? cityError;
  String? districtError;
  String? wardsError;
  int city = 0;
  int district = 0;
  int wards = 0;
  int defaults = 0;
  DataAddress? mdatas;

  @override
  void onInit() {
    super.onInit();
    addressRepository = Injector().address;
    contract = this;
    nameController = TextEditingController();
    mdatas = Get.arguments;
    // mdatas = data;
    nameController.text = mdatas!.name.toString();
    phoneController.text = mdatas!.phone.toString();
    addressController.text = mdatas!.address.toString();
    city = mdatas!.city_id!;
    district = mdatas!.district_id!;
    wards = mdatas!.wards_id!;
    defaults = mdatas!.defaults!;
    isCheck = defaults == 1 ? true : false;
    onGetListCity();
  }

  void onGetData(DataAddress data) {
    mdatas = data;
    nameController.text = mdatas!.name.toString();
    phoneController.text = mdatas!.phone.toString();
    addressController.text = mdatas!.address.toString();
    city = mdatas!.city_id!;
    district = mdatas!.district_id!;
    wards = mdatas!.wards_id!;
    defaults = mdatas!.defaults!;
    isCheck = defaults == 1 ? true : false;
    update();
  }

  void onGetListCity() {
    addressRepository.onGetCity().then((value) {
      mcity = value;
      print(mcity!.length.toString());
      update();
      // return contract.onSuccess(value);
    }).catchError((onError) {
      // Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
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
      print("Error");
    });
    update();
  }

  void onChangeWards(DataWards value, int id) {
    selectedWards = value;
    wards = id;
    update();
  }

  void onChangeDefault() {
    isCheck = !isCheck;
    if (isCheck == true) {
      defaults = 1;
    } else
      defaults = 0;
    print("$defaults");
    update();
  }

  void onRegisterAddress() {
    if (nameController.text.isEmpty) {
      nameValid = false;
      nameError = ERROR_NAME;
    } else {
      nameValid = true;
    }

    if (phoneController.text.length < 9 || phoneController.text.length > 11) {
      phoneValid = false;
      phoneError = ERROR_PHONE;
    } else {
      phoneValid = true;
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

    if (nameValid &&
        phoneValid &&
        addressValid &&
        cityValid &&
        districtValid &&
        wardsValid) {
      AddressRequest _request = AddressRequest(
          name: nameController.text,
          phone: phoneController.text,
          address: addressController.text,
          city_id: city,
          district_id: district,
          wards_id: wards,
          defaults: defaults);
      Get.dialog(LoadingSpinKit(), barrierDismissible: false);
      addressRepository.onUpdateAddress(_request, mdatas!.id!).then((value) {
        return contract.onSuccess(value);
      }).catchError((onError) {
        return contract.onError(onError);
      });
    }
    update();
  }

  @override
  void onError(AddressErrorResponse msg) {
    Get.back();
    Get.snackbar(PROFILE_NOTIFY, msg.message.toString());
  }

  @override
  void onSuccess(RegisterAddressResponse response) {
    Get.back(result: 1);
    Get.back(result: 1);
    Get.dialog(LoadingDialogWidget(
      title: PROFILE_NOTIFY_SUCCESS,
      text: PROFILE_UPDATE_ADDRESS_SUCCESS,
    ));
    Future.delayed(Duration(seconds: 3), () {
      Get.back();
    });
    update();
  }
}
