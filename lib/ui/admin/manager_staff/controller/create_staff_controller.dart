import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/manager_staff_reponsitory/manager_staff_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/repository/role_admin_reponsitory/role_admin_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/request/create_admin_request.dart';
import 'package:viet_trung_mobile_admin/data/response/errors_create_admin.dart';
import 'package:viet_trung_mobile_admin/data/response/list_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/create_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_role_response.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_staff/contract/manager_staff_contract.dart';
import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class CreateStaffController extends GetxController
    implements ManagerStaffContract {
  TextEditingController userCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isUserCodeValid = true;
  bool isPhoneValid = true;
  bool isNameValid = true;
  bool isEmailValid = true;
  String userCodeError = "";
  String phoneError = "";
  String nameError = "";
  String emailError = "";
  RoleResponse? roleResponse;
  List<DataRole>? mDataRole = [];
  RoleAdminRepositories? roleAdminRepositories;
  ManagerStaffRepositories? managerStaffRepositories;
  ManagerStaffContract? contract;
  int? role_id;
  @override
  void onInit() {
    super.onInit();
    roleAdminRepositories = Injector().role;
    managerStaffRepositories = Injector().managerStaff;
    onGetListRole();
    contract = this;
  }

  Future<List<DataRole>> onGetListRole() async {
    roleAdminRepositories!.onGetListRole().then((value) {
      roleResponse = value;
      mDataRole!.addAll(roleResponse!.data!);
      update();
    }).catchError((onError) {});
    return mDataRole!;
  }

  void onCreateAdmin() {
    if (emailController.text.isEmpty) {
      isEmailValid = false;
      emailError = "Email không được để trống";
    } else if (!GetUtils.isEmail(emailController.text)) {
      isEmailValid = false;
      emailError = "Email không đúng định dạng";
    } else {
      isEmailValid = true;
    }
    if (phoneController.text.length < 9 || phoneController.text.length > 11) {
      isPhoneValid = false;
      phoneError = "Số điện thoại không được để trống";
    } else {
      isPhoneValid = true;
    }
    if (nameController.text.isEmpty) {
      isNameValid = false;
      nameError = "Họ và tên không được để trống";
    } else {
      isNameValid = true;
    }
    if (userCodeController.text.isEmpty) {
      isUserCodeValid = false;
      userCodeError = "Mã nhân viên không được để trống";
    } else {
      isUserCodeValid = true;
    }
    if (isEmailValid && isPhoneValid && isNameValid && isUserCodeValid) {
      CreateAdminRequest _request = CreateAdminRequest(
        email: emailController.text,
        phone: phoneController.text,
        name: nameController.text,
        role_id: role_id,
        user_code: userCodeController.text,
      );
      managerStaffRepositories!.onCreateAdmin(_request).then((value) {
        // Get.back(result: true);
        Get.snackbar(NOTIFY, value.message.toString());
        update();
      }).catchError((onError) {
        //Get.snackbar("Notification", "Failllllllllll");
        return contract!.onCreateAdminAdminError(onError);
      });
    }
    update();
  }

  @override
  void onCreateAdminAdminError(ErrorCreateAdminResponse msg) {
    if (msg.error!.phone!.toList().isNotEmpty) {
      isPhoneValid = false;
      phoneError = msg.error!.phone![0].toString();
      update();
    } else {
      isPhoneValid = true;
      update();
    }

    if (msg.error!.email!.toList().isNotEmpty) {
      isEmailValid = false;
      emailError = msg.error!.email![0].toString();
      update();
    } else {
      isEmailValid = true;
      update();
    }
    if (msg.error!.user_code!.toList().isNotEmpty) {
      isUserCodeValid = false;
      userCodeError = msg.error!.user_code![0].toString();
      update();
    } else {
      isUserCodeValid = true;
      update();
    }
    if (msg.error!.name!.toList().isNotEmpty) {
      isNameValid = false;
      nameError = msg.error!.name![0].toString();
      update();
    } else {
      isNameValid = true;
      update();
    }
    update();
  }

  @override
  void onCreateAdminSuccess(CreateAdminResponse data) {}

  @override
  void onGetListAdminError(ErrorResponse error) {
    // TODO: implement onGetListAdminError
  }

  @override
  void onGetListAdminSuccess(ListAdminResponse data) {
    // TODO: implement onGetListAdminSuccess
  }
}
