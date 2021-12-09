import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';

class AddTransportController extends GetxController {
  TransportAdminRepositories? repository;
  @override
  void onInit() {
    super.onInit();
    repository = Injector().transport;
  }

  void onSave() {}
}
