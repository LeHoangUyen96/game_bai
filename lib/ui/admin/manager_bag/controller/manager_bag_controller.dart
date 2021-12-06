import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/list_bag_resoonse.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/contract/manager_bag_contract.dart';

class ManagerBagController extends GetxController implements ManagerBagContract {
  RefreshController refreshController = RefreshController(initialRefresh: false);
  BagRepositories ? bagRepositories;
  ListBagResponse? mListBagResponse;
  List< DataBagResponse> ? mDataBagResponse =[];
  ManagerBagContract ? contract;
  bool isNextPage = false;
  int page = 1;
  int perPage = 10;
  Color? color;
  bool checkFilter = false;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    contract = this;
    getListBag(false);
  }
  void getListBag(bool isRefresh) {
    if (isRefresh) {
      mDataBagResponse!.clear();
    }
    bagRepositories!.onGetListBag(page, perPage).then((value) {
      return contract!.onGetListBagSuccess(value);
    }).catchError((onError) {
      print("-----------------$onError");
       return contract!.onGetListBagError(onError);
    });
  }

  @override
  void onGetListBagError(ErrorResponse error) {
    Get.defaultDialog(title: error.message.toString(), middleText: '');
  }

  @override
  void onGetListBagSuccess(ListBagResponse data) {
    mListBagResponse = data;
    mDataBagResponse!.addAll(mListBagResponse!.data!);
    if (mListBagResponse!.paginate!.current_page! <= mListBagResponse!.paginate!.last_page!) {
      if (mListBagResponse!.paginate!.next! > 0) {
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
  void onListLoading() async {
    if (isNextPage) {
      page = (page + 1);
      getListBag(false);
    }
  }

  void onListRefresh() async {
    page = 1;
    getListBag(true);
    update();
  }
  Color ColorStatusName( String parent_pack_status_name) {
    switch (parent_pack_status_name) {
      case ORDER_LIST_CHINA_WAREHOUSE:
        color = COLOR_ORDER_CHINESE_WAREHOUSE;
        break;
      case ORDER_EXPORT_TO_CHINA:
        color = COLOR_ORDER_EXPORT_TO_CHINA;
        break;
      case ORDER_BORDER_WAREHOUSE:
        color = COLOR_ORDER_BORDER_WAREHOUSE;
        break;
      case ORDER_PROCESS:
        color = COLOR_ORDER_PROCESS;
        break;
      case ORDER_HN_WAREHOUSE:
        color = COLOR_ORDER_HN_WAREHOUSE;
        break;
      case ORDER_SG_WAREHOUSE:
        color = COLOR_ORDER_SG_WAREHOUSE;
        break;
      case ORDER_DN_WAREHOUSE:
        color = COLOR_ORDER_DN_WAREHOUSE;
        break;
      case ORDER_DELIVERY_IN_PROGRESS:
        color = COLOR_ORDER_DELIVERY_IN_PROGRESS;
        break;
      case ORDER_DELIVERY_SUCCESSFULL:
        color = COLOR_ORDER_DELIVERY_SUCCESSFULL;
        break;        
    }
    return color!;
  }
  void onCheckFilter(){
    checkFilter = !checkFilter;
    update();
  }
}