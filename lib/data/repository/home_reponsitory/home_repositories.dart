import 'package:viet_trung_mobile_admin/data/response/home_response.dart';

abstract class HomeRepositories {
  Future<HomeResponse> onGetHome();
  Future<bool> onUpdateToken(String deviceToken);
}
