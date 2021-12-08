import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/controller/order_management_controller.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/view/add_image_enter_warehouse_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class OrderDetailsAdminPage extends GetView<OrderManagementController> {
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
        titleAppBar: ORDER_LIST_APP_BAR,
        backgroundAppBar: Colors.black26,
        isShowBack: false,
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
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextCustomized(
                      text: infoOrder,
                      size: 16,
                      weight: FontWeight.w700,
                      color: Colors.black,
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
                              text: customer,
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
                              text: MANAGE_PACKAGE_SURCHARGE,
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
                    text: ADMIN_IMG,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 16,
                          width: 16,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.0, color: Colors.red),
                              left: BorderSide(width: 1.0, color: Colors.red),
                              right: BorderSide(width: 1.0, color: Colors.red),
                              bottom: BorderSide(width: 1.0, color: Colors.red),
                            ),
                          ),
                          child: Checkbox(
                            checkColor: Colors.red,
                            activeColor: Colors.white38,
                            value: true,
                            tristate: true,
                            onChanged: (value) {
                              //controller.onChangeDefault();
                            },
                          ),
                        ),
                        SizedBox(width: 10.0),
                        TextCustomized(
                          text: ADMIN_ITEM_CANNOT_SHIP,
                          font: SanFranciscoUIText,
                          weight: FontWeight.w700,
                          color: MAIN_BLACK,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ButtonCustomized(
                      "Lưu",
                      backgroundColor: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: WHITE,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: TextCustomized(
                      text: orderJourney,
                      size: 16,
                      font: SanFranciscoText,
                      weight: FontWeight.w700,
                      color: BLACK,
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 0.5,
                    color: GRAY1,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        TimelineTile(
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
                          beforeLineStyle:
                              LineStyle(color: BT_GRAY, thickness: 2),
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
                                SizedBox(
                                  height: 50,
                                ),
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
                      ],
                    ),
                  ),
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

// Container(
//               color: WHITE,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                             flex: 5,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 TextCustomized(
//                                   text: "Kg",
//                                   size: 14,
//                                   font: SanFranciscoText,
//                                   weight: FontWeight.w700,
//                                   color: BLACK,
//                                 ),
//                                 SizedBox(height: 10),
//                                 TextFieldCustomized(
//                                   hint: "3.0 kg",
//                                 ),
//                               ],
//                             )),
//                         SizedBox(width: 5),
//                         Expanded(
//                             flex: 5,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 TextCustomized(
//                                   text: "M3",
//                                   size: 14,
//                                   font: SanFranciscoText,
//                                   weight: FontWeight.w700,
//                                   color: BLACK,
//                                 ),
//                                 SizedBox(height: 10),
//                                 TextFieldCustomized(
//                                   hint: "Nhập M3",
//                                 ),
//                               ],
//                             ))
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     ButtonCustomized(
//                       "Lưu",
//                       backgroundColor: BT_CONFIRM,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               color: WHITE,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextCustomized(
//                       text: "Trạng thái giao hàng",
//                       size: 16,
//                       font: SanFranciscoText,
//                       weight: FontWeight.w700,
//                       color: BLACK,
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                         width: Get.width,
//                         decoration: BoxDecoration(
//                             border: Border.all(width: 1.0, color: MAIN_LINE),
//                             borderRadius: BorderRadius.circular(9),
//                             color: Colors.white),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: DropdownButtonHideUnderline(
//                                 child: ButtonTheme(
//                                     alignedDropdown: true,
//                                     child: DropdownButton(
//                                       icon: Icon(
//                                         Icons.keyboard_arrow_down,
//                                         color: MAIN_LINE,
//                                       ),
//                                       iconSize: 24,
//                                       elevation: 16,
//                                       isExpanded: true,
//                                       items: [
//                                         DropdownMenuItem<String>(
//                                           value: "1",
//                                           child: Center(
//                                             child: Text(
//                                                 "Chưa có trạng thái giao hàng"),
//                                           ),
//                                         ),
//                                       ],
//                                       onChanged: (value) {},
//                                       hint: Text("Chưa giao"),
//                                     )),
//                               ),
//                             ),
//                           ],
//                         )),
//                     SizedBox(height: 10),
//                     ButtonCustomized(
//                       "Lưu",
//                       backgroundColor: BT_CONFIRM,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               color: WHITE,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                     child: TextCustomized(
//                       text: orderJourney,
//                       size: 16,
//                       font: SanFranciscoText,
//                       weight: FontWeight.w700,
//                       color: BLACK,
//                     ),
//                   ),
//                   Container(
//                     width: Get.width,
//                     height: 0.5,
//                     color: GRAY1,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(top: 10, bottom: 10),
//                     child: Column(
//                       children: [
//                         TimelineTile(
//                           isFirst: true,
//                           alignment: TimelineAlign.manual,
//                           lineXY: 0.4,
//                           indicatorStyle: IndicatorStyle(
//                             color: Colors.green,
//                             height: 10,
//                             width: 10,
//                             drawGap: false,
//                             indicatorXY: 0,
//                           ),
//                           beforeLineStyle:
//                               LineStyle(color: BT_GRAY, thickness: 2),
//                           endChild: Container(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 TextCustomized(
//                                   text: "Kho Trung Quốc, đang đóng hàng về",
//                                   font: SanFranciscoTextLight,
//                                   weight: FontWeight.w400,
//                                   color: Colors.green,
//                                 ),
//                                 SizedBox(
//                                   height: 50,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           startChild: Container(
//                             child: Container(
//                               alignment: const Alignment(0.7, -0.800),
//                               child: TextCustomized(
//                                 text: "11/11/2021",
//                                 font: SanFranciscoTextLight,
//                                 weight: FontWeight.w400,
//                                 color: MAIN_GRAY,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),
