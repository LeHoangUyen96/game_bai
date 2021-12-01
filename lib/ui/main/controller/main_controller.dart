import 'package:firebase_core/firebase_core.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/home_reponsitory/home_repositories.dart';
import 'package:viet_trung_mobile/data/repository/notification_repository/notification_repository.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/ui/main/contract/main_contract.dart';
import 'package:viet_trung_mobile/ui/main/view/main_page.dart';
import 'package:viet_trung_mobile/ulti/key_storage/key_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:viet_trung_mobile/data/models/navigate_emblem.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/ulti/services/local_notification_services.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController implements MainContract {
  var tabIndex = 0.obs;
  late NotificationRepository repository;
  late MainContract contract;
  HomeRepositories? homeRepositories;
  var sumUnread = 0;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;
  final deviceToken = GetStorage();

  void changeTabIndex(int index) {
    tabIndex.value = index;
    if (index == 2) {
      navigateItem[index].showBadge = false;
    }
    if (index == 1) {
      navigateItem[index].showBadge = false;
    }
    navigateItem[index].color = BLACK_1;
    for (var i = 0; i < navigateItem.length; i++) {
      if (i != index) navigateItem[i].color = DISABLED_COLOR;
    }
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    repository = Injector().notification;
    homeRepositories = Injector().home;
    contract = this;
  }

  @override
  void onError(ErrorResponse error) {}

  @override
  void onSuccess(int data) {
    sumUnread += data;
    if (data > 0) {
      navigateItem[2].badgeCount = sumUnread;
      navigateItem[2].showBadge = true;
    }
    update();
  }
}
