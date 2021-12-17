import 'package:viet_trung_mobile/data/request/create_bag_request.dart';
import 'package:viet_trung_mobile/data/request/list_order_add_bag_request.dart';
import 'package:viet_trung_mobile/data/request/manager_bag_filter_request.dart';
import 'package:viet_trung_mobile/data/request/update_status_detail_bag_request.dart';
import 'package:viet_trung_mobile/data/response/bag_details_response.dart';
import 'package:viet_trung_mobile/data/response/create_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_bag_resoonse.dart';
import 'package:viet_trung_mobile/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';
import 'package:viet_trung_mobile/data/response/update_status_bag_response.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/manager_bag_page.dart';

abstract class BagRepositories {
  Future<ListWareHouseBackResponse> onGetListWarehouseback();
  Future<ListStatusBagResponse> onGetListBagStatus();
  Future<ListBagResponse> onGetListBag(int page, int perPage);
  Future<ListBagResponse> onSearchListBag(
      ManagerBagRequest request, int page, int perPage);
  Future<ListBagResponse> onFilterListBag(String code, int page, int perPage);
  Future<BagDetailsResponse> onGetDetailsBag(int id);
  Future<UploadStatusBagResponse> onUpdateSatusBag(String parent_pack_status_code,int id);
  Future<ListOrderAddBagResponse> onGetListOrderAddBag(ListOrderAddBagRequest request);
  Future<ListOrderAddBagResponse> onSearchBillCode( String bill_code, String warehouse_back_code ,int transport_form_id  );
  Future<CreateBagResponse> onCreateBag(CreateBagRequest request);
}
