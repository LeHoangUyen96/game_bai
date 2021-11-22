import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
//import 'package:timelines/timelines.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/%20%20order_management/controller/order_management_controller.dart';
import 'package:viet_trung_mobile/ui/%20%20order_management/view/valid_order_page.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_info_controller.dart';
import 'package:viet_trung_mobile/ui/order/view/order_inventory_list_page.dart';
import 'package:viet_trung_mobile/ui/order/view/order_list.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class OrderDetailsAdminPage extends GetView<OrderManagementController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<OrderManagementController>(
      init: OrderManagementController(),
      builder: (value) => Scaffold(
          appBar: buildAppBar(),
          body:   buildBody()

      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: InitialWidget(
        child: Container(),
        titleAppBar: ORDER_LIST_APP_BAR,
        backgroundAppBar: Colors.black26,
        isShowBack: false,

      ),
    );
  }
  Widget buildBody(){
    return Container(
      color: WHITE,
      margin: EdgeInsets.only(top: Get.height * 0.01),
      // padding: EdgeInsets.symmetric(horizontal: Get.width*0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextCustomized(
              text: "Thông tin đơn hàng",
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: Get.width,
            height: 0.5,
            color: GRAY1,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustomized(
                      text: "211003TODWE4MD",
                      font: SanFranciscoText,
                      weight: FontWeight.w700,
                      color: MAIN_BLACK,
                    ),
                    TextCustomized(
                      text: "Kho Trung Quốc",
                      font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: BG_ID_PD,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                TextCustomized(
                  text: "10:10 21/10/2021",
                  font: SanFranciscoTextLight,
                  weight: FontWeight.w400,
                  color: MAIN_GRAY,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustomized(
                      text: "Khách hàng",
                      font: SanFranciscoTextLight,
                      weight: FontWeight.w700,
                      color: GRAY1,
                    ),
                    TextCustomized(
                      text: "Tâm Lợn",
                      font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: BLACK,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustomized(
                      text: ORDER_LIST_PARCELS,
                      font: SanFranciscoTextLight,
                      weight: FontWeight.w700,
                      color: GRAY1,
                    ),
                    TextCustomized(
                      text: "10",
                      font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: BLACK,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustomized(
                      text: ORDER_LIST_ITEMS,
                      font: SanFranciscoTextLight,
                      weight: FontWeight.w700,
                      color: GRAY1,
                    ),
                    TextCustomized(
                      text: "Máy phun khử khuẩn",
                      font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: BLACK,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: Get.width,
                  height: 0.5,
                  color: GRAY1,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustomized(
                      text: ORDER_LIST_COD,
                      font: SanFranciscoTextLight,
                      weight: FontWeight.w700,
                      color: GRAY1,
                    ),
                    TextCustomized(
                      text: "¥269.00",
                      font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: BLACK,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustomized(
                      text: "Phụ phí",
                      font: SanFranciscoTextLight,
                      weight: FontWeight.w700,
                      color: GRAY1,
                    ),
                    Expanded(
                      flex: 5,
                      child: TextCustomized(
                        text: "¥42.00",
                        font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: BLACK,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            //width: Get.width/,
            //padding: EdgeInsets.only(left: 2),
            child:  TimelineTile(
              isFirst: true,
              alignment: TimelineAlign.manual,
              lineXY: 0.4,
              indicatorStyle: IndicatorStyle(
                color: Colors.green,
                height: 10,
                width: 10,
                drawGap: false,
                indicatorXY: 0,
              ),
              beforeLineStyle: LineStyle(color: BT_GRAY, thickness: 2) ,
              endChild: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustomized(
                      text: "Kho Trung Quốc, đang đóng hàng về",
                      font: SanFranciscoTextLight,
                      weight: FontWeight.w400,
                      color: Colors.green,
                    ),
                    SizedBox(height: 50,),
                  ],
                ),
              ),
              startChild: Container(
                child: Container(
                  alignment: const Alignment(0.7, -0.800),
                  child: TextCustomized(
                    text: "11/11/2021",
                    font: SanFranciscoTextLight,
                    weight: FontWeight.w400,
                    color: MAIN_GRAY,
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}