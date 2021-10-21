import 'dart:convert';
import 'package:viet_trung_mobile/data/models/user.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/request/auth_request.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/forgot_error_response.dart';
import 'package:viet_trung_mobile/data/response/register_response.dart';
import 'package:get/get.dart';
import 'auth_repository.dart';


class AuthImpl extends GetConnect implements AuthRepository {

  @override
  Future<User> onAuth(AuthRequest request, String url) async {
    final header = NetworkConfig.onBuildHeader();
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);

    if(responseJson.statusCode! >= 200 && responseJson.statusCode! < 300){
      print('responseJson 2 $responseJson');
      return User.fromJson(responseJson.body['data']);
    }
    throw ForgotErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ForgotPassResponse> onForgotPassWord(AuthRequest request, String url) async {
    final header = NetworkConfig.onBuildHeader();
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if(responseJson.statusCode! >= 200 && responseJson.statusCode! < 300){
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw ForgotErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<RegisterResponse> onRegister(AuthRequest request, String url)  async {
    final header = NetworkConfig.onBuildHeader();
    final body = json.encode(request);
    final responseJson = await post(url, body, headers: header);
    if(responseJson.statusCode! >= 200 && responseJson.statusCode! < 300){
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
    if(responseJson.statusCode! >= 200 && responseJson.statusCode! < 300){
      return ForgotPassResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }

}
