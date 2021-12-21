import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/models/order_item_add_to_bag.dart';
import 'package:viet_trung_mobile_admin/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/request/add_order_to_bag_request.dart';
import 'package:viet_trung_mobile_admin/data/request/create_bag_request.dart';
import 'package:viet_trung_mobile_admin/data/request/del_package.dart';
import 'package:viet_trung_mobile_admin/data/response/bag_details_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile_admin/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_bag/view/list_order_add_bag_page.dart';

class BagDetailsController extends GetxController {
  List<DataListStatusBagResponse>? mDataListStatusBagResponse = [];
  BagRepositories? bagRepositories;
  ListStatusBagResponse? listStatusBagResponse;
  DataBagDetailsResponse? mDataBagDetailsResponse;
  BagDetailsResponse? bagDetailsResponse;
  String? item_code;
  bool changeBill = false;
  int? id;
  Color? color;
  List<DataOrderAddBag>? mListOrder = [];
  List<DataOrderCreateBag>? mListOrders = [];
  int ? number_package_in_bags;

  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    id = Get.arguments;
    print('$id');
    onGetDetailBag();
    getDataStatusBag();
  }

  Future<List<DataListStatusBagResponse>> getDataStatusBag() async {
    bagRepositories!.onGetListBagStatus().then((value) {
      listStatusBagResponse = value;
      mDataListStatusBagResponse!.addAll(listStatusBagResponse!.data!);
    }).catchError((onError) {});
    return mDataListStatusBagResponse!;
  }

  void onChange(int change) {
    if (change == 1) {
      changeBill = !changeBill;
    }
    update();
  }

  void isShowCard(DataSearchCustomer data) {
    update();
  }

  void onGetDetailBag() {
    bagRepositories!.onGetDetailsBag(id!).then((value) {
      bagDetailsResponse = value;
      update();
    }).catchError((onError) {
      Get.defaultDialog(title: (onError).message.toString(), middleText: '');
      update();
    });
  }
  void onDelPackage(int idOrder){
   
      DelOrderToBagRequest request = DelOrderToBagRequest(
        parent_pack_id: id,
        order_id: idOrder
      );
    bagRepositories!.onDelPackage(request).then((value){
      onGetDetailBag();
      Get.snackbar(NAV_NOTIFICATION, "Xoá đơn hàng thành công");
    }).catchError((onError){
      Get.defaultDialog(title: (onError).message.toString(), middleText: '');
    });
  }
  void onUpdateStatusBag() {
    bagRepositories!.onUpdateSatusBag(item_code!, id!).then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      print("--------------$value");
      update();
    }).catchError((onError) {
      Get.snackbar(PROFILE_NOTIFY, onError.toString());
    });
  }

  Color ColorStatusName(String parent_pack_status_name) {
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
  String onGetNumberPackageInBag (DataListOrderAddBagResponse data){
    String? temp;
    for(var i = 0; i < data.number_package_in_bags!.length ; i++){
        if(bagDetailsResponse!.data!.id == data.number_package_in_bags![i].parent_pack_id){
            temp = data.number_package_in_bags![i].number_package.toString();
          print("is number_package_in_bags ${temp}");
    }
    }
    return temp!;
  }
  void onGetListOrder(List<DataOrderAddBag> data){
    mListOrder = data;
    for(var i = 0; i < mListOrder!.length; i++){
      mListOrders!.add(DataOrderCreateBag(
        number_package: mListOrder![i].number_package,
        order_id: mListOrder![i].id,
      ));
    }
    onAddPackge();
    update();
  }
  void onAddPackge(){
    AddOrderToBagRequest request = AddOrderToBagRequest(
      parent_pack_id: id,
      orders: mListOrders,
    );
    bagRepositories!.onAddPackage(request).then((value) {
      onGetDetailBag();
      Get.snackbar(NAV_NOTIFICATION, "Thêm đơn hàng thành công");
      print("--------------$value");
      update();
    }).catchError((onError){
      Get.snackbar(PROFILE_NOTIFY, onError.toString());
    });
  }
  void onAddProduct(){
    
      Get.dialog(AddProductToBagDialog(), 
      arguments: {
        "warehouse_back_code" : bagDetailsResponse!.data!.warehouse_back_code,
        "transport_form_id" : bagDetailsResponse!.data!.transport_form_id,
        "packing_form_id" : bagDetailsResponse!.data!.packing_form_id,
      }).then((value){
        if(value != null){
          onGetListOrder(value);
        }
      });
    update();
  }
}