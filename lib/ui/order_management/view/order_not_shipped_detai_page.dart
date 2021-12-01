import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/controller/order_management_controller.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/view/add_image_enter_warehouse_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class OrderDetailNotShippedPage extends GetView<OrderManagementController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderManagementController>(
      init: OrderManagementController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(ORDER_HEADER_DETAILS),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      color: GRAY7,
      padding: EdgeInsets.only(top: Get.height * 0.01),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: WHITE,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: TextCustomized(
                      text: "Thông tin đơn hàng",
                      size: 16,
                      weight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
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
                              text: "Chờ xác nhận",
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: TEXT_ORDER_W_CONFIRM,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextCustomized(
                          text: "10:10 21/10/2021",
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w400,
                          color: MAIN_GRAY,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextCustomized(
                              text: "Yêu cầu:",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w700,
                              color: GRAY1,
                            ),
                            TextCustomized(
                              text: "Trả về nhà cung cấp",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w700,
                              color: BLACK,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextCustomized(
                              text: "Khách hàng:",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w700,
                              color: GRAY1,
                            ),
                            TextCustomized(
                              text: "Tâm Lợn",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w700,
                              color: BLACK,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextCustomized(
                              text: "Số điện thoại:",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w700,
                              color: GRAY1,
                            ),
                            TextCustomized(
                              text: "0783576610",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w700,
                              color: BLACK,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w700,
                              color: BLACK,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w700,
                              color: BLACK,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: Get.width,
                          height: 0.5,
                          color: GRAY1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        SizedBox(
                          height: 10,
                        ),
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
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: WHITE,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustomized(
                    text: "Hình ảnh",
                    size: 16,
                    font: SanFranciscoText,
                    weight: FontWeight.w700,
                    color: BLACK,
                  ),
                  AddImageEnterWarehouse(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: WHITE,
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 0,
                          groupValue: 0,
                          activeColor: Colors.black,
                          onChanged: (int? value) {
                            //controller.onSelectedSex(value!);
                          }),
                      TextCustomized(text: "Trả về nhà cung cấp"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 0,
                          groupValue: 1,
                          activeColor: Colors.black,
                          onChanged: (int? value) {
                            //controller.onSelectedSex(value!);
                          }),
                      TextCustomized(text: "Lưu kho"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(
                            text: NOTES_IN_CART, weight: FontWeight.w700),
                        SizedBox(height: 5),
                        TextFieldCustomized(
                          //textController: controller.nameController,
                          hint: NOTES_IN_CART,
                          maxLine: 5,
                          height: 100,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          // textController: controller.usernameController,
                        ),
                        SizedBox(height: 5),
                        // controller.nameValid == false
                        //     ? TextCustomized(text: controller.nameError.toString(), color: Colors.red,)
                        //     : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ButtonCustomized(
                      "Lưu",
                      backgroundColor: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
