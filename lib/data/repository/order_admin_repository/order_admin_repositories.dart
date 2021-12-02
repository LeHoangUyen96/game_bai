import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';

abstract class OrderAdminRepositories {
  Future<OrderOwnerlessResponse> onGetListOrderOwnerless();
  Future<SearchCustomerResponse> onGetListSearchCustomer(String valueSearch);
  Future<PackingFormResponse> onGetListPackingForm();
  Future<TransportFormResponse> onGetListTransportForm();
}
