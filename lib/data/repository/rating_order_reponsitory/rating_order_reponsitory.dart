import 'package:viet_trung_mobile_admin/data/request/rating_order_request.dart';
import 'package:viet_trung_mobile_admin/data/response/list_rating_order_response.dart';
import 'package:viet_trung_mobile_admin/data/response/rating_order_response.dart';

abstract class RatingOrderRepositories {
  Future<RatingOrderResponse> onRatingOrder(RatingOrderRequest request);
  Future<ListRatingOrderResponse> onGetListRatingOrder();
}
