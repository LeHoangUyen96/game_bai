import 'dart:async';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/auth_repository/auth_repository.dart';

class ForgotStepOneController extends GetxController {
  late AuthRepository authRepository;

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
    authRepository = Injector().auth;
    startTimeout();
  }
}
