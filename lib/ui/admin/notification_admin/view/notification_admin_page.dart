import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/notification_admin/controller/notification_admin_controller.dart';
import 'package:viet_trung_mobile/ui/admin/notification_admin/view/item_notification_admin.dart';
import 'package:viet_trung_mobile/ui/order_management/order_wait_confirm/view/order_detail_waitting_for_confirm_page.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';

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
