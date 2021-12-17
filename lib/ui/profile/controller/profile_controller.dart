import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile_admin/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile_admin/data/response/errors_response.dart';
import 'package:viet_trung_mobile_admin/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/auth/login/view/login_page.dart';
import 'package:viet_trung_mobile_admin/ui/profile/contract/profile_contract.dart';
import 'package:viet_trung_mobile_admin/ulti/key_storage/key_storage.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';

class ProfileController extends GetxController implements ProfileContract {
  ProfileRepositories? profileRepositories;
  AuthRepository? authRepository;
  final tokens = GetStorage();
  final isAdmin = GetStorage();
  ProfileContract? contract;
  ProfileResponse? mDataProfile;

  @override
  void onInit() {
    super.onInit();
    authRepository = Injector().auth;
    profileRepositories = Injector().profile;
    contract = this;
    onGetProfile();
  }

  void onGetProfile() {
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
      tokens.remove(KEY_TOKEN);
      GetStorage().remove(KEY_ADMIN);
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
  void onGetProfileError(ErrorsResponse error) {
    Get.snackbar(NOTIFY, error.message.toString());
    update();
  }

  @override
  void onGetProfileSuccess(ProfileResponse data) {
    mDataProfile = data;
    update();
  }
}
