import 'package:viet_trung_mobile/data/response/create_admin_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/errors_create_admin.dart';
import 'package:viet_trung_mobile/data/response/list_user_response.dart';

abstract class ManagerUserContract{
   void onGetListUserSuccess(ListUserResponse data);
   void onGetListUserError(ErrorResponse error);
   void onCreateUserSuccess(CreateAdminResponse data);
   void onCreatetUserError(ErrorCreateAdminResponse error);
}