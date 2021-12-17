import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/response/list_transport_admin_response.dart';

class TransportController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  TransportAdminRepositories? repository;
  TransportFormAdminResponse? response;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().transport;
    onGetListTransport();
  }

  void onGetListTransport() {
    repository!.onGetListTransport().then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onRefresh() async {
    onGetListTransport();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    onGetListTransport();
    refreshController.refreshCompleted();
  }
}
