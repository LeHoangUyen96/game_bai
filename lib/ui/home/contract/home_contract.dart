import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/home_response.dart';

abstract class HomeContract {

  void onGetHomeSuccess(HomeResponse data);
  void onGetHomeError(ErrorResponse msg);
}