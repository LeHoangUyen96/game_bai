import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/repository/setting_reponsitory/setting_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/list_packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_transport_form_response.dart';
import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';

class CreateBagOrdValidController extends GetxController  {
  List< DataListWareHouseBackResponse> ? mDataListWareHouseBackResponse =[];
  List< DataListStatusBagResponse> ? mDataListStatusBagResponse =[];
  List< DataListTransportFormResponse> ? mDataListTransportFormResponse = [];
  List< DataListPackingFormFormResponse> ? mDataListPackingFormFormResponse =[];
  BagRepositories ? bagRepositories;
  SettingRepositories ? settingRepositories;
  ListTransportFormResponse ? listTransportFormResponse;
  ListPackingFormResponse ? listPackingFormFormResponse;
  ListStatusBagResponse ? listStatusBagResponse;
  ListWareHouseBackResponse ? listWareHouseBackResponse;
  String? item_code;
  bool changeBill = false;
  int listBag = 1;
  int defaultsStatus = 0;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    settingRepositories = Injector().setting;
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
  void addBagItem(){
    listBag = listBag +1;
    update();
  }
  void onDelBagItem(){
      listBag = listBag -1;
      update();
    }
  void onChangeColorBag(int index) {
    defaultsStatus = index;
    update();
  }
}
