import 'dart:io';
import 'package:viet_trung_mobile_admin/data/request/change_pass_request.dart';
import 'package:viet_trung_mobile_admin/data/request/edit_profile_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile_admin/data/response/update_profile_response.dart';
import 'package:viet_trung_mobile_admin/data/response/upload_images_response.dart';

abstract class ProfileRepositories {
  Future<UpdateProfileResponse> onEditProfile(EditProfileRequest request);
  Future<String> onUploadImageProfile(List<File> request);
  Future<UploadImagesResponse> onUploadAvatarProfile(String images);
  Future<ForgotPassResponse> onChangePass(ChangePassRequest request);
  Future<ProfileResponse> onGetProfile();
}
