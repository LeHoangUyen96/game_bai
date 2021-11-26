import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/find_user_reponsitory/find_user_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/find_user_reponse.dart';

class FindUserImpl extends GetConnect implements FindUserRepositories {

  @override
  Future<FindUserResponse> onGetFindUser(String valueSearch) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.FIND_USER + "?value_search=$valueSearch";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return FindUserResponse.fromJson(responseJson.body);
    }
    throw FindUserResponse.fromJson(responseJson.body);
  }

 
}