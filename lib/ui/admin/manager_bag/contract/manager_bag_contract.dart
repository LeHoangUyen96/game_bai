import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_bag_resoonse.dart';

abstract class ManagerBagContract {
  void onGetListBagSuccess(ListBagResponse data);
  void onGetListBagError(ErrorResponse error);
}
