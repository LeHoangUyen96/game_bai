import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';

class BagDetailsController extends GetxController  {
  List< DataListStatusBagResponse> ? mDataListStatusBagResponse =[];
  BagRepositories ? bagRepositories;
  ListStatusBagResponse ? listStatusBagResponse;
  String? item_code;
  bool changeBill = false;
  @override
  void onInit() {
    super.onInit();
    bagRepositories = Injector().bag;
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
}