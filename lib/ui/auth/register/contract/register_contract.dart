
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/register_address_response.dart';
import 'package:viet_trung_mobile/data/response/register_response.dart';

abstract class RegisterContract {

  void onSuccess(RegisterResponse response);
  void onError(ErrorResponse msg);
  void onSuccessGetAddress(RegisterAddressResponse response);
}