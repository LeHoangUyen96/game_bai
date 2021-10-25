import 'package:viet_trung_mobile/data/response/forgot_error_response.dart';
import 'package:viet_trung_mobile/data/response/profile_get_me_response.dart';

abstract class ProfileContract {
  void onGetProfileSuccess(GetProfileResponse data);
  void onGetProfileError(ForgotErrorResponse error);
}