import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/order/controller/order_details_receive_controller.dart';
import 'package:viet_trung_mobile_admin/ui/rating_order/view/review_order_page.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class OrderDetailReceivePage extends GetView<OrderDetailReceiveController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailReceiveController>(
        init: OrderDetailReceiveController(),
        builder: (value) => InitialWidget(
              titleAppBar: ORDER_HEADER_DETAILS,
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
              child: controller.orderDetailsResponse != null
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      color: MAIN_BG,
                      //height: Get.height,
                      width: Get.width,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            _bodyInfo(),
                            SizedBox(height: 10),
                            SizedBox(height: 25),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: WHITE),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustomized(
                                    text: ORDER_LIST_JOURNEY,
                                    size: normalSize,
                                    weight: FontWeight.w600,
                                    color: BLACK_1,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListView.builder(
                                      itemCount: controller
                                          .orderDetailsResponse!
                                          .dataOrderDetails!
                                          .order_journey!
                                          .length,
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return _buildListJourney(index);
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ButtonCustomized(
                              REVIEW_ORDER,
                              onTap: () {
                                Get.to(ReviewOrderPage(),
                                    arguments:
                                        controller.orderDetailsResponse!);
                              },
                              backgroundColor: BT_CONFIRM,
                              textColor: WHITE,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  : LoadingSpinKit(),
            ));
  }

  Widget _buildListJourney(index) {
    return Center(
      child: TimelineTile(
        isFirst: index == 0,
        isLast: index ==
            controller.orderDetailsResponse!.dataOrderDetails!.order_journey!
                    .length -
                1,
        //  isLast: true,
        hasIndicator: true,
        axis: TimelineAxis.vertical,
        alignment: TimelineAlign.center,
        lineXY: 0.1,
        indicatorStyle: IndicatorStyle(
          color: BT_GRAY,
          height: 10,
          width: 10,
          drawGap: true,
          indicatorXY: 0.3,
        ),
        beforeLineStyle: LineStyle(color: BT_GRAY, thickness: 1),
        endChild: Container(
          padding: EdgeInsets.only(left: 10),
          height: 50,
          child: TextCustomized(
            text: controller.orderDetailsResponse!.dataOrderDetails!
                .order_journey![index].status_name
                .toString(),
            font: SanFranciscoTextLight,
            size: normalSize,
            weight: FontWeight.w600,
            color: GRAY,
          ),
        ),
        startChild: Container(
          height: 50,
          padding: EdgeInsets.only(left: 20),
          child: TextCustomized(
            text: controller.orderDetailsResponse!.dataOrderDetails!
                .order_journey![index].created_at
                .toString(),
            font: SanFranciscoTextLight,
            size: smallSize,
            weight: FontWeight.w400,
            color: BT_GRAY,
          ),
        ),
      ),
    );
  }

  Widget _bodyInfo() {
    final Color color;
    color = controller.ColorStatusName(controller
        .orderDetailsResponse!.dataOrderDetails!.order_status_name
        .toString());
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      color: BLACK,
      borderType: BorderType.Rect,
      padding: EdgeInsets.all(1),
      // corner: FDottedLineCorner.all(6.0),
      // strokeWidth: 1.0,
      // dottedLength: 6.0,
      // space: 8.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: Get.height * 0.28,
        width: Get.width,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(
                          text: controller
                              .orderDetailsResponse!.dataOrderDetails!.bill_code
                              .toString(),
                          size: 14,
                        ),
                        SizedBox(height: 10),
                        TextCustomized(
                            text: controller.orderDetailsResponse!
                                .dataOrderDetails!.created_at
                                .toString(),
                            size: 10,
                            color: TEXT_DATETIME_NT)
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                          text: controller.orderDetailsResponse!
                              .dataOrderDetails!.order_status_name
                              .toString(),
                          size: 14,
                          color: color,
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(text: ADMIN_NUMBER_PACKAGES, size: 14)
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                            text: controller.orderDetailsResponse!
                                .dataOrderDetails!.number_package
                                .toString(),
                            color: BLACK_1,
                            weight: FontWeight.w600,
                            size: 14)
                      ],
                    )),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [TextCustomized(text: ADMIN_ITEMS, size: 14)],
                    )),
                Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                            text: controller
                                .orderDetailsResponse!.dataOrderDetails!.item
                                .toString(),
                            color: BLACK_1,
                            weight: FontWeight.w600,
                            size: 14)
                      ],
                    )),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(text: "Hình thức đóng gói", size: 14)
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                            text: controller.orderDetailsResponse!
                                .dataOrderDetails!.packing_form
                                .toString(),
                            color: BLACK_1,
                            weight: FontWeight.w600,
                            size: 14)
                      ],
                    )),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(
                            text: "Thu hộ phí vận chuyển (COD):", size: 14)
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                            text: "¥" +
                                controller.orderDetailsResponse!
                                    .dataOrderDetails!.transport_fee
                                    .toString(),
                            color: BLACK_1,
                            weight: FontWeight.w600,
                            size: 14)
                      ],
                    )),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
