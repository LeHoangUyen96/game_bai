import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/role_admin_reponsitory/role_admin_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/list_role_response.dart';

class RoleController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int? total;
  RoleAdminRepositories? repository;
  RoleResponse? response;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().role;
    onGetListRole();
  }

  void onGetListRole() {
    repository!.onGetListRole().then((value) {
      response = value;
      update();
    }).catchError((onError) {
      update();
    });
    update();
  }

  void onRefresh() async {
    onGetListRole();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    onGetListRole();
    refreshController.refreshCompleted();
  }
}
