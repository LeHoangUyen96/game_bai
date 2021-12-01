import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/data/response/notification_admin_response.dart';
import 'package:viet_trung_mobile/data/response/notification_response.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';
import 'package:get/get_connect/connect.dart';
import 'notification_repository.dart';

class NotificationImpl extends GetConnect implements NotificationRepository {

  @override
  Future<NotificationListResponse> onGetOrderNotification(int page, int perPage) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.NOTIFICATION_LIST+"?type=3&page=$page&per_page=$perPage";
    final responseJson = await post(url, {}, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return NotificationListResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }

  @override
  Future<NotificationListResponse> onGetSystemNotification(int page, int perPage) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.NOTIFICATION_LIST+"?type=4&page=$page&per_page=$perPage";
    final responseJson = await post(url, {}, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return NotificationListResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }

  @override
  Future<int> onGetUnreadCount() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.NOTIFICATION_UNREAD_COUNT;
    final responseJson = await post(url, {}, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ParseNumber.parseInt(responseJson.body['total']);
    }
    throw Exception(responseJson.body);
  }

  @override
  Future onReadAllNotification() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.NOTIFICATION_UNREAD_COUNT;
    final responseJson = await post(url, {}, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return 'Success';
    }
    throw Exception(responseJson.body);
  }

  @override
  Future onReadOneNotification(int notificationId) async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.NOTIFICATION_READ_ONE+"/$notificationId";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return 'Success';
    }
    throw Exception(responseJson.body);
  }

  @override
  Future<NotificationListResponse> onGetListNotification(int page, int perPage) async {
   final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.NOTIFICATION_LIST+"?page=$page&per_page=$perPage";
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return NotificationListResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }

  @override
  Future<NotificationAdminResponse> onGetListNotificationAdmin() async {
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.NOTIFICATION_ADMIN;
    final responseJson = await get(url, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return NotificationAdminResponse.fromJson(responseJson.body);
    }
    throw Exception(responseJson.body);
  }

}
