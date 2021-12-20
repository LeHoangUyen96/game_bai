import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/home_reponsitory/home_repositories.dart';
import 'package:viet_trung_mobile_admin/data/request/device_token_request.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/home_response.dart';
import 'package:get/get.dart';

class HomeImpl extends GetConnect implements HomeRepositories {
  @override
  Future<HomeResponse> onGetHome() async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.HOME;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return HomeResponse.fromJson(responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<bool> onUpdateToken(String deviceToken) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.UPDATE_TOKEN;

    final json = DeviceTokenRequest(deviceToken: deviceToken).toJson();
    final responseJson = await post(url, json, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return true;
    } else {
      return false;
    }
  }
}
