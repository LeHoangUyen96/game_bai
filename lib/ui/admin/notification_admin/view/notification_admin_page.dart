import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/notification_admin/controller/notification_admin_controller.dart';
import 'package:viet_trung_mobile/ui/admin/notification_admin/view/item_notification_admin.dart';
import 'package:viet_trung_mobile/ui/notification/view/item_notification.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';

class NotificationAdminPage extends GetView<NotificationAdminController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationAdminController>(
      init: NotificationAdminController(),
      builder: (value) =>InitialWidget(
          titleAppBar: NOTIFICATION_APP_BAR,
          titleAppBarColor: Colors.white,
          backgroundAppBar: Colors.black26,
          isCenterTitle: false,
          //isShowBack: true,
          // iconBack: TextButton(
          //   child: Icon(
          //     Icons.arrow_back_ios,
          //     size: 20,
          //     color: COLOR_ORDER_PENDING_DEPOSIT,
          //   ),
          //   onPressed: () => Get.back(result: true),
          // ),
          child: ListView.builder(
              itemCount: controller.listNotification.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return InkWell(
                  //onTap: () => controller.onItemNotificationClick(i),
                  // onTap: (){
                  //   Get.to(ConfirmOrderPage());
                  // },
                  child: ItemNotificationAdmin(controller.listNotification[i]),
                );
              }),
        ),
    );
  }
}