import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/data/request/edit_profile_request.dart';
import 'package:viet_trung_mobile/data/response/errors_response.dart';
import 'package:viet_trung_mobile/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/profile/contract/profile_contract.dart';

class EditProfileAdminController extends GetxController
    implements ProfileContract {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  ProfileRepositories? profileRepositories;
  ProfileContract? contract;
  ProfileResponse? mDataProfile;
  bool nameValid = true;
  bool phoneValid = true;
  bool emailValid = true;
  String? nameError;
  String? phoneError;
  String? emailError;

  @override
  void onInit() {
    super.onInit();
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

  @override
  void onGetProfileError(ErrorsResponse error) {
    Get.snackbar(NOTIFY, error.message.toString());
    update();
  }

  @override
  void onGetProfileSuccess(ProfileResponse data) {
    mDataProfile = data;
    nameController = TextEditingController(text: data.data!.name!);
    phoneController = TextEditingController(text: data.data!.phone!.toString());
    emailController = TextEditingController(text: data.data!.email!);
    update();
  }

  void onUpdateProfile() {
    if (nameController.text.isEmpty) {
      nameValid = false;
      nameError = ERROR_NAME;
    } else {
      nameValid = true;
    }

    if (emailController.text.isEmpty) {
      emailValid = false;
      emailError = ERROR_MAIL;
    } else {
      emailValid = true;
    }

    if (phoneController.text.isEmpty) {
      phoneValid = false;
      phoneError = ERROR_PHONE;
    } else {
      phoneValid = true;
    }

    if (emailValid && nameValid && phoneValid) {
      EditProfileRequest request = EditProfileRequest(
        email: emailController.text,
        name: nameController.text,
        phone: phoneController.text,
      );
      profileRepositories!.onEditProfile(request).then((value) {
        Get.snackbar('Thông báo', value.message!);
        update();
      }).catchError((onError) {
        update();
      });
    }
    update();
  }
}
