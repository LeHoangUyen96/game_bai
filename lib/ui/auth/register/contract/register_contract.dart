import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_address_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_step_1_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_step_2_response.dart';

abstract class RegisterContract {
  void onSuccess(RegisterResponse response);
  void onError(ErrorResponse msg);
  void onSuccessGetAddress(RegisterAddressResponse response);
  void onSuccessRegisterStep1(RegisterStep1Response response);
  void onSuccessRegisterStep2(RegisterStep2Response response);
}
