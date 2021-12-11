import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/rating_order/controller/review_order_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class ReviewOrderPage extends GetView<ReviewOrderController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewOrderController>(
        init: ReviewOrderController(),
        builder: (value) => InitialWidget(
              titleAppBar: REVIEW_ORDER,
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
              child: controller.orderDetailsResponse != null ? Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: MAIN_BG,
                //height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      _bodyInfo(),
                      SizedBox(height: 20),
                      RatingBar.builder(
                        // initialRating: 3,
                        // minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          controller.star = rating;
                          print(rating);
                        },
                      ),
                      SizedBox(height: 20),
                      // Container(
                      //   height: Get.height*0.4,
                      //   child: TextFieldCustomized(
                      //     //height: Get.height*0.4,
                      //     maxLine: 6,
                      //     hint: "Chia sẻ đánh giá của bạn về đơn hàng này",
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.all(12),
                        height: Get.height * 0.3,
                        child: TextField(
                          maxLines: 8,
                          controller: controller.commentController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText:
                                "Chia sẻ đánh giá của bạn về đơn hàng này",
                            fillColor: WHITE,
                            filled: true,
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: GRAY,
                                fontSize: smallSize,
                                fontFamily: SanFranciscoTextLight),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ButtonCustomized(
                          RATING,
                          onTap: () {
                            controller.onRatingOrder();
                          },
                          backgroundColor: MAIN_BLACK,
                        ),
                      )
                    ],
                  ),
                ),
              ): LoadingSpinKit(),
            ));
  }

  Widget _bodyInfo() {
    final Color color;
    color = controller.ColorStatusName(controller.orderDetailsResponse!.dataOrderDetails!.order_status_name.toString());
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
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        //height: Get.height * 0.28,
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
                          text: controller.orderDetailsResponse!.dataOrderDetails!.bill_code.toString(),
                          size: 14,
                        ),
                        SizedBox(height: 10),
                        TextCustomized(
                            text: controller.orderDetailsResponse!.dataOrderDetails!.created_at.toString(),
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
                          text: controller.orderDetailsResponse!.dataOrderDetails!.order_status_name.toString(),
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
                            text: controller.orderDetailsResponse!.dataOrderDetails!.number_package.toString(),
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
                            text: controller.orderDetailsResponse!.dataOrderDetails!.item.toString(),
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
                            text: controller.orderDetailsResponse!.dataOrderDetails!.packing_form.toString(),
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
                            text: "¥" + controller.orderDetailsResponse!.dataOrderDetails!.transport_fee.toString(),
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
