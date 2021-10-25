import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/ui/auth/login/controller/login_controller.dart';
import 'package:viet_trung_mobile/ui/auth/register/controller/register_controller.dart';
import 'package:viet_trung_mobile/ui/home/controller/home_controller.dart';
import 'package:viet_trung_mobile/ui/main/controller/main_controller.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile/ui/splash/controller/splash_controller.dart';
import 'package:viet_trung_mobile/ui/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await Firebase.initializeApp(); //wait for add google-services.json
  runApp(_app());
}

Widget _app() => LayoutBuilder(
  builder: (context, constraints) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: MAIN_COLOR,
          ),
          initialBinding: _Binding(),
        );
      },
    );
  },
);

class _Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
