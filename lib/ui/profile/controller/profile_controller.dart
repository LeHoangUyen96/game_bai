import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/auth_repository/auth_repository.dart';
import 'package:viet_trung_mobile_admin/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile_admin/data/response/admin_add_image_enter_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/errors_response.dart';
import 'package:viet_trung_mobile_admin/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/auth/login/view/login_page.dart';
import 'package:viet_trung_mobile_admin/ui/profile/contract/profile_contract.dart';
import 'package:viet_trung_mobile_admin/ulti/helper/handle_image.dart';
import 'package:viet_trung_mobile_admin/ulti/key_storage/key_storage.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController implements ProfileContract {
  ProfileRepositories? profileRepositories;
  AuthRepository? authRepository;
  final tokens = GetStorage();
  final isAdmin = GetStorage();
  ProfileContract? contract;
  ProfileResponse? mDataProfile;
  List<File>? images;
  String? path;

  @override
  void onInit() {
    super.onInit();
    authRepository = Injector().auth;
    profileRepositories = Injector().profile;
    contract = this;
    images = <File>[];
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

  void onUpLoadImage() {
    profileRepositories!.onUploadImageProfile(images!).then((response) {
      profileRepositories!.onUploadAvatarProfile(response).then((response) {
        onGetProfile();
        update();
        Get.snackbar(NOTIFY, response.message!);
      }).catchError((onError) {
        return onError;
      });
    }).catchError((onError) {
      contract!.onUploadImageError(onError);
    });
  }

  void onPickerImage(ImageSource imageSource) {
    HandleImage().pickerImage(imageSource).then((value) {
      images!.add(value!);
      onUpLoadImage();
      Get.back(result: images);
      update();
    }).catchError((onError) {
      Get.back();
    });
  }

  @override
  void onUploadImageError(ErrorResponse error) {}

  @override
  void onUploadImageSuccess(File file) {}

  @override
  void onUpdateAvatarSuccess(String image) {
    path = image;
    update();
  }

  @override
  void onUpdateAvatarError(ErrorResponse error) {
    path = error.message;
    update();
  }
}
