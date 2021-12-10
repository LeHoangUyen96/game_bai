import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/notification/controller/notification_controller.dart';
import 'package:viet_trung_mobile/ui/notification/view/item_notification.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class NotificationPage extends GetView<NotificationListController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationListController>(
        init: NotificationListController(),
        builder: (value) => InitialWidget(
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
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: controller.onListRefresh,
                header: WaterDropHeader(
                  refresh: SpinKitCircle(
                    color: MAIN_COLOR,
                    size: 30,
                  ),
                  complete: SpinKitCircle(
                    color: MAIN_COLOR,
                    size: 40,
                  ),
                ),
                onLoading: controller.onListLoading,
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Container();
                    } else if (mode == LoadStatus.loading) {
                      body = SpinKitCircle(color: MAIN_COLOR, size: 40);
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = SpinKitCircle(color: MAIN_COLOR, size: 40);
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: controller.refreshController,
                child: ListView.builder(
                    itemCount: controller.listNotification.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () => controller.readOneNotification(i),
                        // onTap: (){
                        //   Get.to(ConfirmOrderPage());
                        // },
                        child: ItemNotification(controller.listNotification[i]),
                      );
                    }),
              ),
            ));
  }

  Widget _addressBody() {
    return ListView.builder(
        itemCount: 100,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: Get.width,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1.0, color: MAIN_LINE))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: ImageCustomized(
                                path: "assets/images/image_notify.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 13,
                        child: Column(
                          children: [
                            TextCustomized(
                              text:
                                  "Đơn hàng #211003TODWE4MD có 10 kiện hàng đã nhập kho Trung Quốc. Vui lòng xác nhận đơn hàng.",
                              color: Colors.black,
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 18),
                                child: Icon(
                                  Icons.fiber_manual_record_rounded,
                                  color: Colors.red,
                                  size: 13,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextCustomized(
                        text: "18:00 10/08/2021",
                        size: 10,
                        color: TEXT_DATETIME_NT,
                      ),
                    ],
                  )
                ],
              ));
        });
  }

  Widget _buildBottom() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ButtonCustomized(
          BT_NEXT,
          onTap: () {
            print('continue on pressed');
          },
          backgroundColor: Colors.black,
        ));
  }
}
