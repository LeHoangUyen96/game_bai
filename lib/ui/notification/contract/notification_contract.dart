import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/notification_response.dart';

abstract class NotificationContract{
   void onGetListNotificationSuccess(NotificationListResponse data);
   void onGetListNotificationError(ErrorResponse error);
}