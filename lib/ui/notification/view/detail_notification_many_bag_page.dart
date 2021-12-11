import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/notification/controller/detail_notification_many_bag_controller.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class DetailNotificationManyBagPage extends GetView<NotificationManyBagController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationManyBagController>(
        init: NotificationManyBagController(),
        builder: (value) => InitialWidget(
            titleAppBar: NOTIFICATION_INFO_APP_BAR,
            titleAppBarColor: Colors.white,
            backgroundAppBar: Colors.black26,
            isCenterTitle: false,
            isShowBack: true,
            iconBack: TextButton(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: COLOR_ORDER_PENDING_DEPOSIT,
              ),
              onPressed: () => Get.back(result: true),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                color: MAIN_BG,
                child: Column(
                  children: [
                    SizedBox(height: 25.0),
                    Container(
                      color: WHITE,
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ImageCustomized(
                                    path: IMG_DASHBOARD,
                                    height: 60,
                                    width: 60,
                                  )
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustomized(
                                  text: "Bạn có 10 đơn hàng đã xuất kho Trung Quốc nằm trong 2 bao",
                                  font: SanFranciscoTextLight,
                                  weight: FontWeight.w700,
                                  color: MAIN_BLACK,
                                  size: normalSize,
                                  ),
                                SizedBox(height: 5.0),
                                TextCustomized(
                                  text: "18:00 10/08/2021",
                                  font: SanFranciscoTextLight,
                                  weight: FontWeight.w700,
                                  color: TEXT_DATETIME_NT,
                                  ),
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      color: WHITE,
                      padding: EdgeInsets.only(bottom: 15),
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index){
                          return _buildListBag();
                        }, 
                        itemCount: 20,
                        padding: EdgeInsets.all(0.0),
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
  Widget _buildListBag(){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: BT_GRAY
          )
        )
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         TextCustomized(
            text: "#Bao_BinhAn_HN_2710_01",
            font: SanFranciscoUIText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            size: normalSize,
            ),
          TextCustomized(
            text: "Kho cửa khẩu",
            font: SanFranciscoUIText,
            weight: FontWeight.w700,
            color: RED_1,
            size: normalSize,
            ),
        ],
      ),
    );
  }
}