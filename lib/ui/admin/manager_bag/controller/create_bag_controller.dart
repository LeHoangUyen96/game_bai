import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/repository/setting_reponsitory/setting_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_transport_form_response.dart';

import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';


class CreateBagController extends GetxController  {
  List< DataListWareHouseBackResponse> ? mDataListWareHouseBackResponse =[];
  List< DataListStatusBagResponse> ? mDataListStatusBagResponse =[];
  BagRepositories ? bagRepositories;
  SettingRepositories ? settingRepositories;
  ListStatusBagResponse ? listStatusBagResponse;
  ListWareHouseBackResponse ? listWareHouseBackResponse;
  String? item_code;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    settingRepositories = Injector().setting;
    getDataWareHouseBack();
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
}