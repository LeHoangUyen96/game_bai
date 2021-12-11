import 'package:viet_trung_mobile/data/response/detail_user_response.dart';
import 'package:viet_trung_mobile/data/response/list_user_response.dart';
import 'package:viet_trung_mobile/data/response/update_status_bag_response.dart';

abstract class ManagerUserRepositories {
  Future<ListUserResponse> onGetListUser(int page, int perPage);
  Future<ListUserResponse> onSearchListUser( String search_name_phone ,int page, int perPage);
  Future<UploadStatusBagResponse> onDeleteUser(int id);
  Future<DetailUserResponse> onGetDetailUser(int id);
}