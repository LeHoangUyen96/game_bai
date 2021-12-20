import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_staff_reponsitory/manager_staff_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/response/create_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/errors_create_admin.dart';
import 'package:viet_trung_mobile_admin/data/response/list_admin_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_staff/contract/manager_staff_contract.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';

class ManagerStaffController extends GetxController
    implements ManagerStaffContract {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  TextEditingController searchNamePhone = TextEditingController();
  ManagerStaffRepositories? managerStaffRepositories;
  ListAdminResponse? listAdminResponse;
  List<DataListAdminResponse>? mDataListAdminResponse = [];
  bool isNextPage = false;
  late ManagerStaffContract contract;
  int page = 1;
  int perPage = 10;
  @override
  void onInit() {
    super.onInit();
    managerStaffRepositories = Injector().managerStaff;
    contract = this;
    onGetListAdmin(false);
  }

  void onGetListAdmin(bool isRefresh) {
    if (isRefresh) {
      mDataListAdminResponse!.clear();
    }
    managerStaffRepositories!.onGetListAdmin(page, perPage).then((value) {
      return contract.onGetListAdminSuccess(value);
    }).catchError((onError) {
      print("-----------------$onError");
    });
  }

  void onListLoading() async {
    if (isNextPage) {
      page = (page + 1);
      onGetListAdmin(false);
    }
  }

  void onListRefresh() async {
    page = 1;
    onGetListAdmin(true);
    update();
  }

  @override
  void onGetListAdminError(ErrorResponse error) {
    // TODO: implement onGetListAdminError
  }

  @override
  void onGetListAdminSuccess(ListAdminResponse data) {
    listAdminResponse = data;
    mDataListAdminResponse!.addAll(listAdminResponse!.data!);

    if (listAdminResponse!.paginate!.current_page! <=
        listAdminResponse!.paginate!.last_page!) {
      if (listAdminResponse!.paginate!.next! > 0) {
        isNextPage = true;
      } else {
        isNextPage = false;
      }
    } else {
      isNextPage = false;
    }
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
    update();
  }
  void onSearchListAdmin(){
     //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
      mDataListAdminResponse!.clear();
      managerStaffRepositories!.onSearchListAdmin(searchNamePhone.text.toString(),page,perPage).then((value) {
        return contract.onGetListAdminSuccess(value);
      }).catchError((onError) {
        Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
      });
    update();
  }

  void onDeleteStaff(int id) {
    managerStaffRepositories!.onDeleteAdmin(id).then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      onGetListAdmin(true);
      update();
    }).catchError((onError) {
      Get.defaultDialog(
          title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
  }

  @override
  void onCreateAdminSuccess(CreateAdminResponse data) {
    // TODO: implement onCreateAdminSuccess
  }

  @override
  void onCreateAdminAdminError(ErrorCreateAdminResponse error) {
    // TODO: implement onCreateAdminAdminError
  }
}