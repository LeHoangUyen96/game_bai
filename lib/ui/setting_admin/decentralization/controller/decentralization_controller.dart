import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/decentralization_admin_reponsitory/decentralization_admin_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/list_decentralization_response.dart';

class DecentralizationController extends GetxController {
  RefreshController refreshOrderController =
      RefreshController(initialRefresh: false);
  int? total;
  DecentralizationAdminRepositories? repository;
  DecentralizationResponse? response;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().decentralization;
    onGetListDecentralization();
  }

  void onGetListDecentralization() {
    repository!.onGetListDecentralization().then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onRefreshOrder() async {
    refreshOrderController.refreshCompleted();
  }

  void onLoadingOrder() async {
    refreshOrderController.refreshCompleted();
  }
}
