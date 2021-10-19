import 'package:viet_trung_mobile/data/models/user.dart';
import 'package:viet_trung_mobile/data/request/auth_request.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/register_response.dart';

abstract class AuthRepository {
  Future<User> onAuth(AuthRequest request, String url);

  Future<ForgotPassResponse> onForgotPassWord(AuthRequest request, String url);

  Future<RegisterResponse> onRegister(AuthRequest request, String url);

  Future<ForgotPassResponse> onLogout();

}