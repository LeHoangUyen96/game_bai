import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/controller/valid_order_controller.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/view/order_detail_waitting_for_confirm_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/datepicker_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class OrderWaittingForConfirmPage extends GetView<ValidOrderController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<ValidOrderController>(
        init: ValidOrderController(),
        builder: (value) => Scaffold(
          appBar: buildAppBar(),
          body:   buildBody(),
          //bottomNavigationBar: controller.checkAction == true ? _buildBottomNav() : null,
          backgroundColor: GRAY_BG,
        )

    );
  }


  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: InitialWidget(
        child: Container(),
        titleAppBar: "Đơn hàng chờ xác nhận",
        backgroundAppBar: Colors.black26,
        isShowBack: true,
        iconBack:  InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: WHITE,),
        ),
        isAdd: true,
        iconAdd: Container(
          padding: EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.search, color: WHITE,),
          ),
        ),
      ),
    );
  }


  Widget buildBody(){
    return Container(
      //width: double.infinity,
      //height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
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
            Container(
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return _buildListOrder();
                  },
                ),
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
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

  Widget  _buildListOrder(){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: controller.checkAction == false ? 10 : 0, vertical: 5),
      elevation: 20,
      shape: RoundedRectangleBorder(
          side:  BorderSide(color: Colors.white,width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
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
                  onTap: (){
                    Get.to(()=> OrderDetailsWaitingForConfirmPage());
                  },
                  child: TextCustomized(
                    text: "211003TODWE4MD",
                    font: SanFranciscoText,
                    weight: FontWeight.w700,
                    color: MAIN_BLACK,
                  ),
                ),
                TextCustomized(
                  text: "Chờ xác nhận",
                  font: SanFranciscoText,
                  weight: FontWeight.w400,
                  color: TEXT_ORDER_W_CONFIRM,
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
    );
  }

  Widget _buildBottomNav(){
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
              onTap: (){},
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
                    child : Center(
                      child: TextCustomized(
                        text: BT_CANCEL,
                        color: WHITE,
                      ),
                    )
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: (){},
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
                    child : Center(
                      child: TextCustomized(
                        text: CREATE_ORDER,
                        color: WHITE,
                      ),
                    )
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }

}
class Status {
  final  String ? status;
  Status(this.status);
}