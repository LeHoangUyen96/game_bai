import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/feedback_detail_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_feedback_review/contoller/manager_feedback_detail_controller.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class FeedbackDetailPage extends GetView<FeedbackDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedbackDetailController>(
        init: FeedbackDetailController(),
        builder: (value) => InitialWidget(
            titleAppBar: REVIEW_ORDER,
            titleAppBarColor: Colors.white,
            backgroundAppBar: Colors.black26,
            isCenterTitle: false,
            isShowBack: true,
            iconBack: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: COLOR_ORDER_PENDING_DEPOSIT,
            ),
            backgroundColor: MAIN_BG,
            child: controller.response != null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: Get.width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          _bodyInfo(controller.response!),
                          SizedBox(height: 20),
                          Row(children: [
                            Spacer(),
                            controller.response!.data!.star == 5
                                ? Row(
                                    children: [
                                      starAmber(),
                                      starAmber(),
                                      starAmber(),
                                      starAmber(),
                                      starAmber()
                                    ],
                                  )
                                : controller.response!.data!.star == 4
                                    ? Row(
                                        children: [
                                          starAmber(),
                                          starAmber(),
                                          starAmber(),
                                          starAmber(),
                                          starGrey()
                                        ],
                                      )
                                    : controller.response!.data!.star == 3
                                        ? Row(
                                            children: [
                                              starAmber(),
                                              starAmber(),
                                              starAmber(),
                                              starGrey(),
                                              starGrey()
                                            ],
                                          )
                                        : controller.response!.data!.star == 2
                                            ? Row(
                                                children: [
                                                  starAmber(),
                                                  starAmber(),
                                                  starGrey(),
                                                  starGrey(),
                                                  starGrey()
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  starAmber(),
                                                  starGrey(),
                                                  starGrey(),
                                                  starGrey(),
                                                  starGrey()
                                                ],
                                              ),
                            Spacer()
                          ]),
                          SizedBox(height: 10),
                          TextCustomized(
                              text: controller.response!.data!.comment!,
                              color: BLACK_1,
                              weight: FontWeight.w600,
                              size: 14),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  )
                : SizedBox()));
  }

  Widget starAmber() {
    return Icon(
      Icons.star,
      color: Colors.amber,
      size: 35,
    );
  }

  Widget starGrey() {
    return Icon(
      Icons.star,
      color: Colors.grey,
      size: 35,
    );
  }

  Widget _bodyInfo(ReviewDetailResponse response) {
    return DottedBorder(
      dashPattern: [8, 5],
      strokeWidth: 1,
      color: BLACK,
      borderType: BorderType.Rect,
      padding: EdgeInsets.all(1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustomized(
                  text: controller.response!.data!.order!.billCode!,
                  font: inter,
                  weight: FontWeight.w500,
                  color: MAIN_BLACK,
                  size: 16,
                ),
                Spacer(),
                TextCustomized(
                  text: deliverySuccess,
                  size: 14,
                  color: COLOR_ORDER_DELIVERY_SUCCESSFULL,
                )
              ],
            ),
            SizedBox(height: 10),
            TextCustomized(
              text: controller.response!.data!.order!.createdAt!,
              font: inter,
              weight: FontWeight.w400,
              color: GRAY3,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustomized(text: ADMIN_NUMBER_PACKAGES, size: 14),
                TextCustomized(
                    text: controller.response!.data!.order!.numberPackage!
                        .toString(),
                    color: BLACK_1,
                    weight: FontWeight.w600,
                    size: 14)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustomized(text: ADMIN_ITEMS, size: 14),
                Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                            text:
                                controller.response!.data!.order!.productName!,
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
                            text:
                                controller.response!.data!.order!.packingForm!,
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
                TextCustomized(text: "Thu hộ phí vận chuyển (COD):", size: 14),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                            text: "¥" +
                                controller.response!.data!.order!.transportFee!
                                    .toString(),
                            color: RED_1,
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
                        TextCustomized(text: "Hình thức nhận hàng", size: 14)
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                            text:
                                controller.response!.data!.order!.deliveryForm!,
                            color: BLACK_1,
                            weight: FontWeight.w500,
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
