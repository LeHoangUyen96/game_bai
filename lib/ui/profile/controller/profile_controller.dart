import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile/data/response/forgot_error_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/login/view/login_page.dart';
import 'package:viet_trung_mobile/ui/main/controller/main_controller.dart';
import 'package:viet_trung_mobile/ui/profile/contract/profile_contract.dart';
import 'package:viet_trung_mobile/ulti/key_storage/key_storage.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class ProfileController extends GetxController implements ProfileContract {
ProfileRepositories? profileRepositories;
AuthRepository? authRepository;
final tokens = GetStorage();
ProfileContract? contract;
GetProfileResponse ? mDataProfile;


@override
  void onInit() {
    super.onInit();
    authRepository = Injector().auth;
    profileRepositories =  Injector().profile;
    contract = this;
    onGetProfile();
  }


  void onGetProfile(){
    profileRepositories!.onGetProfile().then((value) {
      return contract!.onGetProfileSuccess(value);
    }).catchError((onError) {
      return contract!.onGetProfileError(onError);
    });
    update();
  }

  void onLogout() {
    Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    authRepository!.onLogout().then((value) {
      MainController controller = Get.find();
      controller.changeTabIndex(0);
      tokens.remove(KEY_TOKEN);
      Get.offAll(() => LoginPage());
      Get.snackbar(NOTIFY, value.message.toString());
      print(value.message.toString());
      update();
    }).catchError((onError) {
      Get.back();
      Get.snackbar(PROFILE_NOTIFY, onError.toString());
      print(onError.toString());
      update();
    });
  }

  @override
  void onGetProfileError(ForgotErrorResponse error) {
    // TODO: implement onGetProfileError
  }

  @override
  void onGetProfileSuccess(GetProfileResponse data) {
     mDataProfile = data;
    update();
  }

}