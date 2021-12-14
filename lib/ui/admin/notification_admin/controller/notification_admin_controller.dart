import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/notification_repository/notification_repository.dart';
import 'package:viet_trung_mobile_admin/data/response/notification_admin_response.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/ui/admin/notification_admin/contract/notification_admin_contract.dart';

class NotificationAdminController extends GetxController
    implements NotificationContract {
  late NotificationContract contract;
  late NotificationRepository repository;
  NotificationAdminResponse? listNotificationResponse;
  List<DataNotificationAdminResponse> listNotification = [];
  DataNotificationAdminResponse? mdataNotificationResponse;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().notification;
    contract = this;
    getListNotification();
  }

  void getListNotification() {
    repository.onGetListNotificationAdmin().then((value) {
      return contract.onGetListNotificationAdminSuccess(value);
    }).catchError((onError) {
      print("-----------------$onError");
      return contract.onGetListNotificationAdminError(onError);
    });
  }

  void onGetOrderDetailsError(ErrorResponse msg) {}

  @override
  void onGetListNotificationAdminError(ErrorResponse error) {
    Get.defaultDialog(title: error.message.toString(), middleText: '');
  }

  @override
  void onGetListNotificationAdminSuccess(NotificationAdminResponse data) {
    listNotificationResponse = data;
    listNotification.addAll(listNotificationResponse!.data!);
    update();
  }
}
