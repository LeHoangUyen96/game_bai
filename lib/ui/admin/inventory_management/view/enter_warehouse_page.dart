import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/controller/enter_warehouse_controller.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/view/add_image_enter_warehouse_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class EnterWarehousePage extends GetView<EnterWarehouseController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<EnterWarehouseController>(
      init: EnterWarehouseController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(child: buildBody()),
        //body: buildBody(),
        backgroundColor: WHITE,
      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        title: TextCustomized(
          text: ADMIN_ENTER_WAREHOUSE,
          color: WHITE,
          font: SanFranciscoText,
          isCenter: true,
          ),
        flexibleSpace: Image(
          image: AssetImage(BG_IMG),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: WHITE,),
        ),
      ),
    );
  }
  Widget buildBody(){
    return  GestureDetector(
      onTap: () {
        FocusScope.of(Get.context!).requestFocus(FocusNode());
      },
      child: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           DottedBorder(
            dashPattern: [10, 4],
            strokeWidth: 2,
            color:  GRAY ,
            radius: Radius.circular(20),
            borderType: BorderType.RRect, 
            child:  Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: GRAY7,
                borderRadius: BorderRadius.circular(15),
              ),
              
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: ADMIN_CUSTOMER_CODE,
                          font: SanFranciscoText,
                          color: BLACK,
                          size: normalSize,
                          weight: FontWeight.w700,
                          ),
                        TextCustomized(
                          text: controller.user_code != null ? controller.user_code.toString() : "Không xác định",
                          font: SanFranciscoUIText,
                          color: BLACK,
                          size: normalSize,
                          weight: FontWeight.w400,
                          ),  
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextCustomized(
                            text: ADMIN_CUSTOMER_NAME,
                            font: SanFranciscoText,
                            color: BLACK,
                            size: normalSize,
                            weight: FontWeight.w700,
                            ),
                        ),
                        TextCustomized(
                          text:  controller.name.toString(),
                          font: SanFranciscoUIText,
                          color: BLACK,
                          size: normalSize,
                          weight: FontWeight.w400,
                          ),  
                      ],
                    ),
                     SizedBox(height: 15),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          //flex: 2,
                          child: TextCustomized(
                            text: PHONE,
                            font: SanFranciscoText,
                            color: BLACK,
                            size: normalSize,
                            weight: FontWeight.w700,
                            ),
                        ),
                        // TextCustomized(
                        //     text: ADMIN_UNKNOWN,
                        //     font: SanFranciscoUIText,
                        //     color: BLACK,
                        //     size: normalSize,
                        //     weight: FontWeight.w700,
                        //     ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: 5.0,
                          children :[ 
                          TextCustomized(
                            text: controller.phone.toString(),
                            font: SanFranciscoUIText,
                            color: BLACK,
                            size: normalSize,
                            weight: FontWeight.w700,
                            ),
                            SvgPicture.asset(
                              IC_PHONE_ADMIN,
                            )
                          ]
                        ),  
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            TextCustomized(
              text: ADMIN_ENTER_BILL_CODE,
              font: SanFranciscoUIText,
              size: normalSize,
              color: BLACK,
              weight: FontWeight.w700,
            ),
            SizedBox(height: 10),
            Container(
              //width: Get.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color:GRAY ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.barCodeValueController,
                      decoration:InputDecoration(
                        border: InputBorder.none,
                        hintText: ADMIN_ENTER_BILL_CODE,
                        hintStyle: TextStyle(
                          color: GRAY,
                          fontFamily: SanFranciscoUIText
                        ),
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: [
                      InkWell(
                        onTap: (){
                          controller.onRamdomBillOrder();
                        },
                        child: SvgPicture.asset(IC_REFRESH),
                      ),
                      InkWell(
                        onTap: (){
                          controller.scanBarcodeNormal();
                        },
                        child: SvgPicture.asset(IC_QR_CODE),
                      ),
                    ],
                  )
                ],
              ),
            ),
             SizedBox(height: 15),
             TextCustomized(
              text: ADMIN_ITEMS,
              font: SanFranciscoUIText,
              size: normalSize,
              color: BLACK,
              weight: FontWeight.w700,
            ),
            SizedBox(height: 10),
            TextFieldCustomized(
              hint: ADMIN_NAME_ITEMS,
              textController: controller.itemValueController,
            ),
             SizedBox(height: 15),
             TextCustomized(
              text: ADMIN_COD,
              font: SanFranciscoUIText,
              size: normalSize,
              color: BLACK,
              weight: FontWeight.w700,
            ),
            SizedBox(height: 10),
            TextFieldCustomized(
              hint: ADMIN_ENTER_AMOUNT,
              textController: controller.transportFeeController,
            ),
            SizedBox(height: 15),
             TextCustomized(
              text: ADMIN_NUMBER_PACKAGES,
              font: SanFranciscoUIText,
              size: normalSize,
              color: BLACK,
              weight: FontWeight.w700,
            ),
            SizedBox(height: 10),
            TextFieldCustomized(
              hint: ADMIN_ENTER_PARCEL_NUMBER,
              textController: controller.numberPackageController,
            ),
            SizedBox(height: 15),
             TextCustomized(
              text: ADMIN_IMG,
              font: SanFranciscoUIText,
              size: normalSize,
              color: BLACK,
              weight: FontWeight.w700,
            ),
            AddImageEnterWarehouse(),
            Container( 
              color: WHITE,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
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
                                top: BorderSide(width: 1.0, color: Colors.red),
                                left: BorderSide(width: 1.0, color: Colors.red),
                                right: BorderSide(width: 1.0, color: Colors.red),
                                bottom: BorderSide(width: 1.0, color: Colors.red),
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
                            text: ADMIN_ITEM_CANNOT_SHIP,
                            font:SanFranciscoUIText,
                            weight: FontWeight.w700,
                            color: MAIN_BLACK,
                            ),
                        ],
                      ),
                
              ),
            ),
            SizedBox(height: 15),
            ButtonCustomized(
              ADMIN_ENTER_WAREHOUSE,
              onTap: (){
                controller.onEnterWareHouse();
              },
              backgroundColor: BLACK,
            )
        ],
      ),
      )
    );
  }
} 