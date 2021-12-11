import 'package:viet_trung_mobile/data/request/rating_order_request.dart';
import 'package:viet_trung_mobile/data/response/list_rating_order_response.dart';
import 'package:viet_trung_mobile/data/response/rating_order_response.dart';

abstract class RatingOrderRepositories {
  Future<RatingOrderResponse> onRatingOrder(RatingOrderRequest request);
  Future<ListRatingOrderResponse> onGetListRatingOrder();

}