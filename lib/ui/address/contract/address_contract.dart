import 'package:viet_trung_mobile/data/response/address_error_response.dart';
import 'package:viet_trung_mobile/data/response/register_address_response.dart';

abstract class AddressContract{
  void onSuccess(RegisterAddressResponse response);
  void onError(AddressErrorResponse msg);
}