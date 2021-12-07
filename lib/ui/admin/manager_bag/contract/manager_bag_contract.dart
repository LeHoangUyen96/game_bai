import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/list_bag_resoonse.dart';

abstract class ManagerBagContract{
   void onGetListBagSuccess(ListBagResponse data);
   void onGetListBagError(ErrorResponse error);
}