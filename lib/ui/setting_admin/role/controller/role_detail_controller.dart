import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/role_admin_reponsitory/role_admin_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/request/update_role_request.dart';
import 'package:viet_trung_mobile_admin/data/response/role_detail_response.dart';

class RoleDetailController extends GetxController {
  RoleAdminRepositories? repository;
  RoleDetailResponse? response;
  TextEditingController nameController = TextEditingController();
  String? roleId;
  String? nameRole;
  bool isEditName = false;
  List<int> permision = [];
  int? idItem;
  List<Permissions>? data;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().role;
    if (Get.arguments == null) {
      roleId = null;
    } else {
      roleId = Get.arguments;
    }
    onGetRoleDetail(roleId!);
    nameController = TextEditingController(text: nameRole);
  }

  void onGetRoleDetail(String id) {
    repository!.onGetRoleDetail(roleId!).then((value) {
      response = value;
      nameRole = value.data!.name!;
      data = value.data!.permissions!;
      for (var item in data!) {
        if (item.checked == true) {
          permision.add(item.id!);
        }
      }
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onCheck(Permissions data) {
    data.checked = !data.checked!;
    if (data.checked == true) {
      permision.add(data.id!);
    }
    if (data.checked == false) {
      permision.remove(data.id!);
    }
    update();
  }

  void onEdit() {
    isEditName = !isEditName;
    update();
  }

  void onSave(int id) {
    UpdateRoleRequest request = UpdateRoleRequest(
      name: nameRole,
      permissions: permision,
    );
    repository!.onUpdateRole(request, roleId!).then((value) {
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }

  void onDeleteRole(int id) {
    repository!.onDeleteRole(roleId!).then((value) {
      Get.back();
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }
}
