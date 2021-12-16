import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/notification_repository/notification_repository.dart';
import 'package:viet_trung_mobile/data/response/notification_admin_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/ui/admin/notification_admin/contract/notification_admin_contract.dart';

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
    //orderRepositories = Injector().order;
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

  // bool isNumericUsingRegularExpression(String string) {
  //   final numericRegex =
  //   RegExp(r'^-?(([0-9]*)|(([0-9]*)))$');

  //   return numericRegex.hasMatch(string);
  // }

}
