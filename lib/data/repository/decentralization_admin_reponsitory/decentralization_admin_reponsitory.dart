import 'package:viet_trung_mobile/data/response/list_decentralization_response.dart';
import 'package:viet_trung_mobile/data/response/list_rights_group.dart';

abstract class DecentralizationAdminRepositories {
  Future<DecentralizationResponse> onGetListDecentralization();
  Future<RightsGroupResponse> onGetListRightsGroup();
}
