import 'package:viet_trung_mobile/data/response/list_admin_response.dart';

abstract class ManagerStaffRepositories {
  Future<ListAdminResponse> onGetListAdmin(int page, int perPage);

}