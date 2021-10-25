import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/forgot_error_response.dart';

abstract class ForgotPassContract {
  void onSuccess(ForgotPassResponse response);
  void onError(ForgotErrorResponse msg);
}