import 'package:viet_trung_mobile_admin/data/models/user.dart';
import 'package:viet_trung_mobile_admin/data/response/forgot_error_response.dart';

abstract class LoginContract {
  void onSuccess(User response);
  void onError(ForgotErrorResponse msg);
}
