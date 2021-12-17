import 'package:viet_trung_mobile_admin/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile_admin/ui/auth/login/view/login_page.dart';
import 'package:viet_trung_mobile_admin/ui/main/view/main_page_admin.dart';
import 'package:viet_trung_mobile_admin/ulti/key_storage/key_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  ProfileRepositories? profileRepositories;

  @override
  void onInit() {
    super.onInit();
    onEndSplash();
  }

  onEndSplash() {
    String? token = GetStorage().read(KEY_TOKEN);
    Future.delayed(Duration(seconds: 3), () {
      if (token != null) {
        Get.offAll(() => MainPageAdmin());
      } else {
        Get.offAll(() => LoginPage());
      }
    });
  }
}
