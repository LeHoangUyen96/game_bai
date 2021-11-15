import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_controller.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_inventory_list_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/popup_packing_order.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class OrderInventoryListPage extends GetView<OrderInventoryListController> {
  final List listInventory =[{},{},{}];
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<OrderInventoryListController>(
      init: OrderInventoryListController(),
      builder: (value) => Scaffold(
        body:   controller.orderResponse!.data!.length != 0 ? buildBody() : Container(),
        backgroundColor: MAIN_BG,
        bottomNavigationBar: _buildBottomNav(),    
        )
      );
    
  }
  Widget buildBody(){
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                controller.selectAllProduct();
              },
              child:  Container(
                color: WHITE,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child:
                  Row(
                    children: [
                      Container(
                        width: 5.0.w,
                        height: 5.0.w,
                        //margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                        decoration: BoxDecoration(
                          color: BG_WHITE,
                          border: Border.all(
                            color: TEXT_GREY_IN_CART,
                            width: 0.5.w,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(1.0.w),
                          ),
                        ),
                        child: Icon(
                            Icons.check,
                            size: 4.0.w,
                            color: controller.selectedAll == true ? MAIN_COLOR : Colors.white,
                            //color: MAIN_COLOR
                        ),
                      ),
                      SizedBox(width: 10),
                      TextCustomized(
                        text: SELECT_ALL_SHOPPING,
                        font: SanFranciscoText,
                        size: 16,
                        color: TEXT_ON_WHITE_BG_COLOR,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),

                ),
              ),
            ),
            Container(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.orderResponse!.data!.length,
                itemBuilder: (BuildContext context, int index ){
                  return _buildListInventory(controller.orderResponse!.data![index]);
                },
                ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildListInventory(DataOrder data){
    return Card(
      child: Container( 
              color: WHITE,
              
              child: Padding(
                padding: EdgeInsets.all(15),
                child:
                  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child:  Container(
                              width: 5.0.w,
                              // color: Colors.deepOrangeAccent,
                              //height: 53.0.w,
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () {
                                   controller.onToggleSelect(data.id!);
                                },
                                child: Container(
                                  width: 5.0.w,
                                  height: 5.0.w,
                                  margin: EdgeInsets.only(top: 5.0.w),
                                  decoration: BoxDecoration(
                                    color: BG_WHITE,
                                    border: Border.all(
                                      color: TEXT_GREY_IN_CART,
                                      width: 0.5.w,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1.0),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 4.0.w,
                                    color: data.selected == true ? MAIN_COLOR : Colors.white,
                                    //color:  MAIN_COLOR ,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 8,
                            child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                        TextCustomized(
                                        text: data.bill_code.toString(),
                                        font: SanFranciscoText,
                                        weight: FontWeight.w700,
                                        color: MAIN_BLACK,
                                         ),
                                        TextCustomized(
                                        text: data.order_status_name.toString(),
                                        font: SanFranciscoText,
                                        weight: FontWeight.w400,
                                        color: BG_ID_PD,
                                        ),
                                    ],
                                    ),
                                    SizedBox(height: 5,),
                                 TextCustomized(
                                 text: data.created_at.toString(),
                                 font: SanFranciscoTextLight,
                                 weight: FontWeight.w400,
                                 color: MAIN_GRAY,
                                 ),
                                SizedBox(height: 5,),
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
                                    text: data.number_package.toString(),
                                    font: SanFranciscoText,
                                    weight: FontWeight.w400,
                                    color: BLACK,
                                     ),
                                 ],
                                 ),
                                SizedBox(height: 5,),
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
                                          text: data.item.toString(),
                                           font: SanFranciscoText,
                                          weight: FontWeight.w400,
                                           color: BLACK,
                                       ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextCustomized(
                                      text: ORDER_LIST_PACKING_FORM,
                                      font: SanFranciscoTextLight,
                                      weight: FontWeight.w700,
                                      color: GRAY1,
                                      ),
                                      TextCustomized(
                                      text: data.packing_form.toString(),
                                      font: SanFranciscoText,
                                      weight: FontWeight.w400,
                                      color: BLACK,
                                      ),
                                  ],
                                ),
                                SizedBox(height: 5,),
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
                                      text: "¥"+data.transport_fee.toString(),
                                      font: SanFranciscoText,
                                      weight: FontWeight.w400,
                                      color: BLACK,
                                      ),
                                  ],
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),
                
              ),
            ),
    );
  }

  Widget _buildBottomNav(){
    return Container(
      height: 80,
      padding: EdgeInsets.all(5),
       decoration:  BoxDecoration(
         color: WHITE,
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(20),
           topRight: Radius.circular(20),
         ),
         boxShadow: [
               BoxShadow(
             color: Colors.grey.withOpacity(0.5),
              spreadRadius: 6,
              blurRadius: 3,
               offset: Offset(0, 3), // changes position of shadow
            ),
            ],
       ),
        child: InkWell(
          onTap: (){
            for (var i = 0; i < controller.orderResponse!.data!.length; i++) {
              if (controller.orderResponse!.data![i].selected == true) {
                controller.listOrderId.add(controller.orderResponse!.data![i].id!);
              }
            }
            Get.dialog(PackingOrderWidget(listOrderId: controller.listOrderId,)).then((value){
              if(value != null){
                controller.onGetListOrder();
              }
            });
            },
            child: Center(
              // widthFactor: 50,
              // heightFactor: 50,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: BT_CONFIRM,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8)
                  ),
                ),
                child : TextCustomized(
                text: ORDER_LIST_PACKING_SEND_BACK,
                color: WHITE,
                )
              ),
            ),
        ),
      
    );
  }
}