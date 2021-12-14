import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile_admin/data/request/list_order_add_bag_request.dart';
import 'package:viet_trung_mobile_admin/data/request/manager_bag_filter_request.dart';
import 'package:viet_trung_mobile_admin/data/request/update_status_detail_bag_request.dart';
import 'package:viet_trung_mobile_admin/data/response/bag_details_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_bag_resoonse.dart';
import 'package:viet_trung_mobile_admin/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_warehouse_back_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile_admin/data/response/update_status_bag_response.dart';

class BagImpl extends GetConnect implements BagRepositories {
  @override
  Future<ListStatusBagResponse> onGetListBagStatus() async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.BAG_LIST_STATUS;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListStatusBagResponse.fromJson(
          responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListWareHouseBackResponse> onGetListWarehouseback() async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.BAG_LIST_WAREHOUSE_BACK;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListWareHouseBackResponse.fromJson(
          responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListBagResponse> onGetListBag(int page, int perPage) async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.BAG_LIST + "?&page=$page&per_page=$perPage";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListBagResponse.fromJson(
          responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListBagResponse> onSearchListBag(
      ManagerBagRequest request, int page, int perPage) async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.BAG_LIST +
        "?page=$page&per_page=$perPage" +
        (request.code != null ? "&code=${request.code}" : '') +
        (request.from_date == null ? "&from_date=${request.from_date}" : '') +
        (request.to_date == null ? "&to_date=${request.to_date}" : '') +
        (request.transport_form_id != null
            ? "&transport_form_id=${request.transport_form_id}"
            : '') +
        (request.parent_pack_status_code != null
            ? "&parent_pack_status_code=${request.parent_pack_status_code}"
            : '') +
        (request.sort != null ? "&sort=${request.sort}" : '');
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListBagResponse.fromJson(
          responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListBagResponse> onFilterListBag(
      String code, int page, int perPage) async {
    final header = await NetworkConfig.onBuildHeader();
    final url =
        NetworkConfig.BAG_LIST + "?page=$page&per_page=$perPage&code=$code";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListBagResponse.fromJson(
          responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<BagDetailsResponse> onGetDetailsBag(int id) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.BAG_DETAIL + "$id";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return BagDetailsResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<UploadStatusBagResponse> onUpdateSatusBag(
      String parent_pack_status_code, int id) async {
    final url = NetworkConfig.BAG_UPDATE_STATUS + "$id";

    final header = await NetworkConfig.onBuildHeader();
    Map data = {
      'parent_pack_status_code': parent_pack_status_code,
    };
    final responseJson = await put(url, data, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return UploadStatusBagResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListOrderAddBagResponse> onGetListOrderAddBag(
      ListOrderAddBagRequest request) async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.BAG_LIST_ORDER +
        "?" +
        (request.warehouse_back_code != null
            ? "&warehouse_back_code=${request.warehouse_back_code}"
            : '') +
        (request.transport_form_id != null
            ? "&transport_form_id=${request.transport_form_id}"
            : '');
    // + (request.user_id != null ? "&user_id=${request.user_id}" : '')
    // + (request.bill_code != null ? "&bill_code=${request.bill_code}" : '');
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListOrderAddBagResponse.fromJson(
          responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}
