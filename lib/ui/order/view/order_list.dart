import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_controller.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class OrderListPage extends GetView<OrderController> {
  final List<Status> listStatus  =[
    
    Status(CONSIGNMENT_COMPLETE),
    Status(CONSIGNMENT_COMPLETE_PART),
    Status(CONSIGNMENT_WAITING_ORDER),
    Status(CONSIGNMENT_ALL),

  ];
  final List listOrder = [{},{},{}];
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (value) => Scaffold(
        body:   buildBody(),
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
              padding: EdgeInsets.all(10),
              color: WHITE,
               height: 50,
             child: ListView.separated(
                           itemCount: listStatus.length,
                           separatorBuilder: (context, position) {
                           return SizedBox(width: 10,);
                           },
                           physics: const ClampingScrollPhysics(),
                           //padding: EdgeInsets.all(5.0),
                           shrinkWrap: true,
                           reverse: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index){
                              final  sta = listStatus[index]; 
                               return Container(
                                child: InkWell( 
                                 onTap: (){
                                  },
                                  child: Container( 
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                        border: Border.all(
                                        color: GRAY1,
                                        //color: controller.defaultsStatus == index ? whiteColor: greyColor,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        //color: controller.defaultsStatus == index ? bdredColor : Colors.white,
                                         color: WHITE
                                         ),
                                        child: TextCustomized(
                                         text: sta.status.toString(),
                                         //color: whiteColor,
                                         //color: controller.defaultsStatus == index ? whiteColor : greyColor,
                                         font: SanFranciscoUIText,
                                         weight: FontWeight.w700,
                                        ),
                                        ),
                                       )
                                      );
                            },
                           ),
            ),
            SizedBox(height: 15,),
             Container(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: listOrder.length,
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
Widget  _buildListOrder(){
  return Card(
    child: Container(
      padding: EdgeInsets.all(15),
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
          SizedBox(height: 5,),     
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustomized(
                text: ORDER_LIST_DELIVERY_METHOD,
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
                text: ORDER_LIST_DELIVERY_ADDRESS,
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
        ],
      ),
    ),
  );
}
  
}
 class Status {
  final  String ? status;
   Status(this.status);
  }