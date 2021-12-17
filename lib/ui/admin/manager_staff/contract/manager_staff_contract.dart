import 'package:viet_trung_mobile_admin/data/response/create_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/errors_create_admin.dart';
import 'package:viet_trung_mobile_admin/data/response/list_admin_response.dart';

abstract class ManagerStaffContract {
  void onGetListAdminSuccess(ListAdminResponse data);
  void onGetListAdminError(ErrorResponse error);
  void onCreateAdminSuccess(CreateAdminResponse data);
  void onCreateAdminAdminError(ErrorCreateAdminResponse error);
}
