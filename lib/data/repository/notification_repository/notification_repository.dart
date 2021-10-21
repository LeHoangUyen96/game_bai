import 'package:viet_trung_mobile/data/response/notification_response.dart';

abstract class NotificationRepository {
  Future<NotificationListResponse> onGetSystemNotification(int page, int perPage);

  Future<NotificationListResponse> onGetOrderNotification(int page, int perPage);

  Future<int> onGetUnreadCount(int type);

  Future onReadAllNotification(int type);

  Future onReadOneNotification(int notificationId);
}
