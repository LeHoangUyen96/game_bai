import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/dashboard_reponsitoy/dashboard_reponsitoy.dart';
import 'package:viet_trung_mobile/data/response/dashboard_admin_response.dart';
import 'package:viet_trung_mobile/data/response/dashboard_user_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';

class DashboardImpl extends GetConnect implements DashboardRepositories {
  @override
  Future<DashboardUsesResponse> onGetDashboard() async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.DASHBOARD_USER;
    final responseJson = await get(url, headers: header);
    if(responseJson.statusCode! >= 200 && responseJson.statusCode! < 300){
      return DashboardUsesResponse.fromJson(responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<DashboardAdminResponse> onGetDashboardAdmin() async{
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.DASHBOARD_ADMIN;
    final responseJson = await get(url, headers: header);
    if(responseJson.statusCode! >= 200 && responseJson.statusCode! < 300){
      return DashboardAdminResponse.fromJson(responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}