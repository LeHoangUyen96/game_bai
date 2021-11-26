import 'package:viet_trung_mobile/data/response/find_user_reponse.dart';

abstract class FindUserRepositories {
  Future<FindUserResponse> onGetFindUser(String valueSearch);
}