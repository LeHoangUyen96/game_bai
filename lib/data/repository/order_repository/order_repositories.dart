import 'package:viet_trung_mobile/data/response/order_response.dart';

abstract class OrderRepositories {
  Future<OrderResponse> onGetListOrder();

}