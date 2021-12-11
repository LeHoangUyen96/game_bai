import 'dart:convert';

import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/repository/rating_order_reponsitory/rating_order_reponsitory.dart';
import 'package:viet_trung_mobile/data/request/rating_order_request.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/errors_response.dart';
import 'package:viet_trung_mobile/data/response/list_rating_order_response.dart';
import 'package:viet_trung_mobile/data/response/rating_order_response.dart';

class RatingOrderImpl extends GetConnect implements RatingOrderRepositories {
  @override
  Future<RatingOrderResponse> onRatingOrder(RatingOrderRequest request) async{
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.RATING_ORDER;
    final body = jsonEncode(request);
    final responseJson = await post(url,body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return RatingOrderResponse.fromJson(responseJson.body);
    }
    throw ErrorsResponse.fromJson(responseJson.body);
  }

  @override
  Future<ListRatingOrderResponse> onGetListRatingOrder() async{
     final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.RATING_ORDER_LIST ;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ListRatingOrderResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}