import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/list_order_add_bag_controller.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class AddProductToBagDialog extends GetView<ListOrderAddToBagController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListOrderAddToBagController>(
        init: ListOrderAddToBagController(),
        builder: (value) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: 
      controller.listOrderAddBagResponse != null ?
        GestureDetector(
        onTap: () {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
        },
        child:  Container(
          height: Get.height * 0.8,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: BT_CONFIRM,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: TextCustomized(
                          text: MANAGE_PACKAGE_MOVE_GOOD,
                          color: WHITE,
                          font: SanFranciscoUIText,
                          weight: FontWeight.w500,
                          size: largeSize,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.close_outlined,
                        color: WHITE,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                color: WHITE,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: WHITE,
                        border: Border.all(color: GRAY),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            controller.onSearchBillCode();
                          },
                          child: SvgPicture.asset(
                            IC_SEARCH,
                            width: Get.width * 0.1 - 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller.searchBillCodeController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: MANAGE_PACKAGE_SEARCH_BAG,
                              hintStyle: TextStyle(
                                  color: GRAY, fontFamily: SanFranciscoUIText),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return buildListProduct(controller.listOrderAddBagResponse!.data![index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.listOrderAddBagResponse!.data!.length,
                    padding: EdgeInsets.all(0.0),
                    shrinkWrap: true,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ButtonCustomized(
                  BANKPICKER_BTN_ADD,
                  textColor: WHITE,
                  backgroundColor: BT_CONFIRM,
                  onTap: () {
                    controller.onAddBag();
                  },
                ),
              ),
            ],
          ),
        ),
      )
      : LoadingSpinKit(),
    )
    );
  }

  Widget buildListProduct(DataListOrderAddBagResponse data) {
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
                            text: data.bill_code.toString(),
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
                        text: data.name_customer.toString(),
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
                        text: data.number_package_remain.toString(),
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
                      hintText: data.number_package_remain.toString(),
                      hintStyle: TextStyle(
                        color: BT_GRAY,
                        fontFamily: SanFranciscoTextLight,
                        fontSize: smallSize
                      ),
                    ),
                    //maxLength: 4, 
                    onChanged: (val){
                          controller.number_package = int.parse(val,onError: (val) => -1) ;
                          //controller.numberPackageController = TextEditingController(text: val);
                          controller.order_id = data.id;
                          print('onchange ${controller.numberPackageController}');
                        },
                    onSubmitted: (val){
                      controller.number_package = int.parse(val,onError: (val) => -1) ;
                      //controller.numberPackageController = TextEditingController(text: val);
                      controller.onChangeNumberPackage(controller.numberPackageController.text, data.id!);
                      //controller.order_id = data.id;
                      print('----------onchange ${controller.number_package}');
                    },
                    
                    keyboardType: TextInputType.number,
                    controller: controller.numberPackageController,
                  ),
                )
                          

          ]
        ),
        ]
      ),
          
    );
  }
}

