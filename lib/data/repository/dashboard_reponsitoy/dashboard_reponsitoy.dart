import 'package:viet_trung_mobile/data/response/dashboard_user_response.dart';

abstract class DashboardRepositories {
  Future<DashboardUsesResponse> onGetDashboard();

}