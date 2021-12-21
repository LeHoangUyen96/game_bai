import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/models/order_item_add_to_bag.dart';
import 'package:viet_trung_mobile_admin/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/request/create_bag_request.dart';
import 'package:viet_trung_mobile_admin/data/request/list_order_add_bag_request.dart';
import 'package:viet_trung_mobile_admin/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_bag/view/create_bag_page.dart';
import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';

class ListOrderAddToBagController extends GetxController {
  TextEditingController numberPackageController = TextEditingController();
  TextEditingController searchBillCodeController = TextEditingController();
  ListOrderAddBagResponse? listOrderAddBagResponse;
  List<DataListOrderAddBagResponse>? mDataListOrderAddBagResponse = [];
  List<DataListOrderAddBagResponse>? mDataListOrder = [];
  BagRepositories? bagRepositories;
  int? transport_form_id;
  int? packing_form_id;
  String? warehouse_back_code;
  int? order_id;
  int? user_id;
  int? number_package;
  List<DataOrderAddBag>? mListOrders = [];
  DataOrderCreateBag? mDataOrderCreateBag;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    if (Get.arguments != null) {
      if (Get.arguments['transport_form_id'] == null) {
        transport_form_id = null;
      } else {
        transport_form_id = Get.arguments['transport_form_id'];
      }
      if (Get.arguments['warehouse_back_code'] == null) {
      } else {
        warehouse_back_code = Get.arguments['warehouse_back_code'];
      }
      if (Get.arguments['packing_form_id'] == null) {
      } else {
        packing_form_id = Get.arguments['packing_form_id'];
      }
      if (Get.arguments['user_id'] == null) {
        user_id = 0;
      } else {
        user_id = Get.arguments['user_id'];
      }
    }
    print("transport_form_id:$transport_form_id");
    print("warehouse_back_code:$warehouse_back_code");
    print("packing_form_id:$packing_form_id");
    print("user_id:$user_id");
    onGetListOrderAddToBag();
  }

  void onGetListOrderAddToBag() {
    //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    ListOrderAddBagRequest request = ListOrderAddBagRequest(
      warehouse_back_code: warehouse_back_code,
      transport_form_id: transport_form_id,
      packing_form_id: packing_form_id,
      user_id: user_id,
    );
    bagRepositories!.onGetListOrderAddBag(request).then((value) {
      //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
      listOrderAddBagResponse = value;
      mDataListOrderAddBagResponse!.addAll(listOrderAddBagResponse!.data!);
      update();
    }).catchError((onError) {
      return onError(onError);
    });

    update();
  }

  void onSearchBillCode() {
    bagRepositories!
        .onSearchBillCode(searchBillCodeController.text, warehouse_back_code!,
            transport_form_id!)
        .then((value) {
      listOrderAddBagResponse = value;
      mDataListOrderAddBagResponse!.addAll(listOrderAddBagResponse!.data!);
      update();
    }).catchError((onError) {
      Get.snackbar(PROFILE_NOTIFY, onError.toString());
    });
    update();
  }

  void onChangeItem(int id, int val) {
    for (var i = 0; i < mDataListOrderAddBagResponse!.length; i++) {
      if (mDataListOrderAddBagResponse![i].id == id) {
        mDataListOrderAddBagResponse![i].number_package_remain = val;
        print("${mDataListOrderAddBagResponse![i].number_package_remain}");
      }
    }
  }

  void onChangeNumberPackage(String val, int idOrder) {
    for (var i = 0; i < mDataListOrderAddBagResponse!.length; i++) {
      if (mDataListOrderAddBagResponse![i].id == idOrder &&
          number_package! <=
              mDataListOrderAddBagResponse![i].number_package_remain! &&
          number_package! > 0) {
        mDataListOrderAddBagResponse![i].isCheck = true;
        if (mDataListOrderAddBagResponse![i].isCheck = true) {
          mListOrders!.add(DataOrderAddBag(
            id: idOrder,
            bill_code: mDataListOrderAddBagResponse![i].bill_code,
            number_package: number_package,
            surcharge: mDataListOrderAddBagResponse![i].surcharge,
            transport_fee: mDataListOrderAddBagResponse![i].transport_fee,
            packing_form: mDataListOrderAddBagResponse![i].packing_form,
          ));
          //mDataListOrderAddBagResponse![i].number_package_remain = number_package;

          //update();
        }
      }
    }
    // number_package = int.parse(val,onError: (val) => -1) ;
    // print('onchange ${numberPackageController}');
    //update();
  }

  void onAddBag() {
    for (var i = 0; i < mDataListOrderAddBagResponse!.length; i++) {
      if (mDataListOrderAddBagResponse![i].number_order! <=
              mDataListOrderAddBagResponse![i].number_package_remain! &&
          mDataListOrderAddBagResponse![i].number_order! > 0) {
        if (mDataListOrderAddBagResponse![i].isCheck = true) {
          mListOrders!.add(DataOrderAddBag(
            id: mDataListOrderAddBagResponse![i].id,
            bill_code: mDataListOrderAddBagResponse![i].bill_code,
            number_package: mDataListOrderAddBagResponse![i].number_order!,
            surcharge: mDataListOrderAddBagResponse![i].surcharge,
            transport_fee: mDataListOrderAddBagResponse![i].transport_fee,
            packing_form: mDataListOrderAddBagResponse![i].packing_form,
          ));
        }
      }
    }
    Get.back(result: mListOrders);
    update();
  }

  void onNumberOrder(int id, String num) {
    for (var i = 0; i < mDataListOrderAddBagResponse!.length; i++) {
      if (mDataListOrderAddBagResponse![i].id == id) {
        mDataListOrderAddBagResponse![i].isCheck = true;
        mDataListOrderAddBagResponse![i].number_order =
            ParseNumber.parseInt(num);
        print("$num");
      }
    }
  }
}
