import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/errors_response.dart';
import 'package:viet_trung_mobile_admin/data/response/profile_get_me_response.dart';
import 'dart:io';

abstract class ProfileContract {
  void onGetProfileSuccess(ProfileResponse data);
  void onGetProfileError(ErrorsResponse error);
  void onUploadImageSuccess(File file);
  void onUploadImageError(ErrorResponse error);

  void onUpdateAvatarSuccess(String image);
  void onUpdateAvatarError(ErrorResponse error);
}
