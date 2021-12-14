import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/repository/setting_reponsitory/setting_reponsitory.dart';
import 'package:viet_trung_mobile/data/request/create_bag_request.dart';
import 'package:viet_trung_mobile/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_transport_form_response.dart';

import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';


class CreateBagController extends GetxController  {
  List< DataListWareHouseBackResponse> ? mDataListWareHouseBackResponse =[];
  List< DataListStatusBagResponse> ? mDataListStatusBagResponse =[];
  List< DataListTransportFormResponse> ? mDataListTransportFormResponse = [];
  List< DataListPackingFormFormResponse> ? mDataListPackingFormFormResponse =[];
  TextEditingController searchController = TextEditingController();
  TextEditingController totalCodController = TextEditingController();
  
  TextEditingController weightController = TextEditingController();
  BagRepositories ? bagRepositories;
  SettingRepositories ? settingRepositories;
  ListTransportFormResponse ? listTransportFormResponse;
  ListPackingFormResponse ? listPackingFormFormResponse;
  ListStatusBagResponse ? listStatusBagResponse;
  ListWareHouseBackResponse ? listWareHouseBackResponse;
  OrderAdminRepositories? orderAminRepositories;
  List<DataSearchCustomer>? searchResponse;
  String? item_code;
  String? typeBag;
  bool changeBill = false;
  int? transport_form_id;
  String? warehouse_back_code;
  String? packing_from;
  int? order_id;
  int? number_package;
  int total_numberPackage = 0;
   final FocusNode focusNode = FocusNode();
  List< DataListOrderAddBagResponse> ? mDataListOrder =[];
  List<DataOrderCreateBag>? mListOrders = [];
  bool enabled = false;
  bool onSelect = false;
  bool onInput = false;
  bool onSearch = false;
  int? userCode;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    settingRepositories = Injector().setting;
    orderAminRepositories = Injector().orderAmin;
    if (Get.arguments != null) {
      if (Get.arguments['order_id'] == null) {
        order_id = null;
      } else {
        order_id = Get.arguments['order_id'];
      }
      if (Get.arguments['number_package'] == null) {
      } else {
        number_package = Get.arguments['number_package'];
      }
    }
    print("$order_id");
    print("$number_package");
    //getDataWareHouseBack();
  }
  void onGetListOrder(List<DataListOrderAddBagResponse> data){
    mDataListOrder = data;
    
    for(var i = 0; i < mDataListOrder!.length; i++){
      total_numberPackage = total_numberPackage + mDataListOrder![i].number_package_remain!;
    }

    print("${mDataListOrder!.length}");
    update();
  }
  Future<List<DataListWareHouseBackResponse>> getDataWareHouseBack () async {
    bagRepositories!.onGetListWarehouseback().then((value){
      listWareHouseBackResponse = value;
      mDataListWareHouseBackResponse!.addAll(listWareHouseBackResponse!.data!);
    }).catchError((onError){
    });
    return mDataListWareHouseBackResponse!;
  }
  Future<List<DataListStatusBagResponse>> getDataStatusBag () async {
    bagRepositories!.onGetListBagStatus().then((value){
      listStatusBagResponse = value;
      mDataListStatusBagResponse!.addAll(listStatusBagResponse!.data!);
    }).catchError((onError){
    });
    return mDataListStatusBagResponse!;
  }

  Future<List<DataListTransportFormResponse>> getDataTransportForm () async {
    settingRepositories!.onGetListTransport().then((value){
      listTransportFormResponse = value;
      mDataListTransportFormResponse!.addAll(listTransportFormResponse!.data!);
    }).catchError((onError){
    });
    return mDataListTransportFormResponse!;
  }
  Future<List<DataListPackingFormFormResponse>> getDataListTransport () async {
    settingRepositories!.onGetListPackingForm().then((value){
      listPackingFormFormResponse = value;
      mDataListPackingFormFormResponse!.addAll(listPackingFormFormResponse!.data!);
    }).catchError((onError){
    });
    return mDataListPackingFormFormResponse!;
  }
  void onChange (int change){
    if(change == 1){
      changeBill = !changeBill;
    }
    update();
  }
   void onGetListSearch(String? phone) {
    orderAminRepositories!.onGetListSearchCustomer(phone!).then((value) {
      searchResponse = value.data!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }
  void isShowCard(String phone, int user_code) {
    searchController = TextEditingController(text: phone);
    userCode = user_code;
    print('--phone----$phone');
    print('-user_code-$user_code');
    update();
  }
  void onCreateBag(){
    for(var i = 0; i < mDataListOrder!.length; i++){
      mListOrders!.add(DataOrderCreateBag(
        number_package: mDataListOrder![i].number_package_remain,
        order_id: mDataListOrder![i].id,
      ));
    }
    CreateBagRequest request = CreateBagRequest(
      parent_pack_type : typeBag,
      warehouse_back_code : warehouse_back_code,
      user_id : userCode != null ? userCode : null,
      transport_form_id : transport_form_id,
      weight : ParseNumber.parseInt(weightController.text),
      total_cod : ParseNumber.parseDouble(totalCodController.text),
      orders : mListOrders
    );
    bagRepositories!.onCreateBag(request).then((value) {
      Get.snackbar(NOTIFY, value.message.toString());
    }).catchError((onError){
      return onError(onError);
    });
    Get.back(result: request);
    update();
  }

}

