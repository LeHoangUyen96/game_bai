import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';

abstract class OrderAdminRepositories {
  Future<OrderOwnerlessResponse> onGetListOrderOwnerless();
}
