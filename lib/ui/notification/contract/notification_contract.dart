import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/notification_response.dart';

abstract class NotificationContract {
  void onGetListNotificationSuccess(NotificationListResponse data);
  void onGetListNotificationError(ErrorResponse error);
}
