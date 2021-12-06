import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/bag_reponsitory/bag_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/list_bag_resoonse.dart';
import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';

class BagImpl extends GetConnect implements BagRepositories {
  @override
  Future<ListStatusBagResponse> onGetListBagStatus() async{
      final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.BAG_LIST_STATUS;
    final responseJson = await get(url, headers: header);
    if(responseJson.statusCode! >= 200 && responseJson.statusCode! < 300){
      return ListStatusBagResponse.fromJson(responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListWareHouseBackResponse> onGetListWarehouseback() async {
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.BAG_LIST_WAREHOUSE_BACK;
    final responseJson = await get(url, headers: header);
    if(responseJson.statusCode! >= 200 && responseJson.statusCode! < 300){
      return ListWareHouseBackResponse.fromJson(responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListBagResponse> onGetListBag(int page, int perPage) async{
    final header = await NetworkConfig.onBuildHeader();
    final url = NetworkConfig.BAG_LIST+"?&page=$page&per_page=$perPage";
    final responseJson = await get(url, headers: header);
    if(responseJson.statusCode! >= 200 && responseJson.statusCode! < 300){
      return ListBagResponse.fromJson(responseJson.body as Map<String, dynamic>);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

}