import 'package:viet_trung_mobile/data/request/confirm_order_wait_confirm_request.dart';
import 'package:viet_trung_mobile/data/request/update_fee_warhouse_china.dart';
import 'package:viet_trung_mobile/data/request/update_order_no_transport.dart';
import 'package:viet_trung_mobile/data/request/verifi_order_ownerless.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile/data/response/order_admin_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/search_customer_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';

abstract class OrderAdminRepositories {
  Future<OrderAdminResponse> onGetListOrderOwnerless();
  Future<SearchCustomerResponse> onGetListSearchCustomer(String valueSearch);
  Future<PackingFormResponse> onGetListPackingForm();
  Future<TransportFormResponse> onGetListTransportForm();
  Future<OrderAdminResponse> onGetListOrderValidShipBack();
  Future<OrderAdminResponse> onGetListOrderValidStorage();
  Future<ForgotPassResponse> onVerifiOrderOwnerless(
      VerifiOrderOwnerlessRequest rquest);
  Future<ForgotPassResponse> onVerifiOrder(VerifiOrderConfirmRequest rquest);
  Future<OrderAdminResponse> onGetListOrderNoTransport();
  Future<OrderAdminResponse> onGetListOrderWaitConfirm();
  Future<OrderAdminDetailResponse> onGetOrderDetail(String id);
  Future<ForgotPassResponse> onConfirmOrderWaitConfirm(
      VerifiOrderWaitConfirmRequest request);
  Future<ForgotPassResponse> onUpdateFeeWarhouseChina(
      UpdateFeeWarhouseChina request, String id);
  Future<OrderAdminResponse> onGetListOrderShipped();
  Future<ForgotPassResponse> onUpdateOrderNoTransport(
      UpdateOrderNoTransport request, String id);
}
