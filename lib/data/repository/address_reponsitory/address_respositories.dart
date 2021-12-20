import 'package:viet_trung_mobile_admin/data/request/address_request.dart';
import 'package:viet_trung_mobile_admin/data/response/address_response.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/city_response.dart';
import 'package:viet_trung_mobile_admin/data/response/district_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_address_response.dart';
import 'package:viet_trung_mobile_admin/data/response/wards_response.dart';

abstract class AddressRepository {
  Future<List<DataAddress>> onGetAddress();
  Future<ForgotPassResponse> onDeleteAddress(int id);
  Future<List<DataCity>> onGetCity();
  Future<List<DataDistrict>> onGetDistric(int id);
  Future<List<DataWards>> onGetWards(int id);
  Future<RegisterAddressResponse> onRegisterAddress(AddressRequest request);
  Future<RegisterAddressResponse> onUpdateAddress(
      AddressRequest request, int id);
}
