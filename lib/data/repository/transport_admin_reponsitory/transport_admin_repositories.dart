import 'package:viet_trung_mobile/data/request/update_role_request.dart';
import 'package:viet_trung_mobile/data/response/auth_response.dart';
import 'package:viet_trung_mobile/data/response/list_transport_admin_response.dart';
import 'package:viet_trung_mobile/data/response/transport_admin_detail_response.dart';

abstract class TransportAdminRepositories {
  Future<TransportFormAdminResponse> onGetListTransport();
  Future<TransportAdminDetailResponse> onGetTransportDetail(String id);
  Future<ForgotPassResponse> onDeleteTransport(String id);
}
