
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/models/order_item_add_to_bag.dart';
import 'package:viet_trung_mobile/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

typedef NumberOderCallback = void Function(int id, String val);


class ItemOrder extends StatelessWidget {
  const ItemOrder({
    required this.dataOrderAddBag,
    this.numberPackage,
    this.id,
    this.bill_code,
    this.number_package_remain,
    this.item, 
    this.packing_form, 
    this.transport_fee, 
    this.surcharge,

   
  });


  final NumberOderCallback? numberPackage;
  final int? id;
  final DataListOrderAddBagResponse dataOrderAddBag; 
  final String? bill_code;
  final String? packing_form;
  final int? number_package_remain;
  final double? transport_fee;
  final double? surcharge;
  final String? item;

  @override
  Widget build(BuildContext context) {

    TextEditingController numberOrderController = TextEditingController();

    return Container(
      width: Get.width,
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: BT_GRAY))),
      padding: EdgeInsets.symmetric(vertical: 5),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
          children:[
           Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[  
                          TextCustomized(
                            text: dataOrderAddBag.bill_code.toString(),
                            font: SanFranciscoText,
                            weight: FontWeight.w700,
                            color: MAIN_BLACK,
                            size: normalSize,
                          ),
                          
                        // Spacer(),
                        // Container(
                        //     width: 50,
                        //     height: 30,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       border: Border.all(
                        //         color: BT_GRAY
                        //       )
                        //     ),
                        //     padding: EdgeInsets.symmetric(horizontal: 15),
                        //     child: Center(
                        //       child: TextField(
                                
                        //         onChanged: (val){
                        //          controller.number_package = ParseNumber.parseInt(val);
                        //          controller.order_id = data.id;
                        //          print('onchange ${controller.number_package}');
                        //         },
                        //         onSubmitted: (val){
                        //          controller.number_package = ParseNumber.parseInt(val);
                        //          controller.order_id = data.id;
                        //          print('onchange ${controller.number_package}');
                        //         },
                        //         controller: controller.numberPackageController,
                        //         decoration: InputDecoration(
                        //           border: InputBorder.none,
                        //           hintText: data.number_package_remain.toString(),
                        //           hintStyle: TextStyle(
                        //               color: GRAY,
                        //               fontSize: smallSize, 
                        //               fontFamily: SanFranciscoUIText
                        //               ),
                        //         ),
                        //       ),
                        //     ),
                        // )
                        ]
                      ), 
                    SizedBox(height: 5),
                    Wrap(spacing: 5.0, children: [
                      TextCustomized(
                        text: MANAGE_PACKAGE_CUSTOMER_NAME,
                        font: SanFranciscoUIText,
                        weight: FontWeight.w400,
                        color: MAIN_BLACK,
                        size: smallSize,
                      ),
                      TextCustomized(
                        text: dataOrderAddBag.name_customer.toString(),
                        font: SanFranciscoUIText,
                        weight: FontWeight.w400,
                        color: MAIN_BLACK,
                        size: smallSize,
                      ),
                    ]),
                    SizedBox(height: 5),
                    Wrap(spacing: 5.0, children: [
                      TextCustomized(
                        text: DELIVERY_NOTE_NUMBER_PARCEL_HD,
                        font: SanFranciscoUIText,
                        weight: FontWeight.w400,
                        color: MAIN_BLACK,
                        size: smallSize,
                      ),
                      TextCustomized(
                        text: dataOrderAddBag.number_package_remain.toString(),
                        font: SanFranciscoUIText,
                        weight: FontWeight.w400,
                        color: MAIN_BLACK,
                        size: smallSize,
                      ),
                    ]),
                  ],
                ),
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: BT_GRAY),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: BLACK,
                      fontSize: customSize,
                      fontFamily: SanFranciscoUIText,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: dataOrderAddBag.number_package_remain.toString(),
                      hintStyle: TextStyle(
                        color: BT_GRAY,
                        fontFamily: SanFranciscoTextLight,
                        fontSize: smallSize
                      ),
                    ),
                    //maxLength: 4, 
                    onChanged: (val){
                          this.numberPackage!(id!, val);
                        },
                    onSubmitted: (val){
                     this.numberPackage!(id!, val);
                    },
                    
                    keyboardType: TextInputType.number,
                    controller: numberOrderController,
                  ),
                )
                          

          ]
        ),
        ]
      ),
          
    );
  }
}
