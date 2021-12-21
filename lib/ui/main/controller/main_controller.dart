import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/models/navigate_emblem.dart';
import 'package:viet_trung_mobile_admin/data/repository/home_reponsitory/home_repositories.dart';
import 'package:viet_trung_mobile_admin/data/repository/notification_repository/notification_repository.dart';
import 'package:viet_trung_mobile_admin/data/repository/profile_repository/profile_repository.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/profile_get_me_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/ui/main/contract/main_contract.dart';
import 'package:viet_trung_mobile_admin/ulti/key_storage/key_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class MainController extends GetxController implements MainContract {
  var tabIndex = 0.obs;
  late NotificationRepository repository;
  late MainContract contract;
  HomeRepositories? homeRepositories;
  ProfileRepositories? profileRepositories;
  ProfileResponse? mDataProfile;
  var sumUnread = 0;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;
  final deviceToken = GetStorage();
  //final  isAdmin = GetStorage();
  int? isAdmin;
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
      navigateItemAdmin[index].image = getNavImage(navigateItemAdmin[index].id, true);
      navigateItemAdmin[index].color = BLACK_1;
      for (var i = 0; i < navigateItemAdmin.length; i++) {
        if (i != index) {
          navigateItemAdmin[i].image = getNavImage(navigateItemAdmin[i].id, false);
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
    // isAdmin = Get.arguments;
    // print("getIsAdmin: $isAdmin");
    profileRepositories = Injector().profile;
    onGetProfile();
    getAdmin();
    //await Firebase.initializeApp();
    //getNotificationCount();
    //initFirebaseMessage();
    //getHomeData();
  }

  void getAdmin() {
    if (GetStorage().read(KEY_ADMIN) != null) {
      isAdmin = GetStorage().read(KEY_ADMIN);
      print("++++++++++++++++++++++++++++++++${isAdmin}");
      update();
    }
  }

  void onGetProfile() {
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
    switch (id) {
      case 0:
        if (isActive) {
          return IC_HOME_ACTIVE;
        } else {
          return IC_NAV_HOME;
        }
      case 1:
        if (isActive) {
          return IC_ORDER_ACTIVE;
        } else {
          return IC_ORDER;
        }
      case 2:
        if (isActive) {
          return IC_PRESON_ACTIVE;
        } else {
          return IC_ACCOUNT;
        }
      case 3:
        if (isActive) {
          return IC_SETTING_ACTIVE;
        } else {
          return IC_SETTING;
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
}
