import 'dart:convert';
import 'dart:io';

import 'package:viet_trung_mobile/data/network/network_client.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/data/request/change_pass_request.dart';
import 'package:viet_trung_mobile/data/request/edit_profile_request.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile/data/response/update_profile_response.dart';
import 'package:viet_trung_mobile/data/response/upload_images_response.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';

class ProfileImpl extends GetConnect implements ProfileRepositories {
  @override
  Future<ProfileResponse> onGetProfile() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.PROFILE_INFO;
    //final body = null;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ProfileResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<UpdateProfileResponse> onEditProfile(
      EditProfileRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.PROFILE_EDIT;
    final body = json.encode(request);
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return UpdateProfileResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  //Upload Image
  @override
  Future<String> onUploadImageProfile(List<File> image) async {
    final url = NetworkConfig.UPLOAD_IMAGE;
    final header = NetworkConfig.onBuildHeader(isMultipart: true);
    final responseJson = await NetworkClient.onPostFile(url,
        file: image[0], keyName: "image", header: header);

    final response = jsonDecode(responseJson.body);
    if (responseJson.statusCode == 201 || responseJson.statusCode == 200) {
      return response['data']['file'];
    }
    throw ErrorResponse.fromJson(response);
  }

  @override
  Future<UploadImagesResponse> onUploadAvatarProfile(String images) async {
    final url = NetworkConfig.PROFILE_UPLOAD_IMAGE;
    final header = NetworkConfig.onBuildHeader();
    Map data = {
      'avatar': images,
    };
    final responseJson = await post(url, data, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return UploadImagesResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onChangePass(ChangePassRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.changePass;
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
