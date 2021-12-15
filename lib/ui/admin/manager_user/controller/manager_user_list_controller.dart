import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/manager_user_reponsitory/manager_user_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/create_admin_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/errors_create_admin.dart';
import 'package:viet_trung_mobile/data/response/list_user_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_user/contract/manager_user_contract.dart';

class ManagerUserController extends GetxController implements ManagerUserContract {
 RefreshController refreshController = RefreshController(initialRefresh: false);
  TextEditingController searchNamePhone = TextEditingController();
  ManagerUserRepositories ? managerUserRepositories;
  ListUserResponse? listUserResponse;
  List< DataListUserResponse> ? mDataListUserResponse = [];
  bool isNextPage = false;
  late ManagerUserContract contract;
  int page = 1;
  int perPage = 10;
  @override
  void onInit() {
    super.onInit();
    managerUserRepositories = Injector().managerUser;
    contract = this;
    onGetListUser(false);
  }
 void onGetListUser(bool isRefresh){
   if (isRefresh) {
      mDataListUserResponse!.clear();
    }
    managerUserRepositories!.onGetListUser(page, perPage).then((value) {
      return contract.onGetListUserSuccess(value);
    }).catchError((onError) {
      print("-----------------$onError");
    });
    update();
 }
 void onListLoading() async {
    if (isNextPage) {
      page = (page + 1);
      onGetListUser(false);
    }
    update();
  }

  void onListRefresh() async {
    page = 1;
    onGetListUser(true);
    update();
  }

  @override
  void onGetListUserError(ErrorResponse error) {
    // TODO: implement onGetListAdminError
  }

  @override
  void onGetListUserSuccess(ListUserResponse data) {
    listUserResponse = data;
    mDataListUserResponse!.addAll(listUserResponse!.data!);
    if (listUserResponse!.paginate!.current_page! <= listUserResponse!.paginate!.last_page!) {
      if (listUserResponse!.paginate!.next! > 0) {
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
  void onSearchListUser(){
     //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
      mDataListUserResponse!.clear();
      managerUserRepositories!.onSearchListUser(searchNamePhone.text.toString(),page,perPage).then((value) {
        return contract.onGetListUserSuccess(value);
      }).catchError((onError) {
        Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
      });
    update();
  }
  void onDeleteStaff (int id){
    managerUserRepositories!.onDeleteUser(id).then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      onGetListUser(true);
      update();
    }).catchError((onError){
      Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
  }

  @override
  void onCreateUserSuccess(CreateAdminResponse data) {
    // TODO: implement onCreateUserSuccess
  }

  @override
  void onCreatetUserError(ErrorCreateAdminResponse error) {
    // TODO: implement onCreatetUserError
  }

 
}