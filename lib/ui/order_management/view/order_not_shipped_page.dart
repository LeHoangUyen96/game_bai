import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/controller/valid_order_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/view/order_not_shipped_detai_page.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class OrderNotShippedPage extends GetView<ValidOrderController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ValidOrderController>(
        init: ValidOrderController(),
        builder: (value) => Scaffold(
              appBar: buildAppBar("Đơn hàng không vận chuyển được"),
              body: buildBody(),
              backgroundColor: GRAY_BG,
            ));
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextCustomized(
              text: "Tổng đơn: 15",
              size: 14,
              font: SanFranciscoText,
              weight: FontWeight.w700,
              color: BLACK,
            ),
          ),
          SizedBox(height: 5),
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder();
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
  // Widget  _buildListOrder(DataOrder dataOrder){
  //   return Card(
  //     child: Container(
  //       padding: EdgeInsets.all(15),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               TextCustomized(
  //                 text: dataOrder.bill_code.toString(),
  //                 font: SanFranciscoText,
  //                 weight: FontWeight.w700,
  //                 color: MAIN_BLACK,
  //               ),
  //               TextCustomized(
  //                 text: dataOrder.order_status_name.toString(),
  //                 font: SanFranciscoText,
  //                 weight: FontWeight.w400,
  //                 color: BG_ID_PD,
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 5,),
  //           TextCustomized(
  //             text: dataOrder.created_at.toString(),
  //             font: SanFranciscoTextLight,
  //             weight: FontWeight.w400,
  //             color: MAIN_GRAY,
  //           ),
  //           SizedBox(height: 5,),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               TextCustomized(
  //                 text: ORDER_LIST_PARCELS,
  //                 font: SanFranciscoTextLight,
  //                 weight: FontWeight.w700,
  //                 color: GRAY1,
  //               ),
  //               TextCustomized(
  //                 text: dataOrder.number_package.toString(),
  //                 font: SanFranciscoText,
  //                 weight: FontWeight.w400,
  //                 color: BLACK,
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 5,),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               TextCustomized(
  //                 text: ORDER_LIST_ITEMS,
  //                 font: SanFranciscoTextLight,
  //                 weight: FontWeight.w700,
  //                 color: GRAY1,
  //               ),
  //               TextCustomized(
  //                 text: dataOrder.item.toString(),
  //                 font: SanFranciscoText,
  //                 weight: FontWeight.w400,
  //                 color: BLACK,
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 5,),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               TextCustomized(
  //                 text: ORDER_LIST_PACKING_FORM,
  //                 font: SanFranciscoTextLight,
  //                 weight: FontWeight.w700,
  //                 color: GRAY1,
  //               ),
  //               TextCustomized(
  //                 text: dataOrder.packing_form.toString(),
  //                 font: SanFranciscoText,
  //                 weight: FontWeight.w400,
  //                 color: BLACK,
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 5,),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               TextCustomized(
  //                 text: ORDER_LIST_COD,
  //                 font: SanFranciscoTextLight,
  //                 weight: FontWeight.w700,
  //                 color: GRAY1,
  //               ),
  //               TextCustomized(
  //                 text: "¥"+dataOrder.transport_fee.toString(),
  //                 font: SanFranciscoText,
  //                 weight: FontWeight.w400,
  //                 color: BLACK,
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 5,),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextCustomized(
  //                 text: ORDER_LIST_DELIVERY_METHOD,
  //                 font: SanFranciscoTextLight,
  //                 weight: FontWeight.w700,
  //                 color: GRAY1,
  //               ),
  //               Expanded(
  //                 flex: 5,
  //                 child: TextCustomized(
  //                   text: dataOrder.delivery_form.toString(),
  //                   font: SanFranciscoText,
  //                   weight: FontWeight.w400,
  //                   color: BLACK,
  //                   textAlign: TextAlign.end,
  //                 ),
  //               )
  //             ],
  //           ),
  //           SizedBox(height: 5,),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextCustomized(
  //                 text: ORDER_LIST_DELIVERY_ADDRESS,
  //                 font: SanFranciscoTextLight,
  //                 weight: FontWeight.w700,
  //                 color: GRAY1,
  //               ),
  //               Expanded(
  //                 flex: 5,
  //                 child:  TextCustomized(
  //                   text: dataOrder.address.toString(),
  //                   font: SanFranciscoText,
  //                   weight: FontWeight.w400,
  //                   color: BLACK,
  //                   textAlign: TextAlign.end,
  //                 ),),
  //
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildListOrder() {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: controller.checkAction == false ? 10 : 0, vertical: 5),
      elevation: 20,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      borderOnForeground: true,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => OrderDetailNotShippedPage());
                  },
                  child: TextCustomized(
                    text: "211003TODWE4MD",
                    font: SanFranciscoText,
                    weight: FontWeight.w700,
                    color: MAIN_BLACK,
                  ),
                ),
                TextCustomized(
                  text: "Kho Trung Quốc",
                  font: SanFranciscoText,
                  weight: FontWeight.w400,
                  color: BLUE,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustomized(
                  text: "Yêu cầu: ",
                  font: SanFranciscoTextLight,
                  weight: FontWeight.w700,
                  color: GRAY1,
                ),
                Spacer(),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextCustomized(
                        text: "Trả về nhà cung cấp",
                        font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: BLACK,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
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
                  color: RED_2,
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
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 50,
      //padding: EdgeInsets.symmetric(horizontal: 10),
      // decoration:  BoxDecoration(
      //   color: WHITE,
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(20),
      //     topRight: Radius.circular(20),
      //   ),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.5),
      //       spreadRadius: 6,
      //       blurRadius: 3,
      //       offset: Offset(0, 3), // changes position of shadow
      //     ),
      //   ],
      // ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {},
              child: Center(
                // widthFactor: 50,
                // heightFactor: 50,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: GRAY4,
                      // borderRadius: BorderRadius.all(
                      //     Radius.circular(8)
                      // ),
                    ),
                    child: Center(
                      child: TextCustomized(
                        text: BT_CANCEL,
                        color: WHITE,
                      ),
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {},
              child: Center(
                // widthFactor: 50,
                // heightFactor: 50,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: BT_CONFIRM,
                      // borderRadius: BorderRadius.all(
                      //     Radius.circular(8)
                      // ),
                    ),
                    child: Center(
                      child: TextCustomized(
                        text: CREATE_ORDER,
                        color: WHITE,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Status {
  final String? status;
  Status(this.status);
}
