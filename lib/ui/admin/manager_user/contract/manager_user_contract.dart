import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/list_user_response.dart';

abstract class ManagerUserContract{
   void onGetListUserSuccess(ListUserResponse data);
   void onGetListUserError(ErrorResponse error);
}