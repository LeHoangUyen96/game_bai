import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/models/navigate_emblem.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/ui/admin/dashboard_admin/view/dashboard_admin_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/finding_customers/view/finding_customer_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/general_management/view/general_management_page.dart';
import 'package:viet_trung_mobile_admin/ui/main/controller/main_controller.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/view/order_admin_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/view/setting_admin_page.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class MainPageAdmin extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    print('Call MainPage build');
    return GetBuilder<MainController>(
      builder: (value) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          extendBody: false,
          body: Obx(
            () => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                DashboardAdminPage(),
                OrderAdminPage(),
                GenaeralManagePage(),
                SettingAdminPage(),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationAdmin(),
          floatingActionButton: floatActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
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
        onTap: controller.changeTabIndexAdmin,
        strokeColor: BLACK_1,
        items: navigateItemAdmin.map((NavigateEmblemAdmin navigateEmblemAdmin) {
          return CustomNavigationBarItem(
            badgeCount: navigateEmblemAdmin.badgeCount,
            showBadge: navigateEmblemAdmin.showBadge,
            icon: ImageCustomized(
              width: 30,
              height: 30,
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
}
