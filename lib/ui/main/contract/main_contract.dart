import 'package:viet_trung_mobile/data/response/error_response.dart';

abstract class MainContract{
  void onSuccess(int data);

  void onError(ErrorResponse error);
}