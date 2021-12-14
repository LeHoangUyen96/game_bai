import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/address_reponsitory/address_respositories.dart';
import 'package:viet_trung_mobile_admin/data/request/address_request.dart';
import 'package:viet_trung_mobile_admin/data/response/address_error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/address_response.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/city_response.dart';
import 'package:viet_trung_mobile_admin/data/response/district_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_address_response.dart';
import 'package:viet_trung_mobile_admin/data/response/wards_response.dart';

class AddressImpl extends GetConnect implements AddressRepository {
  @override
  Future<List<DataAddress>> onGetAddress() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.ADDRESSES;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return (responseJson.body['data'] as List)
          .map((e) => DataAddress.fromJson(e))
          .toList();
    }
    throw Exception(responseJson.body['message']);
  }

  @override
  Future<ForgotPassResponse> onDeleteAddress(int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.DELETE_ADDRESS + "/$id";
    final responseJson = await delete(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body['message']);
  }

  @override
  Future<List<DataCity>> onGetCity() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.CITY_ADDRESS;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return (responseJson.body['data'] as List)
          .map((e) => DataCity.fromJson(e))
          .toList();
    }
    throw Exception(responseJson.body['message']);
  }

  @override
  Future<List<DataDistrict>> onGetDistric(int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.DISTRICT_ADDRESS + "/$id";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return (responseJson.body['data'] as List)
          .map((e) => DataDistrict.fromJson(e))
          .toList();
    }
    throw Exception(responseJson.body['message']);
  }

  @override
  Future<List<DataWards>> onGetWards(int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.WARDS_ADDRESS + "/$id";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return (responseJson.body['data'] as List)
          .map((e) => DataWards.fromJson(e))
          .toList();
    }
    throw Exception(responseJson.body['message']);
  }

  @override
  Future<RegisterAddressResponse> onRegisterAddress(
      AddressRequest request) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.REGISTER_ADDRESS;
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RegisterAddressResponse.fromJson(responseJson.body);
    }
    throw AddressErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<RegisterAddressResponse> onUpdateAddress(
      AddressRequest request, int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.UPDATE_ADDRESS + "/$id";
    final body = json.encode(request);
    final responseJson = await put(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RegisterAddressResponse.fromJson(responseJson.body);
    }
    throw AddressErrorResponse.fromJson(responseJson.body);
  }
}
