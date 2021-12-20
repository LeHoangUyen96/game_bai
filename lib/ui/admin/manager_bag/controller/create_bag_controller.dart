import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/models/order_item_add_to_bag.dart';
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
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/list_order_add_bag_page.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class CreateBagController extends GetxController {
  List<DataListWareHouseBackResponse>? mDataListWareHouseBackResponse = [];
  List<DataListStatusBagResponse>? mDataListStatusBagResponse = [];
  List<DataListTransportFormResponse>? mDataListTransportFormResponse = [];
  List<DataListPackingFormFormResponse>? mDataListPackingFormFormResponse = [];
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
  int transport_form_id = 0;
  String? warehouse_back_code;
  String? packing_from;
  int order_id = 0;
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
  String searchUserErros = '';
  bool isSearchUserValid = true;
  String totalCodErros = '';
  bool isTotalCodValid = true;
  String typeBagErros = '';
  bool isTypeBagValid = true;
  String transportFormIdErros = '';
  bool isTransportFormIdValid = true;
  String warehouseBackCodeErros = '';
  bool isWarehouseBackCodeValid = true;
  String packingFromErros = '';
  bool isPackingFromValid = true;
  String weightFromErros = '';
  bool isWeightFromValid = true;
  String orderErros = '';
  bool isOrderValid = true;
  double? totalCodPackage = 0.0;
  List<DataOrderAddBag>? mListOrder = [];
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    settingRepositories = Injector().setting;
    orderAminRepositories = Injector().orderAmin;
    if (Get.arguments != null) {
      if (Get.arguments['order_id'] == null) {
        order_id = 0;
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
    getDataWareHouseBack();
    getDataStatusBag();
    getDataTransportForm();
    getDataListTransport();
  }
  void onGetListOrder(List<DataOrderAddBag> data){
    mListOrder = data;
    for(var i = 0; i < mListOrder!.length; i++){
      total_numberPackage = total_numberPackage + mListOrder![i].number_package!;
      totalCodPackage = totalCodPackage! + mListOrder![i].transport_fee!;
    }
    print("${mDataListOrder!.length}");
    update();
  }
  void onClearOrder( data, int index) {
   
    for(var i = 0; i < mListOrder!.length; i++){
      if(mListOrder![i].id == data){
        total_numberPackage = total_numberPackage - mListOrder![i].number_package!;
      print('--------------------------${total_numberPackage}');
      totalCodPackage = totalCodPackage! - mListOrder![i].transport_fee!;
      } 
    }
     mListOrder!.removeAt(index);
    //onGetListOrder(mListOrder!);
    update();
  }
  Future<List<DataListWareHouseBackResponse>> getDataWareHouseBack () async {
    //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    bagRepositories!.onGetListWarehouseback().then((value){
      listWareHouseBackResponse = value;
      mDataListWareHouseBackResponse!.addAll(listWareHouseBackResponse!.data!);
    }).catchError((onError) {});
    return mDataListWareHouseBackResponse!;
  }

  Future<List<DataListStatusBagResponse>> getDataStatusBag() async {
    bagRepositories!.onGetListBagStatus().then((value) {
      listStatusBagResponse = value;
      mDataListStatusBagResponse!.addAll(listStatusBagResponse!.data!);
    }).catchError((onError) {});
    return mDataListStatusBagResponse!;
  }

  Future<List<DataListTransportFormResponse>> getDataTransportForm() async {
    settingRepositories!.onGetListTransport().then((value) {
      listTransportFormResponse = value;
      mDataListTransportFormResponse!.addAll(listTransportFormResponse!.data!);
    }).catchError((onError) {});
    return mDataListTransportFormResponse!;
  }

  Future<List<DataListPackingFormFormResponse>> getDataListTransport() async {
    settingRepositories!.onGetListPackingForm().then((value) {
      listPackingFormFormResponse = value;
      mDataListPackingFormFormResponse!
          .addAll(listPackingFormFormResponse!.data!);
    }).catchError((onError) {});
    return mDataListPackingFormFormResponse!;
  }

  void onChange(int change) {
    if (change == 1) {
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

    for(var i = 0; i < mListOrder!.length; i++){
      mListOrders!.add(DataOrderCreateBag(
        number_package: mListOrder![i].number_package,
        order_id: mListOrder![i].id,
      ));
    }
    if (warehouse_back_code == null) {
      isWarehouseBackCodeValid = false;
      warehouseBackCodeErros = "Kho chuyển về không được để trống";
    } else {
      isWarehouseBackCodeValid = true;
    }
    if (transport_form_id == 0) {
      isTransportFormIdValid = false;
      transportFormIdErros = "Hình thức vận chuyển không được để trống";
    } else {
      isTransportFormIdValid = true;
    }
    if (typeBag == null) {
      isTypeBagValid = false;
      typeBagErros = "Kiểu bao không được để trống";
    } else {
      isTypeBagValid = true;
    }
    if (typeBag == "intact_bag" && searchController.text.isEmpty ) {
      isSearchUserValid = false;
      searchUserErros = "Khách hàng không được để trống";
    } else {
      isSearchUserValid = true;
    }
    if (weightController.text.isEmpty) {
      isWeightFromValid = false;
      weightFromErros = "Trọng lượng không được để trống";
    } else {
      isWeightFromValid = true;
    }
    if (mListOrders!.length < 0) {
      isOrderValid = false;
      orderErros = "Danh sách đơn hàng không được để trống";
    } else {
      isOrderValid = true;
    }
    if(isWarehouseBackCodeValid && isTransportFormIdValid && isTypeBagValid &&  isSearchUserValid&& isWeightFromValid && isTotalCodValid&& isOrderValid){
      CreateBagRequest request = CreateBagRequest(
      parent_pack_type : typeBag,
      warehouse_back_code : warehouse_back_code,
      user_id : userCode != null ? userCode : null,
      transport_form_id : transport_form_id,
      weight : ParseNumber.parseInt(weightController.text),
      total_cod : totalCodPackage,
      orders : mListOrders
    );
    bagRepositories!.onCreateBag(request).then((value) {
      Get.snackbar(NOTIFY, value.message.toString());
    }).catchError((onError){
      return onError(onError);
    });
    Get.back(result: request);
    }
    
    update();
  }

  void onAddProduct(){
    if (warehouse_back_code == null) {
      isWarehouseBackCodeValid = false;
      warehouseBackCodeErros = "Kho chuyển về không được để trống";
    } else {
      isWarehouseBackCodeValid = true;
    }
    if (transport_form_id == 0) {
      isTransportFormIdValid = false;
      transportFormIdErros = "Hình thức vận chuyển không được để trống";
    } else {
      isTransportFormIdValid = true;
    }
    if(isWarehouseBackCodeValid && isTransportFormIdValid){
      Get.dialog(AddProductToBagDialog(), 
      arguments: {
        "warehouse_back_code" : warehouse_back_code,
        "transport_form_id" : transport_form_id,
      }).then((value){
        if(value != null){
          onGetListOrder(value);
        }
      });
    }
    update();
  }
}
