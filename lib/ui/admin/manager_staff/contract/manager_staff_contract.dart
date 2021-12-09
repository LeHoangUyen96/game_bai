import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/list_admin_response.dart';

abstract class ManagerStaffContract{
   void onGetListAdminSuccess(ListAdminResponse data);
   void onGetListAdminError(ErrorResponse error);
}