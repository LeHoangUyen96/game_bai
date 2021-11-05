import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_controller.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_inventory_list_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
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
        body:   buildBody(),
        backgroundColor: GRAY_BG,
        bottomNavigationBar: _buildBottomNav(),    
        ) 
               
      );
    
  }
  Widget buildBody(){
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: WHITE,
                ),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Expanded(
                       flex: 1,
                       child: InkWell(
                         onTap: (){},
                         child: SvgPicture.asset(
                           IC_SEARCH,
                           height: 20,
                           width: 20,
                           ),
                       ),
                     ),
                     Expanded(
                       flex: 6,
                       child: TextField(
                         decoration: InputDecoration(
                            border: InputBorder.none,
                           hintText: ORDER_LIST_SEARCH_BILL_CODE,
                           hintStyle: TextStyle(
                             fontFamily: SanFranciscoTextLight,
                             fontWeight: FontWeight.w400,
                             color: GRAY
                           ),
                         ),
                          
                       ),
                     ),
                      Expanded(
                        flex: 1,
                       child: InkWell(
                         onTap: (){},
                         child: SvgPicture.asset(
                           IC_FILTER,
                           height: 18,
                           width: 18,
                           ),
                       ),
                     ),
                   ],
                 ),
              ),
            ),
            Container( 
              color: WHITE,
              child: Padding(
                padding: EdgeInsets.all(20),
                child:
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
                          SizedBox(width: 10.0),
                          TextCustomized(
                            text: ORDER_LIST_SELECT_ALL,
                            font:SanFranciscoUIText,
                            weight: FontWeight.w700,
                            color: MAIN_BLACK,
                            ),
                        ],
                      ),
                
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: listInventory.length,
                itemBuilder: (BuildContext context, int index ){
                  return _buildListInventory();
                },
                ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildListInventory(){
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
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                // border: Border(
                                //   top: BorderSide(width: 1.0, color: Colors.grey),
                                //   left: BorderSide(width: 1.0, color: Colors.grey),
                                //   right: BorderSide(width: 1.0, color: Colors.grey),
                                //   bottom: BorderSide(width: 1.0, color: Colors.grey),
                                // ),
                              ),
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(3),
                                 ),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                //fillColor: MaterialStateProperty.all(GRAY1),
                                checkColor: Colors.red,
                                activeColor: WHITE,
                                value: controller.isCheck,
                                tristate: true,
                                onChanged: (value) {
                                  controller.onChangeDefault();
                                },
                              ),
                            ),
                          ),
                          // Theme(
                          // data: ThemeData(unselectedWidgetColor: Colors.red),
                          // child: Checkbox(
                          //   value: controller.isCheck, 
                          //   tristate: false, 
                          //   onChanged: ( value) {
                          //     controller.onChangeDefault();
                          //   },
                          //   )),
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
                            text: '#DH0123456',
                            font: SanFranciscoText,
                            weight: FontWeight.w700,
                            color: MAIN_BLACK,
                             ),
                            TextCustomized(
                            text: 'Kho Cửa Khẩu',
                            font: SanFranciscoText,
                            weight: FontWeight.w400,
                            color: BG_ID_PD,
                            ),
                            ],
                            ),
                            SizedBox(height: 5,),
                         TextCustomized(
                         text: '10:10 21/10/2021',
                         font: SanFranciscoTextLight,
                         weight: FontWeight.w400,
                         color: MAIN_GRAY,
                         ),
                        SizedBox(height: 5,),     
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        TextCustomized(
                        text: ORDER_LIST_BILL_CODE,
                        font: SanFranciscoTextLight,
                        weight: FontWeight.w700,
                        color: GRAY1,
                        ),
                        TextCustomized(
                        text: ORDER_NULL,
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
                        text: ORDER_LIST_PARCELS,
                        font: SanFranciscoTextLight,
                        weight: FontWeight.w700,
                        color: GRAY1,
                        ),
                        TextCustomized(
                        text: ORDER_NULL,
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
                            text: ORDER_NULL,
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
                text: ORDER_NULL,
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
                text: ORDER_NULL,
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
      //height: 80,
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
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ButtonCustomized(
            ORDER_LIST_PACKING_SEND_BACK,
            
          ),
        ),
      
    );
  }
}