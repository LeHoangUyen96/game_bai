import 'dart:convert';
import 'package:viet_trung_mobile_admin/data/models/user.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/request/auth_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/forgot_error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_response.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/register_step_1_response.dart';
import 'package:viet_trung_mobile_admin/data/response/register_step_2_response.dart';
import 'auth_repository.dart';

class AuthImpl extends GetConnect implements AuthRepository {
  @override
  Future<User> onAuth(AuthRequest request, String url) async {
    final header = NetworkConfig.onBuildHeader();
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);

    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      print('responseJson 2 $responseJson');
      return User.fromJson(responseJson.body['data']);
    }
    throw ForgotErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onForgotPassWord(
      AuthRequest request, String url) async {
    final header = NetworkConfig.onBuildHeader();
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ForgotErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<RegisterResponse> onRegister(AuthRequest request, String url) async {
    final header = NetworkConfig.onBuildHeader();
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RegisterResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onLogout() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.LOGOUT;
    final body = null;
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }

  @override
  Future<RegisterStep1Response> onRegisterStep1(
      AuthRequest request, String url) async {
    final header = NetworkConfig.onBuildHeader();
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RegisterStep1Response.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<RegisterStep2Response> onRegisterStep2(
      AuthRequest request, String url) async {
    final header = NetworkConfig.onBuildHeader();
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RegisterStep2Response.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
