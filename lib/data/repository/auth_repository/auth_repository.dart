import 'package:viet_trung_mobile/data/models/user.dart';
import 'package:viet_trung_mobile/data/request/auth_request.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/register_response.dart';
import 'package:viet_trung_mobile/data/response/register_step_1_response.dart';
import 'package:viet_trung_mobile/data/response/register_step_2_response.dart';

abstract class AuthRepository {
  Future<User> onAuth(AuthRequest request, String url);

  Future<ForgotPassResponse> onForgotPassWord(AuthRequest request, String url);

  Future<RegisterResponse> onRegister(AuthRequest request, String url);

  Future<ForgotPassResponse> onLogout();
  Future<RegisterStep1Response> onRegisterStep1(AuthRequest request, String url);
  Future<RegisterStep2Response> onRegisterStep2(AuthRequest request, String url);

}