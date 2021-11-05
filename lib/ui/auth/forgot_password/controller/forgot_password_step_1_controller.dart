import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/contract/forgotpasss_contract.dart';

class ForgotStepOneController extends GetxController  {


  late AuthRepository _authRepository;

  String? mesenger;

  @override
  void onInit() {
    super.onInit();
    _authRepository = Injector().auth;
  }


  

}