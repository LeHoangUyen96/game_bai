import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/notification_admin/controller/notification_admin_controller.dart';
import 'package:viet_trung_mobile_admin/ui/admin/notification_admin/view/item_notification_admin.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_wait_confirm/view/order_detail_waitting_for_confirm_page.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';

class NotificationAdminPage extends GetView<NotificationAdminController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationAdminController>(
      init: NotificationAdminController(),
      builder: (value) => InitialWidget(
        titleAppBar: NOTIFICATION_APP_BAR,
        titleAppBarColor: Colors.white,
        backgroundAppBar: Colors.black26,
        isCenterTitle: false,
        isShowBack: true,
        iconBack: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: WHITE,
          ),
        ),
        child: ListView.builder(
            itemCount: controller.listNotification.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Get.to(OrderDetailsWaitingForConfirmPage());
                },
                child: ItemNotificationAdmin(controller.listNotification[i]),
              );
            }),
      ),
    );
  }
}
