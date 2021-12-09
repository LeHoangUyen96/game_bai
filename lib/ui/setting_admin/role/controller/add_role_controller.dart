import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/role_admin_reponsitory/role_admin_reponsitory.dart';
import 'package:viet_trung_mobile/data/request/update_role_request.dart';
import 'package:viet_trung_mobile/data/response/list_rights_group.dart';
import 'package:viet_trung_mobile/data/response/role_detail_response.dart';

class AddRoleController extends GetxController {
  RoleAdminRepositories? repository;
  RightsGroupResponse? response;
  TextEditingController nameController = TextEditingController();
  String? roleId;
  bool isEditName = false;
  List<int> permision = [];
  int? idItem;
  List<Permissions>? data;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().role;
    onGetListRole();
  }

  void onGetListRole() {
    repository!.onGetListRightsGroup().then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onCheck(DataRightsGroup data) {
    data.checked = !data.checked!;
    if (data.checked == true) {
      permision.add(data.id!);
    }
    if (data.checked == false) {
      permision.remove(data.id!);
    }
    update();
  }

  void onSave() {
    UpdateRoleRequest request = UpdateRoleRequest(
      name: nameController.text,
      permissions: permision,
    );
    repository!.onAddRole(request).then((value) {
      Get.back();
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }
}
