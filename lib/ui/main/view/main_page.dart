import 'package:viet_trung_mobile/data/models/navigate_emblem.dart';
import 'package:viet_trung_mobile/ui/admin/finding_customers/view/finding_customer_page.dart';
import 'package:viet_trung_mobile/ui/home/view/home_page.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/ui/main/controller/main_controller.dart';
import 'package:viet_trung_mobile/ui/notification/view/notification_page.dart';
import 'package:viet_trung_mobile/ui/order/view/order_info_page.dart';
import 'package:viet_trung_mobile/ui/profile/view/profile_page.dart';
import 'package:viet_trung_mobile/widget/home_page.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    print('Call MainPage build');
    return GetBuilder<MainController>(
      builder: (value) => WillPopScope(
        // onWillPop: () => _backPressed(controller.screensData[controller.tabIndex.value].navigatorKey),
        onWillPop: ()  async {
          Get.key.currentState!.maybePop();
          return false;
        },
        child: Scaffold(
          extendBody: false,
          body: Obx(
            () => IndexedStack(
              index: controller.tabIndex.value,
              // children: controller.screensData.map(_buildIndexedPageFlow).toList(),
              children: [
                //ProfilePage(),
                //FindingCustomerPage(),
                HomeViewsPage(),
                OrderInfoPage(),
                ProfilePage(),
                NotificationPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNavigation(),
        ),
      ),
    );
  }

  Future<bool> _backPressed(GlobalKey<NavigatorState> _yourKey) async {
    //Checks if current Navigator still has screens on the stack.
    if (_yourKey.currentState!.canPop()) {
      // 'maybePop' method handles the decision of 'pop' to another WillPopScope if they exist.
      //If no other WillPopScope exists, it returns true
      _yourKey.currentState!.maybePop();
      return Future<bool>.value(false);
    }
    //if nothing remains in the stack, it simply pops
    return Future<bool>.value(true);
  }

  Widget _buildBottomNavigation() => CustomNavigationBar(
        backgroundColor: BG_NAVIGATION_COLOR,
        currentIndex: controller.tabIndex.value,
        onTap: controller.changeTabIndex,
        strokeColor: BLACK_1,

        items: navigateItem.map((NavigateEmblem navigateEmblem) {
          return CustomNavigationBarItem(
            badgeCount: navigateEmblem.badgeCount,
            showBadge: navigateEmblem.id == 1 ? true : navigateEmblem.showBadge,
            icon: ImageCustomized(
              path: navigateEmblem.image,
              color: navigateEmblem.color,
            ),
            title: TextCustomized(
              text: navigateEmblem.title,
              color: navigateEmblem.color,
            ),
          );
        }).toList(),
      );
}
