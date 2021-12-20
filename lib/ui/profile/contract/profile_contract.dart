import 'package:viet_trung_mobile_admin/data/response/errors_response.dart';
import 'package:viet_trung_mobile_admin/data/response/profile_get_me_response.dart';

abstract class ProfileContract {
  void onGetProfileSuccess(ProfileResponse data);
  void onGetProfileError(ErrorsResponse error);
}
