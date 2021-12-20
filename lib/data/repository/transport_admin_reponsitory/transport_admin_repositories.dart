import 'package:viet_trung_mobile_admin/data/request/add_transport_form_fee_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_product_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_transport_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/transport_admin_detail_response.dart';
import 'package:viet_trung_mobile_admin/data/response/transport_fee_detail_response.dart';

abstract class TransportAdminRepositories {
  Future<TransportFormAdminResponse> onGetListTransport();
  Future<TransportAdminDetailResponse> onGetTransportDetail(String id);
  Future<ForgotPassResponse> onDeleteTransport(String id);
  Future<ForgotPassResponse> onDeleteTransportFee(String id);
  Future<ListProductResponse> onGetListProduct();
  Future<ForgotPassResponse> onAddTransportFee(
      AddTransportFormFeeRequest request);
  Future<TransportFeeDetailResponse> onGetTransportFeeDetail(String id);
  Future<ForgotPassResponse> onUpdateTransportFee(
      String id, AddTransportFormFeeRequest request);
}
