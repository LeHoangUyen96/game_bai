import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/notification_admin_response.dart';

abstract class NotificationContract{
   void onGetListNotificationAdminSuccess(NotificationAdminResponse data);
   void onGetListNotificationAdminError(ErrorResponse error);
}