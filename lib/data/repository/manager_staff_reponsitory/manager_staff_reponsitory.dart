import 'package:viet_trung_mobile/data/request/create_admin_request.dart';
import 'package:viet_trung_mobile/data/response/create_admin_response.dart';
import 'package:viet_trung_mobile/data/response/detail_staff_response.dart';
import 'package:viet_trung_mobile/data/response/list_admin_response.dart';
import 'package:viet_trung_mobile/data/response/update_status_bag_response.dart';

abstract class ManagerStaffRepositories {
  Future<ListAdminResponse> onGetListAdmin(int page, int perPage);
  Future<ListAdminResponse> onSearchListAdmin( String search_name_phone ,int page, int perPage);
  Future<DetailStaffResponse> onGetDetailAdmin(int id);
  Future<UploadStatusBagResponse> onDeleteAdmin(int id);
  Future<UploadStatusBagResponse> onChangeStatusAdmin(int id , int status);
  Future<CreateAdminResponse> onCreateAdmin(CreateAdminRequest request);
  Future<bool> onResetPasswordAdmin(int id);
}