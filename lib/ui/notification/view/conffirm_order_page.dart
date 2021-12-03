import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:viet_trung_mobile/data/response/address_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/sizes.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/address/controller/address_page_controller.dart';
import 'package:viet_trung_mobile/ui/address/view/add_address_page.dart';
import 'package:viet_trung_mobile/ui/address/view/update_address_page.dart';
import 'package:viet_trung_mobile/ui/notification/controller/confirm_order_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/popup_packing_order.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class ConfirmOrderPage extends GetView<ConfirmOrderController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmOrderController>(
        init: ConfirmOrderController(),
        builder: (value) =>InitialWidget(
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
            //child: controller.orderDetailsResponse != null ?
           child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: MAIN_BG,
              height: Get.height,
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
                    SizedBox(height: 10),
                   controller.type! == 0 ?  
                    Container(
                      child: Column(
                        children: [
                          Wrap(
                      spacing: 2.0 ,
                      children:[ 
                      TextCustomized(
                        text: "Đơn hàng mã"  ),
                      TextCustomized(
                        text:  "#" + controller.orderDetailsResponse!.dataOrderDetails!.bill_code.toString(),
                        color: COLOR_ORDER_CHINESE_WAREHOUSE,
                      ),  
                      TextCustomized(
                        text: "đã về Kho Trung Quốc. Vui lòng xác nhận và chọn 1 trong 2 phương án sau:"),
                      ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: controller.selectedType,
                                activeColor: Colors.black,
                                onChanged: (int? value){
                                  controller.onSelecteType(value!);
                                }
                            ),
                            Text("Đóng gói gửi hàng về"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: controller.selectedType,
                                activeColor: Colors.black,
                                onChanged: (int? value){
                                  controller.onSelecteType(value!);
                                }
                            ),
                            Text("Lưu kho"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10
                    ),
                    _bodySelectedForm(),
                    SizedBox(
                        height: 25
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ButtonCustomized(
                        AUTH_CONFIRM,
                        textColor: Colors.white,
                        backgroundColor: BT_CONFIRM,
                        onTap: (){
                          controller.onConfirmOrder();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                        ],
                      ),
                    )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: WHITE 
                        ),
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
                              SizedBox(height: 20,),
                            ListView.builder(
                              itemCount: controller.orderDetailsResponse!.dataOrderDetails!.order_journey!.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, index){
                                return _buildListJourney(index);
                              }
                              ),
                          ],
                        ),
                      ),
                    // Wrap(
                    //   spacing: 2.0 ,
                    //   children:[ 
                    //   TextCustomized(
                    //     text: "Đơn hàng mã"  ),
                    //   TextCustomized(
                    //     text:  "#" + controller.orderDetailsResponse!.dataOrderDetails!.bill_code.toString(),
                    //     color: COLOR_ORDER_CHINESE_WAREHOUSE,
                    //   ),  
                    //   TextCustomized(
                    //     text: "đã về Kho Trung Quốc. Vui lòng xác nhận và chọn 1 trong 2 phương án sau:"),
                    //   ]
                    // ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Radio(
                    //             value: 1,
                    //             groupValue: controller.selectedType,
                    //             activeColor: Colors.black,
                    //             onChanged: (int? value){
                    //               controller.onSelecteType(value!);
                    //             }
                    //         ),
                    //         Text("Đóng gói gửi hàng về"),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Radio(
                    //             value: 2,
                    //             groupValue: controller.selectedType,
                    //             activeColor: Colors.black,
                    //             onChanged: (int? value){
                    //               controller.onSelecteType(value!);
                    //             }
                    //         ),
                    //         Text("Lưu kho"),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10
                    // ),
                    // _bodySelectedForm(),
                    // SizedBox(
                    //     height: 25
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: ButtonCustomized(
                    //     AUTH_CONFIRM,
                    //     textColor: Colors.white,
                    //     backgroundColor: BT_CONFIRM,
                    //     onTap: (){
                    //       controller.onConfirmOrder();
                    //     },
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 50,
                    // ),
                  ],
                ),
              ),
           )
            //): LoadingSpinKit(),
        )

    );
  }



  Widget _bodyInfo(){
     final Color color;
    color = controller.ColorStatusName(controller.orderDetailsResponse!.dataOrderDetails!.order_status_name.toString());
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      color:  BLACK ,
      borderType: BorderType.Rect,
      padding: EdgeInsets.all(1),
      // corner: FDottedLineCorner.all(6.0),
      // strokeWidth: 1.0,
      // dottedLength: 6.0,
      // space: 8.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: Get.height*0.28,
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
                          size: 14,),
                        SizedBox(height: 10),
                        TextCustomized(
                          text: controller.orderDetailsResponse!.dataOrderDetails!.created_at.toString(), 
                          size: 10,
                          color: TEXT_DATETIME_NT
                          )
                      ],
                    )
                ),
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
                    )
                ),
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
                        TextCustomized(
                          text: "Số kiện hàng", 
                          size: 14)
                      ],
                    )
                ),
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
                    )
                ),
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
                        TextCustomized(
                          text: "Mặt hàng", 
                          size: 14)
                      ],
                    )
                ),
                Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                          text: controller.orderDetailsResponse!.dataOrderDetails!.item!.toString(),
                          color: BLACK_1,
                          weight: FontWeight.w600, 
                          size: 14)
                      ],
                    )
                ),
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
                    )
                ),
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
                    )
                ),
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
                        TextCustomized(text: "Thu hộ phí vận chuyển (COD):", size: 14)
                      ],
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(
                          text: "¥"+controller.orderDetailsResponse!.dataOrderDetails!.transport_fee.toString(),
                          color: BLACK_1,
                          weight: FontWeight.w600, 
                          size: 14)
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }

  Widget _bodySelectedForm(){
    return Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustomized(text: "Ghi chú", weight: FontWeight.w700),
              SizedBox(height: 5),
              TextFieldCustomized(
                textController: controller.noteValueController,
                hint: NOTES_IN_CART,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 5),
            ],
          ),
          SizedBox(height: 16),
       
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustomized(text: "Địa chỉ nhận hàng", weight: FontWeight.w700),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0,color: MAIN_LINE),
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: 
                            controller.mdataAddress != null
                                ? DropdownButton(
                              value: controller.selectAddress != null ? controller.selectAddress : null,
                              icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              items: controller.mdataAddress!.map((DataAddress value){
                                return DropdownMenuItem<DataAddress>(
                                  value: value,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: TextCustomized(
                                     text: value.full_address.toString(),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (DataAddress? value){
                                controller.onChangeAddress(value!, value.id!);
                              },
                              hint: Text("Chọn địa chỉ"),
                            )
                                : DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              items: [
                                DropdownMenuItem<String>(
                                  value: "1",
                                  child: Center(
                                    child: Text("Chưa có địa chỉ"),
                                  ),
                                ),
                              ],
                              onChanged: (value){},
                              hint: Text("Chọn địa chỉ"),
                            )
                          ),
                        ),
                    ],
                  )
              ),
              SizedBox(height: 5),
              // controller.cityValid == false
              //     ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
              //     : Container(),
            ],
          ),

         
        ],
      ),
    );
  }
   Widget _buildListJourney(index){
   return Center(
     child: TimelineTile(
               isFirst: index == 0,
               isLast: index == controller.orderDetailsResponse!.dataOrderDetails!.order_journey!.length -1,
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
                child:  TextCustomized(
                            text: controller.orderDetailsResponse!.dataOrderDetails!.order_journey![index].status_name.toString(),
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
                  text: controller.orderDetailsResponse!.dataOrderDetails!.order_journey![index].created_at.toString(),
                  font: SanFranciscoTextLight,
                  size: smallSize,
                  weight: FontWeight.w400,
                  color: BT_GRAY,
                  ),
              ),
              
            ),
   );
 }


  
}