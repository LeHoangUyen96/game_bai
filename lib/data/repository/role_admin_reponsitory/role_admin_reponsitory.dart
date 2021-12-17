import 'package:viet_trung_mobile_admin/data/request/update_role_request.dart';
import 'package:viet_trung_mobile_admin/data/response/auth_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_role_response.dart';
import 'package:viet_trung_mobile_admin/data/response/list_rights_group.dart';
import 'package:viet_trung_mobile_admin/data/response/role_detail_response.dart';

abstract class RoleAdminRepositories {
  Future<RoleResponse> onGetListRole();
  Future<RightsGroupResponse> onGetListRightsGroup();
  Future<RoleDetailResponse> onGetRoleDetail(String id);
  Future<ForgotPassResponse> onUpdateRole(UpdateRoleRequest request, String id);
  Future<ForgotPassResponse> onDeleteRole(String id);
  Future<ForgotPassResponse> onAddRole(UpdateRoleRequest request);
}
