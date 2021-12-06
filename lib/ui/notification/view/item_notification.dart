import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/notification_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/ui/notification/controller/notification_controller.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';

class ItemNotification extends GetView<NotificationListController> {
  final NotificationResponse notificationItem;

  ItemNotification(this.notificationItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    child: ImageCustomized(path: notificationItem.image ?? '', fit: BoxFit.fill),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 10),
                    child: Text(notificationItem.content ?? ''),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: notificationItem.status == 0 ?
                  ImageCustomized(path: IC_NOTIFICATION_UNREAD, height: 10, width: 10,)
                  : Container(),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              notificationItem.moment_string ?? '',
              textAlign: TextAlign.right,
              style: TextStyle(color: GRAY3, fontSize: 10),
            ),
            SizedBox(height: 8),
            Divider(height: 1, color: GRAY4)
          ],
        ),
      ),
    );
  }
}
