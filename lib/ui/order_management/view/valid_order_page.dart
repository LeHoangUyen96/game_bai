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
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/datepicker_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class ValidOrderDeliveryPage extends GetView<ValidOrderController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<ValidOrderController>(
        init: ValidOrderController(),
        builder: (value) => Scaffold(
          body:   buildBody(),
          bottomNavigationBar: controller.checkAction == true ? _buildBottomNav() : null,
          backgroundColor: GRAY_BG,
        )

    );

  }
  Widget buildBody(){
    return Container(
      //width: double.infinity,
      //height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        controller.onCheckAction();
                      },
                      child: controller.checkAction == false ?
                      Container(child: TextCustomized(text: "Thao tác", size: 14, color: Colors.black, weight: FontWeight.w500,))
                          : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
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
                                        top: BorderSide(width: 1.0, color: Colors.grey),
                                        left: BorderSide(width: 1.0, color: Colors.grey),
                                        right: BorderSide(width: 1.0, color: Colors.grey),
                                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                                      ),
                                    ),
                                    child: Checkbox(
                                      checkColor: Colors.red,
                                      activeColor: Colors.white38,
                                      value: controller.isCheck,
                                      tristate: true,
                                      onChanged: (value) {
                                        controller.onChangeDefault();
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  TextCustomized(text: "Chọn tất cả"),
                                ],
                              ),
                            ],
                          )
                      ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      controller.onCheckFilter();
                    },
                      child: Icon(Icons.filter_alt, color: Colors.black,)
                  )
                ],
              ),
            ),
            controller.checkFilter == true ?
            Container(
              color: Colors.white,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                              padding: EdgeInsets.only(right: 5),
                              child: DatepickerCustomized()
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          flex: 5,
                          child:  Container(
                            padding: EdgeInsets.only(left: 5),
                              child: DatepickerCustomized()
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        TextCustomized(text: "Huỷ",),
                        Spacer(),
                        TextCustomized(text: "Xác nhận",),
                      ],
                    ),
                    // Container(
                    //   height: 200,
                    //   child: CupertinoDatePicker(
                    //       mode: CupertinoDatePickerMode.date,
                    //       onDateTimeChanged: (dateTime) {
                    //       }
                    //   ),
                    // ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DatePickerWidget(
                        looping: false, // default is not looping
                        firstDate: DateTime(1990, 01, 01),
                        lastDate: DateTime(2030, 1, 1),
                        initialDate: DateTime(1991, 10, 12),
                        dateFormat: "dd-MMM-yyyy",
                        locale: DatePicker.localeFromString('vi'),
                        //onChange: (DateTime newDate, _) => _selectedDate = newDate,
                        pickerTheme: DateTimePickerTheme(
                          itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                          dividerColor: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      child: ButtonCustomized(
                        AUTH_CONFIRM,
                        textColor: Colors.white,
                        backgroundColor: BT_CONFIRM,
                        onTap: () {Get.back();},
                      ),

                    ),
                    SizedBox(height: 15),
                    Container(
                      child: ButtonCustomized(
                        WALLET_DEPOSIT_BTN_CANCEL,
                        textColor: Colors.black ,
                        backgroundColor: Colors.white,
                        borderColor: MAIN_BT_SAVE_ADDRESS,
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              )
            )
            : Container(),
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
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Card(
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
        ),),
        controller.checkAction == false ?
        Container()
            : Expanded(
          flex: 1,
          child: Container(
            height: 16,
            width: 16,
            // decoration: const BoxDecoration(
            //   border: Border(
            //     top: BorderSide(width: 1.0, color: Colors.grey),
            //     left: BorderSide(width: 1.0, color: Colors.grey),
            //     right: BorderSide(width: 1.0, color: Colors.grey),
            //     bottom: BorderSide(width: 1.0, color: Colors.grey),
            //   ),
            // ),
            child: Checkbox(
              checkColor: Colors.red,
              activeColor: Colors.white38,
              value: controller.isCheck,
              tristate: true,
              onChanged: (value) {
                controller.onChangeDefault();
              },
            ),
          ),
        )
      ],
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