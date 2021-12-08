import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/decentralization_admin_reponsitory/decentralization_admin_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/list_rights_group.dart';

class DecentralizationDetailController extends GetxController {
  DecentralizationAdminRepositories? repository;
  RightsGroupResponse? response;
  TextEditingController nameController = TextEditingController();
  bool isCheck = false;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().decentralization;
    onGetListRightsGroup();
  }

  void onGetListRightsGroup() {
    repository!.onGetListRightsGroup().then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onCheck() {
    isCheck = !isCheck;
    update();
  }
}
