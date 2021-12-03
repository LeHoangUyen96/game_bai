import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/controller/order_management_controller.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/view/add_image_enter_warehouse_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class OrderDetailsWaitingForConfirmPage
    extends GetView<OrderManagementController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderManagementController>(
      init: OrderManagementController(),
      builder: (value) => Scaffold(appBar: buildAppBar(), body: buildBody()),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
        preferredSize: Size(double.infinity, 55),
        child: InitialWidget(
          child: Container(),
          titleAppBar: ORDER_HEADER_DETAILS,
          backgroundAppBar: Colors.black26,
          isShowBack: true,
          iconBack: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: WHITE,
            ),
          ),
        ));
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextCustomized(
                              text: "Số điện thoại",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w700,
                              color: GRAY1,
                            ),
                            TextCustomized(
                              text: "0783576610",
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
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
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
                      TextCustomized(text: "Đóng gói hàng gửi về"),
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
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustomized(
                                text: "Hình thức vận chuyển",
                                weight: FontWeight.w700),
                            SizedBox(height: 5),
                            Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: MAIN_LINE),
                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButton(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: MAIN_LINE,
                                              ),
                                              iconSize: 24,
                                              elevation: 16,
                                              isExpanded: true,
                                              items: [
                                                DropdownMenuItem<String>(
                                                  value: "1",
                                                  child: Center(
                                                    child: Text(
                                                        "Chưa có hình thức vận chuyển"),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {},
                                              hint: Text("Chọn"),
                                            )

                                            // controller.mcity != null
                                            //     ? DropdownButton(
                                            //   value: controller.selectedCity != null ? controller.selectedCity : null,
                                            //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                            //   iconSize: 24,
                                            //   elevation: 16,
                                            //   isExpanded: true,
                                            //   items: controller.mcity!.map((DataCity value){
                                            //     return DropdownMenuItem<DataCity>(
                                            //       value: value,
                                            //       child: Container(
                                            //         child: Text(
                                            //           value.name.toString(),
                                            //         ),
                                            //       ),
                                            //     );
                                            //   }).toList(),
                                            //   onChanged: (DataCity? value){
                                            //     controller.onChangeCity(value!, value.id!);
                                            //   },
                                            //   hint: Text(ONCHANGE_CITY),
                                            // )
                                            //     : DropdownButton(
                                            //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                            //   iconSize: 24,
                                            //   elevation: 16,
                                            //   isExpanded: true,
                                            //   items: [
                                            //     DropdownMenuItem<String>(
                                            //       value: "1",
                                            //       child: Center(
                                            //         child: Text(NO_CITY),
                                            //       ),
                                            //     ),
                                            //   ],
                                            //   onChanged: (value){},
                                            //   hint: Text(ONCHANGE_CITY),
                                            // )
                                            ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(height: 5),
                            // controller.cityValid == false
                            //     ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
                            //     : Container(),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustomized(
                                text: "HÌnh thức đóng gói",
                                weight: FontWeight.w700),
                            SizedBox(height: 5),
                            Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: MAIN_LINE),
                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButton(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: MAIN_LINE,
                                              ),
                                              iconSize: 24,
                                              elevation: 16,
                                              isExpanded: true,
                                              items: [
                                                DropdownMenuItem<String>(
                                                  value: "1",
                                                  child: Center(
                                                    child: Text(
                                                        "Chưa có hình thức đóng gói"),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {},
                                              hint: Text(
                                                  "Chọn hình thức đóng gói"),
                                            )

                                            // controller.mcity != null
                                            //     ? DropdownButton(
                                            //   value: controller.selectedCity != null ? controller.selectedCity : null,
                                            //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                            //   iconSize: 24,
                                            //   elevation: 16,
                                            //   isExpanded: true,
                                            //   items: controller.mcity!.map((DataCity value){
                                            //     return DropdownMenuItem<DataCity>(
                                            //       value: value,
                                            //       child: Container(
                                            //         child: Text(
                                            //           value.name.toString(),
                                            //         ),
                                            //       ),
                                            //     );
                                            //   }).toList(),
                                            //   onChanged: (DataCity? value){
                                            //     controller.onChangeCity(value!, value.id!);
                                            //   },
                                            //   hint: Text(ONCHANGE_CITY),
                                            // )
                                            //     : DropdownButton(
                                            //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                            //   iconSize: 24,
                                            //   elevation: 16,
                                            //   isExpanded: true,
                                            //   items: [
                                            //     DropdownMenuItem<String>(
                                            //       value: "1",
                                            //       child: Center(
                                            //         child: Text(NO_CITY),
                                            //       ),
                                            //     ),
                                            //   ],
                                            //   onChanged: (value){},
                                            //   hint: Text(ONCHANGE_CITY),
                                            // )
                                            ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(height: 5),
                            // controller.cityValid == false
                            //     ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
                            //     : Container(),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
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
