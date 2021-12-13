import 'package:viet_trung_mobile/data/models/user.dart';
import 'package:viet_trung_mobile/data/response/forgot_error_response.dart';

abstract class LoginContract {
  void onSuccess(User response);
  void onError(ForgotErrorResponse msg);
}
