import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/models/navigate_emblem.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/ui/admin/dashboard_admin/view/dashboard_admin_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/finding_customers/view/finding_customer_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/general_management/view/general_management_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/notification_admin/view/notification_admin_page.dart';
import 'package:viet_trung_mobile_admin/ui/dashboard_user/view/dashboard_user_page.dart';
import 'package:viet_trung_mobile_admin/ui/main/controller/main_controller.dart';
import 'package:viet_trung_mobile_admin/ui/notification/view/notification_page.dart';
import 'package:viet_trung_mobile_admin/ui/order/view/order_info_page.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/view/order_admin_page.dart';
import 'package:viet_trung_mobile_admin/ui/profile/view/profile_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/view/setting_admin_page.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class MainPageAdmin extends GetView<MainController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    print('Call MainPage build');
    return GetBuilder<MainController>(
      builder: (value) => WillPopScope(
        // onWillPop: () => _backPressed(controller.screensData[controller.tabIndex.value].navigatorKey),
        onWillPop: () async {
          //Get.key.currentState!.maybePop();
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
                // controller.isAdmin == 1
                //     ? DashboardAdminPage()
                //     : DashboardUserPage(),
                // controller.isAdmin == 1 ? OrderAdminPage() : OrderInfoPage(),
                // controller.isAdmin == 1 ? GenaeralManagePage() : ProfilePage(),
                // controller.isAdmin == 1
                //     ? SettingAdminPage()
                //     : NotificationPage(),
                DashboardAdminPage(),
                OrderAdminPage(),
                GenaeralManagePage(),
                SettingAdminPage(),
              ],
            ),
          ),
          // bottomNavigationBar: controller.isAdmin == 1
          //     ? _buildBottomNavigationAdmin()
          //     : _buildBottomNavigation(),
          // floatingActionButton:
          //     controller.isAdmin == 1 ? floatActionButton() : Container(),
          bottomNavigationBar: _buildBottomNavigationAdmin(),
          floatingActionButton: floatActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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

  Widget floatActionButton() {
    return InkWell(
      onTap: () {
        Get.to(FindingCustomerPage());
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: 60,
        height: 60,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: ImageCustomized(
          path: IC_SEARCH,
          width: 25,
          height: 25,
          color: WHITE,
        ),
        decoration: const BoxDecoration(
          color: BT_CONFIRM,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationAdmin() => CustomNavigationBar(
        backgroundColor: BG_NAVIGATION_COLOR,
        currentIndex: (controller.tabIndex.value >= 2)
            ? controller.tabIndex.value + 1
            : controller.tabIndex.value,
        //currentIndex: controller.tabIndex.value ,
        onTap: controller.changeTabIndexAdmin,
        strokeColor: BLACK_1,
        items: navigateItemAdmin.map((NavigateEmblemAdmin navigateEmblemAdmin) {
          return CustomNavigationBarItem(
            badgeCount: navigateEmblemAdmin.badgeCount,
            showBadge: navigateEmblemAdmin.showBadge,
            icon: ImageCustomized(
              // width: 30,
              // height: 30,
              path: navigateEmblemAdmin.image,
              color: navigateEmblemAdmin.color,
              margin: const EdgeInsets.only(bottom: 5),
            ),
            title: TextCustomized(
              text: navigateEmblemAdmin.title,
              color: navigateEmblemAdmin.color,
            ),
          );
        }).toList(),
      );
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
