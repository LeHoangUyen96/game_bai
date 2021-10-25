
import 'dart:io';

import 'package:viet_trung_mobile/data/request/edit_profile_request.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/profile_get_me_response.dart';

import 'package:viet_trung_mobile/data/response/profile_response.dart';
import 'package:viet_trung_mobile/data/response/update_profile_response.dart';
import 'package:viet_trung_mobile/data/response/upload_images_response.dart';


abstract class ProfileRepositories {
  //Future<ProfileResponse> onGetProfile();
  Future<UpdateProfileResponse> onEditProfile(EditProfileRequest request);
  Future<String> onUploadImageProfile(List<File> request);
  Future<UploadImagesResponse> onUploadAvatarProfile(String images);
  Future<ForgotPassResponse> onChangePassword (String oldPass, String newPass, String confirmPass);

  Future<GetProfileResponse> onGetProfile();

}