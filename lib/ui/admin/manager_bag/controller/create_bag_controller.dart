import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/repository/order_admin_repository/order_admin_repositories.dart';
import 'package:viet_trung_mobile/data/repository/setting_reponsitory/setting_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/list_packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_transport_form_response.dart';

import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';


class CreateBagController extends GetxController  {
  List< DataListWareHouseBackResponse> ? mDataListWareHouseBackResponse =[];
  List< DataListStatusBagResponse> ? mDataListStatusBagResponse =[];
  List< DataListTransportFormResponse> ? mDataListTransportFormResponse = [];
  List< DataListPackingFormFormResponse> ? mDataListPackingFormFormResponse =[];
  TextEditingController searchController = TextEditingController();
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
   final FocusNode focusNode = FocusNode();
  bool enabled = false;
  bool onSelect = false;
  bool onInput = false;
  bool onSearch = false;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    settingRepositories = Injector().setting;
    orderAminRepositories = Injector().orderAmin;
    //getDataWareHouseBack();
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
  void isShowCard(String phone) {
    searchController = TextEditingController(text: phone);
    print('------------$phone');
    update();
  }

}

