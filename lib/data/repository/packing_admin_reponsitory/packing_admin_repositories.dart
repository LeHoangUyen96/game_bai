import 'package:viet_trung_mobile_admin/data/request/add_packing_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_transport_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/packing_detail_response.dart';

abstract class PackingAdminRepositories {
  Future<TransportFormAdminResponse> onGetListPacking();
  Future<ForgotPassResponse> onAddPacking(AddPackingRequest request);
  Future<ForgotPassResponse> onDeletePacking(String id);
  Future<PackingDetailResponse> onGetPackingDetail(String id);
  Future<ForgotPassResponse> onUpdatePacking(
      String id, AddPackingRequest request);
}
