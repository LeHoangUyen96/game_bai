import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/network/network_client.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_staff_reponsitory/manager_staff_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/request/update_admin_request.dart';
import 'package:viet_trung_mobile_admin/data/response/create_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/request/create_admin_request.dart';
import 'package:viet_trung_mobile_admin/data/response/detail_staff_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/errors_create_admin.dart';
import 'package:viet_trung_mobile_admin/data/response/errors_enter_warehouse.dart';
import 'package:viet_trung_mobile_admin/data/response/list_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/update_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/update_status_bag_response.dart';
import 'package:viet_trung_mobile_admin/data/response/upload_images_response.dart';

class ManagerStaffImpl extends GetConnect implements ManagerStaffRepositories {
  @override
  Future<ListAdminResponse> onGetListAdmin(int page, int perPage) async {
    final header = NetworkConfig.onBuildHeader();
    final url =
        NetworkConfig.MANAGER_STAFF_LIST + "?&page=$page&per_page=$perPage";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListAdminResponse> onSearchListAdmin(
      String search_name_phone, int page, int perPage) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_STAFF_LIST +
        "?search_name_phone=$search_name_phone";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<DetailStaffResponse> onGetDetailAdmin(int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_STAFF_DETAIL + "$id";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return DetailStaffResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<UploadStatusBagResponse> onDeleteAdmin(int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_STAFF_DELETE + "$id";
    final responseJson = await delete(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return UploadStatusBagResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<UploadStatusBagResponse> onChangeStatusAdmin(
      int id, int status) async {
    final url = NetworkConfig.MANAGER_STAFF_CHANGE_STATUS + "$id";
    final header = await NetworkConfig.onBuildHeader();
    Map data = {"status": status};
    final responseJson = await post(url, data, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return UploadStatusBagResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<CreateAdminResponse> onCreateAdmin(CreateAdminRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_STAFF_CREATE;
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return CreateAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorCreateAdminResponse.fromJson(responseJson.body);
  }

  @override
  Future<bool> onResetPasswordAdmin(int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_USER_RESET_PASSWORD + "$id";
    //final body = json.encode(request);
    final responseJson = await post(url, {}, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return true;
    }
    throw ErrorCreateAdminResponse.fromJson(responseJson.body);
  }

  @override
  Future<UploadAdminResponse> onUpdateAdmin(
      UpdateAdminRequest request, int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.MANAGER_STAFF_UPDATE + "$id";
    final body = json.encode(request);
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return UploadAdminResponse.fromJson(responseJson.body);
    }
    throw ErrorCreateAdminResponse.fromJson(responseJson.body);
  }

  @override
  Future<String> onUploadAvatarStaff(List<File> image) async {
    final url = NetworkConfig.UPLOAD_IMAGE;
    final header = await NetworkConfig.onBuildHeader(isMultipart: true);
    final responseJson = await NetworkClient.onPostFile(url,
        file: image[0], keyName: "image", header: header);

    final response = jsonDecode(responseJson.body);
    if (responseJson.statusCode == 201 || responseJson.statusCode == 200) {
      return response['data']['file'];
    }
    throw ErrorResponse.fromJson(response);
  }
}
