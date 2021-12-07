import 'package:viet_trung_mobile/data/request/manager_bag_filter_request.dart';
import 'package:viet_trung_mobile/data/response/bag_details_response.dart';
import 'package:viet_trung_mobile/data/response/list_bag_resoonse.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/manager_bag_page.dart';

abstract class BagRepositories {
  Future<ListWareHouseBackResponse> onGetListWarehouseback();
  Future<ListStatusBagResponse> onGetListBagStatus();
  Future<ListBagResponse> onGetListBag(int page, int perPage);
  Future<ListBagResponse> onSearchListBag(ManagerBagRequest request,int page, int perPage);
  Future<ListBagResponse> onFilterListBag(String code,int page, int perPage);
  Future<BagDetailsResponse> onGetDetailsBag(int id);
}
