import 'package:get/get_connect.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/role_admin_reponsitory/role_admin_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/request/update_role_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_role_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_rights_group.dart';
import 'package:viet_trung_mobile_admin/data/response/role_detail_response.dart';
import 'dart:convert';

class RoleAdminImpl extends GetConnect implements RoleAdminRepositories {
  @override
  Future<RoleResponse> onGetListRole() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.listRole;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RoleResponse.fromJson(responseJson.body);
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

  @override
  Future<RoleDetailResponse> onGetRoleDetail(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.roleDetail + id;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RoleDetailResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onUpdateRole(
      UpdateRoleRequest request, String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.updateRole + id;
    final body = json.encode(request);
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onDeleteRole(String id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.deleteRole + id;
    final responseJson = await delete(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onAddRole(UpdateRoleRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.addRole;
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
