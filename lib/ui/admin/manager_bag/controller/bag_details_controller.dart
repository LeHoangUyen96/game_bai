import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/bag_details_response.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class BagDetailsController extends GetxController  {
  List< DataListStatusBagResponse> ? mDataListStatusBagResponse =[];
  BagRepositories ? bagRepositories;
  ListStatusBagResponse ? listStatusBagResponse;
  DataBagDetailsResponse ? mDataBagDetailsResponse;
  BagDetailsResponse ? bagDetailsResponse;
  String? item_code;
  bool changeBill = false;
  int? id;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
    id = Get.arguments;
    print('$id');
    onGetDetailBag();
  }
  Future<List<DataListStatusBagResponse>> getDataStatusBag () async {
    bagRepositories!.onGetListBagStatus().then((value){
      listStatusBagResponse = value;
      mDataListStatusBagResponse!.addAll(listStatusBagResponse!.data!);
    }).catchError((onError){
    });
    return mDataListStatusBagResponse!;
  }
  void onChange (int change){
    if(change == 1){
      changeBill = !changeBill;
    }
    update();
  }
  void onGetDetailBag() {
    bagRepositories!.onGetDetailsBag(id!).then((value){
      bagDetailsResponse = value;
      update();
   }).catchError((onError){
     Get.defaultDialog(title: (onError).message.toString(), middleText: '');
      update();
    });
  }
  void onUpdateStatusBag() {
    bagRepositories!
        .onUpdateSatusBag(item_code!, id!)
        .then((value) {
      Get.snackbar(NAV_NOTIFICATION, value.message.toString());
      print("--------------$value");
      update();
    }).catchError((onError) {
      Get.snackbar(PROFILE_NOTIFY, onError.toString());
    });
  }
}