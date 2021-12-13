import 'dart:convert';

import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/manager_user_reponsitory/manager_user_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/create_admin_response.dart';
import 'package:viet_trung_mobile/data/request/create_user_request.dart';
import 'package:viet_trung_mobile/data/response/detail_user_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/errors_create_admin.dart';
import 'package:viet_trung_mobile/data/response/list_user_response.dart';
import 'package:viet_trung_mobile/data/response/update_status_bag_response.dart';

class ManagerUserImpl extends GetConnect implements ManagerUserRepositories {
  @override
  Future<ListUserResponse> onGetListUser(int page, int perPage) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_USER_LIST;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListUserResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListUserResponse> onSearchListUser(String search_name_phone, int page, int perPage) async{
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_USER_LIST + "?search_name_phone=$search_name_phone";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListUserResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<UploadStatusBagResponse> onDeleteUser(int id) async{
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_STAFF_DELETE +"$id";
    final responseJson = await delete(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return UploadStatusBagResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<DetailUserResponse> onGetDetailUser(int id)async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_USER_DETAIL +"$id";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return DetailUserResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<CreateAdminResponse> onCreateUser(CreateUserRequest request) async{
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_USER_CREATE;
    final body = json.encode(request);
    final responseJson = await post(url,body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return CreateAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorCreateAdminResponse.fromJson(responseJson.body);
  }
}