import 'package:viet_trung_mobile_admin/data/response/notification_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/notification_response.dart';

abstract class NotificationRepository {
  Future<NotificationListResponse> onGetSystemNotification(
      int page, int perPage);

  Future<NotificationListResponse> onGetOrderNotification(
      int page, int perPage);

  Future<int> onGetUnreadCount();

  Future onReadAllNotification();

  Future onReadOneNotification(int notificationId);
  Future<NotificationListResponse> onGetListNotification(int page, int perPage);
  Future<NotificationAdminResponse> onGetListNotificationAdmin();
}
