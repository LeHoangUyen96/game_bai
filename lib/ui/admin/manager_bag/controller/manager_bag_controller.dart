import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/models/order_item_add_to_bag.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/repository/setting_reponsitory/setting_reponsitory.dart';
import 'package:viet_trung_mobile/data/request/add_order_to_bag_request.dart';
import 'package:viet_trung_mobile/data/request/create_bag_request.dart';
import 'package:viet_trung_mobile/data/request/manager_bag_filter_request.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/list_bag_resoonse.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_transport_form_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/contract/manager_bag_contract.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/list_order_add_bag_page.dart';
import 'package:viet_trung_mobile/ulti/helper/dateTime_helper.dart';

class ManagerBagController extends GetxController
    implements ManagerBagContract {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  TextEditingController codeController = TextEditingController();
  BagRepositories? bagRepositories;
  ListBagResponse? mListBagResponse;
  List<DataBagResponse>? mDataBagResponse = [];
  List<DataListStatusBagResponse>? mDataListStatusBagResponse = [];
  List<DataListTransportFormResponse>? mDataListTransportFormResponse = [];
  ListTransportFormResponse? listTransportFormResponse;
  SettingRepositories? settingRepositories;
  ListStatusBagResponse? listStatusBagResponse;
  late ManagerBagContract  contract;
  bool isNextPage = false;
  int page = 1;
  int perPage = 10;
  Color? color;
  bool checkFilter = false;
  int? transport_form_id;
  String? statusBag;
  DateTime? fromDay;
  DateTime? toDay;
  String? toDateTime;
  String? fromDateTime;
  List<DataOrderAddBag>? mListOrder = [];
  List<DataOrderCreateBag>? mListOrders = [];
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    settingRepositories = Injector().setting;
    contract = this;
    getListBag(false);
    fromDay = DateTime.now();
    toDay = DateTime.now();
    getDataStatusBag();
    getDataTransportForm();
  }

  void getListBag(bool isRefresh) {
    if (isRefresh) {
      mDataBagResponse!.clear();
    }
    bagRepositories!.onGetListBag(page, perPage).then((value) {
      return contract.onGetListBagSuccess(value);
    }).catchError((onError) {
      print("-----------------$onError");
      return contract.onGetListBagError(onError);
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
    if (mListBagResponse!.paginate!.current_page! <=
        mListBagResponse!.paginate!.last_page!) {
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
    return color !;
  }

  void onCheckFilter() {
    checkFilter = !checkFilter;
    update();
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

  pickFromDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: fromDay!,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (date != null) {
      fromDay = date;
      print(date.toString());
      fromDateTime = DateTimeHelper.toDayMonthYear(fromDay!.toIso8601String());
      update();
    }
    update();
  }

  pickToDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: toDay!,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (date != null) {
      toDay = date;
      print(date.toString());
      toDateTime = DateTimeHelper.toDayMonthYear(toDay!.toIso8601String());
      update();
    }
    update();
  }

  void onConfirm() {
    ManagerBagRequest request = ManagerBagRequest(
      //code: codeController.text.toString(),
      parent_pack_status_code: statusBag.toString(),
      transport_form_id: transport_form_id,
      from_date: fromDateTime.toString(),
      to_date: toDateTime.toString(),
    );
    onGetListBagSearch(request);
    onCheckFilter();
    //Get.back(result: request);
    update();
  }

  void onSearch() {
    ManagerBagRequest request = ManagerBagRequest(
      code: codeController.text.toString(),
    );
    onGetListBagFilter();
    //Get.back(result: request);
    update();
  }

  void onGetListBagSearch(ManagerBagRequest request) {
    //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    mDataBagResponse!.clear();
    bagRepositories!.onSearchListBag(request, page, perPage).then((value) {
      // Get.back();
      // onCheckFilter();
      return contract.onGetListBagSuccess(value);
    }).catchError((onError) {
      Get.defaultDialog(
          title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
    update();
  }

  void onGetListBagFilter() {
    mDataBagResponse!.clear();
    bagRepositories!
        .onFilterListBag(codeController.text.toString(), page, perPage)
        .then((value) {
      return contract.onGetListBagSuccess(value);
    }).catchError((onError) {
      Get.defaultDialog(
          title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
    update();
  }
   void onAddProduct(){
     for(var i = 0; i < mListBagResponse!.data!.length; i++){
       Get.dialog(AddProductToBagDialog(), 
      arguments: {
        "warehouse_back_code" : mListBagResponse!.data![i].warehouse_back_code,
        "transport_form_id" : mListBagResponse!.data![i].transport_form_id,
      }).then((value){
        if(value != null){
          onGetListOrder(value);
        }
      });
      print("warehouse_back_code :${mListBagResponse!.data![i].warehouse_back_code}");
      print("transport_form_id :${mListBagResponse!.data![i].transport_form_id}");
     }
    update();
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
    for(var i = 0; i < mListBagResponse!.data!.length; i++){
      AddOrderToBagRequest request = AddOrderToBagRequest(
      parent_pack_id: mListBagResponse!.data![i].id,
      orders: mListOrders,
    );
    bagRepositories!.onAddPackage(request).then((value) {
      getListBag(false);
      Get.snackbar(NAV_NOTIFICATION, "Thêm đơn hàng thành công");
      print("--------------$value");
      update();
    }).catchError((onError){
      Get.snackbar(PROFILE_NOTIFY, onError.toString());
    });
    } 
  }
}
