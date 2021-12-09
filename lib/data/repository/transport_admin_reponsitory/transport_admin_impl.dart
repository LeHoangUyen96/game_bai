import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/list_transport_admin_response.dart';
import 'package:viet_trung_mobile/data/response/transport_admin_detail_response.dart';
import 'dart:convert';

class TransportAdminImpl extends GetConnect
    implements TransportAdminRepositories {
  @override
  Future<TransportFormAdminResponse> onGetListTransport() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listTransport;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return TransportFormAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<TransportAdminDetailResponse> onGetTransportDetail(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.transportDetail + id;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return TransportAdminDetailResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onDeleteTransport(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.deleteTransport + id;
    final responseJson = await delete(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
