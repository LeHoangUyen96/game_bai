import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/dashboard_reponsitoy/dashboard_reponsitoy.dart';
import 'package:viet_trung_mobile_admin/data/response/dashboard_user_response.dart';

class DashboardUserController extends GetxController {
  DashboardUsesResponse? dashboardUsesResponse;
  DashboardRepositories? dashboardRepositories;
  @override
  void onInit() {
    super.onInit();
    dashboardRepositories = Injector().dashboard;
    onGetDashboard();
  }

  void onGetDashboard() {
    dashboardRepositories!.onGetDashboard().then((value) {
      dashboardUsesResponse = value;
    }).catchError((onError) {
      Get.defaultDialog(title: (onError).message.toString(), middleText: '');
    });
  }
}
