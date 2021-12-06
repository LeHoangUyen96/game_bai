import 'package:viet_trung_mobile/data/response/list_bag_resoonse.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';

abstract class BagRepositories {
  Future<ListWareHouseBackResponse> onGetListWarehouseback();
  Future<ListStatusBagResponse> onGetListBagStatus();
  Future<ListBagResponse> onGetListBag(int page, int perPage);

}
