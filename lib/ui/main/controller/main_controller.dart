import 'package:firebase_core/firebase_core.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/home_reponsitory/home_repositories.dart';
import 'package:viet_trung_mobile/data/repository/notification_repository/notification_repository.dart';
import 'package:viet_trung_mobile/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/profile_get_me_response.dart';
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
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class MainController extends GetxController implements MainContract {
  var tabIndex = 0.obs;
  late NotificationRepository repository;
  late MainContract contract;
  HomeRepositories? homeRepositories;
  ProfileRepositories? profileRepositories;
  ProfileResponse ? mDataProfile;
  var sumUnread = 0;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;
  final deviceToken = GetStorage();
  int ? isAdmin;
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
  void changeTabIndexAdmin(int index) {
    tabIndex.value = navigateItemAdmin[index].id;

    if (index != 2) {
      //navigateItem[index].image = getNavImage(navigateItem[index].id, true);
      navigateItemAdmin[index].color = BLACK_1;
      for (var i = 0; i < navigateItemAdmin.length; i++) {
        if (i != index) {
          //navigateItem[i].image = getNavImage(navigateItem[i].id, false);
        }
        if (i != index) navigateItemAdmin[i].color = BLACK_1;
      }
    }

    update();
  }

  @override
  void onInit() async {
    super.onInit();
    repository = Injector().notification;
    homeRepositories = Injector().home;
    contract = this;
    isAdmin = Get.arguments;
    print("getIsAdmin: $isAdmin");
    profileRepositories =  Injector().profile;
    onGetProfile();
    //await Firebase.initializeApp();
    //getNotificationCount();
    //initFirebaseMessage();
    //getHomeData();
  }
  void onGetProfile(){
    profileRepositories!.onGetProfile().then((value) {
      if (value.data != null) {  
      mDataProfile = value;
      }
      update();
    }).catchError((onError) {
      print('onError $onError');
    });
    update();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // animationController.dispose() instead of your controller.dispose 
  }

  // void getHomeData() {
  //   homeRepositories!.onGetHome().then((value) {
  //     if (value.data != null) {
  //       if (value.data!.number_product! > 0) {
  //         navigateItem[1].badgeCount = value.data!.number_product!;
  //         navigateItem[1].showBadge = true;
  //       }
  //     }
  //     update();
  //   }).catchError((onError) {
  //     // Get.defaultDialog(
  //     //     title: (onError as ErrorResponse).message.toString(), middleText: '');
  //   });
  //   update();
  // }

  // void getNotificationCount() {
  //   repository.onGetUnreadCount(3).then((value) {
  //     return contract.onSuccess(value);
  //   }).catchError((onError) {
  //     print('$onError');
  //   });

  //   repository.onGetUnreadCount(4).then((value) {
  //     return contract.onSuccess(value);
  //   }).catchError((onError) {
  //     print('$onError');
  //   });
  // }
  String getNavImage(int id, bool isActive) {
    switch (id)
 {
      case 0:
        if (isActive) {
          return 'aaaa';
        } else {
          return "icNavHome";
        }
      case 1:
        if (isActive) {
          return "icNavOrderActive";
        } else {
          return "icNavOrder";
        }
      case 2:
        if (isActive) {
          return "icNavNotificationActive";
        } else {
          return "icNavNotification";
        }
      case 3:
        if (isActive) {
          return "icNavProfileActive";
        } else {
          return "icNavProfile";
        }
      default:
        return '';
    }
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

  // initFirebaseMessage() async {
  //   /// Update the iOS foreground notification presentation options to allow
  //   /// heads up notifications.
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );

  //   await FirebaseMessaging.instance.requestPermission(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );

  //   LocalNotificationService.initialize(Get.context!);

  //   // Firebase token, used to call API
  //   String? token = await FirebaseMessaging.instance.getToken();

  //   deviceToken.write(DEVICE_TOKEN, token);

  //   FirebaseMessaging.instance.getInitialMessage().then((value) {
  //     // Case app is killed
  //     if (value != null) {
  //       print(value.notification!.title);
  //       Get.to(() => MainPage());
  //     }
  //   });

  //   FirebaseMessaging.onMessage.listen((event) {
  //     // Case app is in foreground
  //     if (event.notification != null) {
  //       print(event.notification!.title);
  //       print(event.notification!.body);
  //       LocalNotificationService.display(event);
  //     }
  //   });

  //   FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //     // Case app is in background and user tap in push notification
  //     final routeMessage = event.data['route'];
  //     print(routeMessage);
  //     Get.to(() => MainPage());
  //   });
  // }
}
