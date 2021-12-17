import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/setting_reponsitory/setting_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_transport_form_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_packing_form_response.dart';

class SettingImpl extends GetConnect implements SettingRepositories {
  @override
  Future<ListPackingFormResponse> onGetListPackingForm() async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.SETTING_PACKING_FORM;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListPackingFormResponse.fromJson(
          responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListTransportFormResponse> onGetListTransport() async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.SETTING_TRANSPORT_FORM;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListTransportFormResponse.fromJson(
          responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
