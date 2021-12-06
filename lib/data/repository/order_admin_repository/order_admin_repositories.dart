import 'package:viet_trung_mobile/data/request/verifi_order_ownerless.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';

abstract class OrderAdminRepositories {
  Future<OrderOwnerlessResponse> onGetListOrderOwnerless();
  Future<SearchCustomerResponse> onGetListSearchCustomer(String valueSearch);
  Future<PackingFormResponse> onGetListPackingForm();
  Future<TransportFormResponse> onGetListTransportForm();
  Future<OrderOwnerlessResponse> onGetListOrderValidShipBack();
  Future<OrderOwnerlessResponse> onGetListOrderValidStorage();
  Future<ForgotPassResponse> onVerifiOrderOwnerless(
      VerifiOrderOwnerlessRequest rquest);
  Future<ForgotPassResponse> onVerifiOrder(VerifiOrderConfirmRequest rquest);
  Future<OrderOwnerlessResponse> onGetListOrderNoTransport();
  Future<OrderOwnerlessResponse> onGetListOrderWaitConfirm();
}
