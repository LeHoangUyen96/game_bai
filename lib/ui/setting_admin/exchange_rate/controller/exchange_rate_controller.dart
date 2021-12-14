import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/exchange_rate_reponsitory/exchange_rate_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/response/exchange_rate_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class ExchangeRateController extends GetxController {
  ExchangeRateRepositories? repository;
  ExchangeRateResponse? response;
  String? formFeeId;
  TextEditingController exchangeRateController = TextEditingController();
  bool nameValid = true;
  String? nameError;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().exchangeRate;
    onGetExchangeRate();
  }

  void onGetExchangeRate() {
    repository!.onGetExchangeRate().then((value) {
      response = value;
      exchangeRateController =
          TextEditingController(text: value.data!.exchangeRate.toString());
      update();
    }).catchError((onError) {
      update();
    });
  }

  void onUpdateExchangeRate() {
    if (exchangeRateController.text.isEmpty) {
      nameValid = false;
      nameError = errorFee;
    } else {
      nameValid = true;
    }
    if (nameValid) {
      repository!
          .onUpdateExchangeRate(exchangeRateController.text)
          .then((value) {
        Get.snackbar('Thông báo', value.message!);
        update();
      }).catchError((onError) {
        update();
      });
    }
    update();
  }
}
