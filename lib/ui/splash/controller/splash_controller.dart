import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/ui/auth/login/view/login_page.dart';
import 'package:viet_trung_mobile/ui/main/view/main_page.dart';
import 'package:viet_trung_mobile/ulti/key_storage/key_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {

  ProfileRepositories? profileRepositories;

  @override
  void onInit() {
    super.onInit();
    //profileRepositories = Injector().profile;
    onEndSplash();
  }

  onEndSplash() {
    String? token = GetStorage().read(KEY_TOKEN);

    // profileRepositories!.onGetProfile().then((value){
    //   Future.delayed(Duration(seconds: 3), () {
    //     Get.offAll(() => MainPage());
    //   });
    //
    // }).catchError((onError){
    //   Future.delayed(Duration(seconds: 3), () {
    //     Get.offAll(() => LoginPage());
    //   });
    // });

    Future.delayed(Duration(seconds: 3), () {
      //if token != null => MainPage, this one is just for testing
      if(token != null) {
        Get.offAll(() => MainPage());
      } else {
        Get.offAll(() => LoginPage());
      }
          });
  }


}