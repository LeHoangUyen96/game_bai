import 'dart:async';

import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/contract/forgotpasss_contract.dart';

class ForgotStepOneController extends GetxController  {


  late AuthRepository _authRepository;

  String? mesenger;
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 200;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  void startTimeout() {
    var duration = interval;
    Timer.periodic(duration, (timer) {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      
    });
    timerText;
    update();
  }


  @override
  void onInit() {
    super.onInit();
    _authRepository = Injector().auth;
    startTimeout();
  }


  

}