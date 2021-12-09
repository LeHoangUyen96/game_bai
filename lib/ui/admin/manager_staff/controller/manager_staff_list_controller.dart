import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/manager_staff_reponsitory/manager_staff_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/list_admin_response.dart';
import 'package:viet_trung_mobile/ui/admin/manager_staff/contract/manager_staff_contract.dart';

class ManagerStaffController extends GetxController implements ManagerStaffContract  {
  RefreshController refreshController = RefreshController(initialRefresh: false);
  ManagerStaffRepositories ? managerStaffRepositories;
  ListAdminResponse? listAdminResponse;
  List< DataListAdminResponse> ? mDataListAdminResponse = [];
  bool isNextPage = false;
  ManagerStaffContract? contract;
  int page = 1;
  int perPage = 10;
  @override
  void onInit() {
    super.onInit();
    managerStaffRepositories = Injector().managerStaff;
    contract = this;
    onGetListAdmin(false);
  }
 void onGetListAdmin(bool isRefresh){
   if (isRefresh) {
      mDataListAdminResponse!.clear();
    }
    managerStaffRepositories!.onGetListAdmin(page, perPage).then((value) {
      
      return contract!.onGetListAdminSuccess(value);
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
    
    if (listAdminResponse!.paginate!.current_page! <= listAdminResponse!.paginate!.last_page!) {
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

}