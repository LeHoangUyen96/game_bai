import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/packing_admin_reponsitory/packing_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/response/list_transport_admin_response.dart';

class PackingController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  PackingAdminRepositories? repository;
  TransportFormAdminResponse? response;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().packing;
    onGetListPacking();
  }

  void onGetListPacking() {
    repository!.onGetListPacking().then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
  }

  void onRefresh() async {
    onGetListPacking();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    onGetListPacking();
    refreshController.refreshCompleted();
  }
}
