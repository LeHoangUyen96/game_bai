import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class AddProductDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _addProduct();
}



class _addProduct extends State<AddProductDialog> {
 List listProduct = [{},{},{},{}];
 bool isCheck = false;
  int defaults = 0;
  
  @override
    void initState() {
      super.initState();
      
  }
 void onChangeDefault(){
    isCheck = !isCheck;
    if(isCheck==true){
      defaults = 1;
    } else defaults = 0;
    print("$defaults");
    setState(() {
      
    });
  }
  @override
    Widget build(BuildContext context) {
      return  Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            height: Get.height*0.65,
            width:  Get.width,
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
                          topRight: Radius.circular(10)
                      )
                  ),
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
                        child: Icon(Icons.close_outlined, color: WHITE,),
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
                            border: Border.all(color:GRAY ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(IC_SEARCH, width: Get.width*0.1-20, ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextField(
                                    decoration:InputDecoration(
                                      border: InputBorder.none,
                                      hintText: MANAGE_PACKAGE_SEARCH_BAG,
                                      hintStyle: TextStyle(
                                        color: GRAY,
                                        fontFamily: SanFranciscoUIText
                                      ),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index){
                        return buildListProduct();
                      }, 
                      separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                      },
                      physics: ClampingScrollPhysics(),
                      itemCount: 15,
                      shrinkWrap: true,
                      ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ButtonCustomized(
                          BANKPICKER_BTN_ADD,
                          textColor: WHITE,
                          backgroundColor: BT_CONFIRM,
                          onTap:(){
                          },
                        ),
                ),
                
              ],
            ),
          ),
      );
    }
    Widget buildListProduct(){
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: BT_GRAY)
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustomized(
                    text: "#1212545AADDF5",
                    font: SanFranciscoText,
                    weight: FontWeight.w700,
                    color: MAIN_BLACK,
                    size: normalSize,
                    ),
                  SizedBox(height: 5),
                  Wrap(
                    spacing: 5.0,
                    children:[ 
                    TextCustomized(
                      text: MANAGE_PACKAGE_CUSTOMER_NAME,
                      font: SanFranciscoUIText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                      size: smallSize,
                      ),
                      TextCustomized(
                      text: "Nguyễn Văn A",
                      font: SanFranciscoUIText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                      size: smallSize,
                      ),
                    ]
                  ),
                  Wrap(
                    spacing: 5.0,
                    children:[ 
                    TextCustomized(
                      text: DELIVERY_NOTE_NUMBER_PARCEL_HD,
                      font: SanFranciscoUIText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                      size: smallSize,
                      ),
                      TextCustomized(
                      text: "10",
                      font: SanFranciscoUIText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                      size: smallSize,
                      ),
                    ]
                  ),    
                ],
              ),
            ),
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
                value: isCheck,
                tristate: true,
                onChanged: (value) {
                  onChangeDefault();
                },
              ),
            ),
          ],
        ),
      );
    }
}