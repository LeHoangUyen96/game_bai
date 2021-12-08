import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/decentralization_admin_reponsitory/decentralization_admin_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/list_decentralization_response.dart';
import 'package:viet_trung_mobile/data/response/list_rights_group.dart';

class DecentralizationAdminImpl extends GetConnect
    implements DecentralizationAdminRepositories {
  @override
  Future<DecentralizationResponse> onGetListDecentralization() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listDecentralization;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return DecentralizationResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<RightsGroupResponse> onGetListRightsGroup() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listRightsGroup;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RightsGroupResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
