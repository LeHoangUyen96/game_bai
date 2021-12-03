import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/models/method_send.dart';
import 'package:viet_trung_mobile/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/request/verifi_order_ownerless.dart';
import 'package:viet_trung_mobile/data/response/city_response.dart';
import 'package:viet_trung_mobile/data/response/district_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';
import 'package:viet_trung_mobile/data/response/wards_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class OrderOwnerlessConfirmController extends GetxController
    with SingleGetTickerProviderMixin {
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  OrderAdminRepositories? orderAminRepositories;
  List<DataSearchCustomer>? searchResponse;

  AddressRepository? addressRepository;
  List<DataCity>? cityResponse;
  List<DataDistrict>? districtResponse;
  List<DataWards>? wardResponse;
  DataCity? selectedCity;
  DataDistrict? selectedDistrict;
  DataWards? selectedWards;

  List<DataPackingForm>? packingForm;
  List<DataTransportForm>? transportForm;
  DataPackingForm? selectedPackingForm;
  DataTransportForm? selectedTransportForm;

  bool nameValid = true;
  bool phoneValid = true;
  bool emailValid = true;
  bool addressValid = true;
  bool cityValid = true;
  bool districtValid = true;
  bool wardsValid = true;
  bool transportValid = true;
  bool packingValid = true;
  String? nameError;
  String? phoneError;
  String? emailError;
  String? addressError;
  String? cityError;
  String? districtError;
  String? wardsError;
  String? transportError;
  String? packingError;
  int city = 0;
  int district = 0;
  int wards = 0;
  int packing = 0;
  int transport = 0;
  int? orderId;
  bool isShow = false;

  DataSearchCustomer? user;

  int currentMethodSend = 1;
  final methodSend = [
    MethodSend(1, packOrderBack),
    MethodSend(2, storage),
    MethodSend(null, sendVerifi),
  ];

  final FocusNode focusNode = FocusNode();
  bool enabled = false;
  bool onSelect = false;
  bool onInput = false;
  bool onSearch = false;

  @override
  void onInit() async {
    super.onInit();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        enabled = false;
      }
    });
    orderAminRepositories = Injector().orderAmin;
    addressRepository = Injector().address;
    onGetListCity();
    onGetListPacking();
    onGetListTransport();
    if (Get.arguments == null) {
      orderId = null;
    } else {
      orderId = Get.arguments;
    }
  }

  void isShowCard(DataSearchCustomer data) {
    isShow = true;
    user = data;
    update();
  }

  void onGetListSearch(String? phone) {
    orderAminRepositories!.onGetListSearchCustomer(phone!).then((value) {
      searchResponse = value.data!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
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

  void onGetListCity() {
    addressRepository?.onGetCity().then((value) {
      cityResponse = value;
      print(cityResponse!.length.toString());
      update();
    }).catchError((onError) {
      print("Error");
    });
    update();
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
    addressRepository!.onGetDistric(id).then((value) {
      Get.back();
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
    Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    addressRepository!.onGetWards(id).then((value) {
      Get.back();
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

  void onVerifi() {
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

    if (emailController.text.isEmpty) {
      emailValid = false;
      emailError = ERROR_MAIL;
    } else {
      emailValid = true;
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
    if (nameValid &&
        phoneValid &&
        emailValid &&
        addressValid &&
        cityValid &&
        districtValid &&
        wardsValid &&
        transportValid &&
        packingValid) {
      VerifiOrderOwnerlessRequest request = VerifiOrderOwnerlessRequest(
        orderId: orderId,
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        address: addressController.text,
        cityId: selectedCity!.id,
        districtId: selectedDistrict!.id,
        wardId: selectedWards!.id,
        transportId: selectedTransportForm!.id,
        packingId: selectedPackingForm!.id,
      );
      onSave(request);
    }
    update();
  }

  void onVerifiOrder(DataSearchCustomer data) {
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
      VerifiOrderOwnerlessRequest request = VerifiOrderOwnerlessRequest(
        orderId: orderId,
        name: data.name!,
        transportId: selectedTransportForm!.id,
        packingId: selectedPackingForm!.id,
        userId: data.id!,
      );
      onSave(request);
    }
    update();
  }

  void onSave(VerifiOrderOwnerlessRequest request) {
    orderAminRepositories!.onVerifiOrderOwnerless(request).then((value) {
      Get.snackbar('Thông báo', 'Đã xác minh đơn hàng');
      Get.back();
      update();
    }).catchError((onError) {
      print("Error");
      update();
    });
  }
}
