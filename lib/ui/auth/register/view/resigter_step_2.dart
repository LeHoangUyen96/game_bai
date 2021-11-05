import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/city_response.dart';
import 'package:viet_trung_mobile/data/response/district_response.dart';
import 'package:viet_trung_mobile/data/response/wards_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/register/controller/register_step_2_controller.dart';
import 'package:viet_trung_mobile/ui/auth/register/view/register_step_3.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_widget.dart';

class RegisterStepTwoPage extends GetView<RegisterStepTwoController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterStepTwoController>(
      init: RegisterStepTwoController(),
        builder: (value) => Scaffold(
          body: _buildBody(),

        )
    );
  }
  Widget _buildBody(){
    return Stack(
          alignment: Alignment.center, 
          fit: StackFit.expand, 
        children: <Widget>[
          imgBackGround(),
          Container(
              width: Get.width,
              alignment: Alignment.center,
              //padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                crossAxisAlignment: CrossAxisAlignment.center, 
              children: <Widget>[
                Container(
                          padding: EdgeInsets.only(top:30),
                          child:
                            ImageCustomized(
                              path: LOGO_IMG,
                              height: 150,
                              width: 150,
                            )
                        ),
                        SizedBox(height: 8),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: double.maxFinite,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20), 
                                topRight:Radius.circular(20)
                                ), 
                              color: WHITE  
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children : [   
                                TextCustomized(
                              text: LOGIN_REGISTER,
                              font: SanFranciscoText,
                              size: largeSize,
                              color: BLACK,
                              weight: FontWeight.w400,
                                 ),
                          const SizedBox(height: 25),
                          Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextCustomized(text: CITY, weight: FontWeight.w700,color: BLACK),
                                        SizedBox(height: 5),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: GRAY,
                                              ),
                                            borderRadius: BorderRadius.circular(8),  
                                            ),
                                            width: Get.width,
                                            //padding: EdgeInsets.symmetric(horizontal: 16),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                                child: DropdownButtonHideUnderline(
                                                    child: controller.mcity != null
                                                        ? DropdownButton(
                                                      value: controller.selectedCity != null ? controller.selectedCity : null,
                                                      icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      isExpanded: true,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        height: 0.5,
                                                      ),
                                                      underline: Container(
                                                        height: 1,
                                                        color: MAIN_LINE,
                                                      ),
                                                      items: controller.mcity!.map((DataCity value){
                                                        return DropdownMenuItem<DataCity>(
                                                          value: value,
                                                          child: Container(
                                                            child: Text(
                                                              value.name.toString(),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged: (DataCity? value){
                                                        controller.onChangeCity(value!, value.id!);
                                                      },
                                                      hint: Text(ONCHANGE_CITY),
                                                    ) : DropdownButton(
                                                      icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      isExpanded: true,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        height: 0.5,
                                                      ),
                                                      underline: Container(
                                                        height: 1,
                                                        color: MAIN_LINE,
                                                      ),
                                                      items: [
                                                        DropdownMenuItem<String>(
                                                          value: "1",
                                                          child: Center(
                                                            child: Text(NO_CITY),
                                                          ),
                                                        ),
                                                      ],
                                                      onChanged: (value){},
                                                       hint: TextCustomized(
                                                        text: ONCHANGE_CITY,
                                                        font: SanFranciscoUIText,
                                                        weight: FontWeight.w400,
                                                        color: GRAY,
                                                        ),
                                                    )
                                                )
                                            )
                                        ),
                                        SizedBox(height: 5),
                                        controller.cityValid == false
                                            ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextCustomized(text: DISTRICT, weight: FontWeight.w700,color: BLACK),
                                        SizedBox(height: 5),
                                        Container(
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: GRAY,
                                              ),
                                            borderRadius: BorderRadius.circular(8),  
                                            ),
                                            //padding: EdgeInsets.symmetric(horizontal: 16),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                                child: DropdownButtonHideUnderline(
                                                    child: controller.mdistric != null
                                                        ? DropdownButton(
                                                      value: controller.selectedDistrict != null ? controller.selectedDistrict : null,
                                                      icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      isExpanded: true,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        height: 0.5,
                                                      ),
                                                      underline: Container(
                                                        height: 1,
                                                        color: MAIN_LINE,
                                                      ),
                                                      items: controller.mdistric!.map((DataDistrict value){
                                                        return DropdownMenuItem<DataDistrict>(
                                                          value: value,
                                                          child: Container(
                                                            child: Text(
                                                              value.name.toString(),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged: (DataDistrict? value){
                                                        controller.onChangeDistrict(value!, value.id!);
                                                      },
                                                      hint: Text(ONCHANGE_DISTRICT),
                                                    ) : DropdownButton(
                                                      icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      isExpanded: true,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        height: 0.5,
                                                      ),
                                                      underline: Container(
                                                        height: 1,
                                                        color: MAIN_LINE,
                                                      ),
                                                      items: [
                                                        DropdownMenuItem<String>(
                                                          value: "1",
                                                          child: Center(
                                                            child: Text(NO_DISTRICT),
                                                          ),
                                                        ),
                                                      ],
                                                      onChanged: (value){},
                                                      hint: TextCustomized(
                                                        text: ONCHANGE_DISTRICT,
                                                        font: SanFranciscoUIText,
                                                        weight: FontWeight.w400,
                                                        color: GRAY,
                                                        ),
                                                    )
                                                )
                                            )
                                        ),
                                        SizedBox(height: 5),
                                        controller.districtValid == false
                                            ? TextCustomized(text: controller.districtError.toString(), color: Colors.red)
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextCustomized(text:WARDS, weight: FontWeight.w700,color: BLACK),
                                        SizedBox(height: 5),
                                        Container(
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: GRAY,
                                              ),
                                            borderRadius: BorderRadius.circular(8),  
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                                child: DropdownButtonHideUnderline(
                                                    //alignment: Alignment.topRight,
                                                    child: controller.mwards != null
                                                        ? DropdownButton(
                                                      value: controller.selectedWards != null ? controller.selectedWards : null,
                                                      icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      isExpanded: true,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        height: 0.5,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                      // underline: Container(
                                                      //   height: 1,
                                                      //   color: MAIN_LINE,
                                                      // ),
                                                      items: controller.mwards!.map((DataWards value){
                                                        return DropdownMenuItem<DataWards>(
                                                          value: value,
                                                          child: Container(
                                                            child: Text(
                                                              value.name.toString(),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged: (DataWards? value){
                                                        controller.onChangeWards(value!, value.id!);
                                                      },
                                                      hint: Text(ONCHANGE_WARDS),
                                                    ) : DropdownButton(
                                                      icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      isExpanded: true,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        height: 0.5,
                                                      ),
                                                      underline: Container(
                                                        height: 1,
                                                        color: MAIN_LINE,
                                                      ),
                                                      items: [
                                                        DropdownMenuItem<String>(
                                                          alignment: Alignment.center,
                                                          value: "1",
                                                          child: Center(
                                                            child: Text(NO_WARDS),
                                                          ),
                                                        ),
                                                      ],
                                                      onChanged: (value){},
                                                      hint: TextCustomized(
                                                        text: ONCHANGE_WARDS,
                                                        font: SanFranciscoUIText,
                                                        weight: FontWeight.w400,
                                                        color: GRAY,
                                                        ),
                                                      
                                                    )
                                                )
                                            )
                                        ),
                                        SizedBox(height: 5),
                                        controller.wardsValid == false
                                            ? TextCustomized(text: controller.wardsError.toString(), color: Colors.red)
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextCustomized(text: ADDRESS, weight: FontWeight.w700 ,color: BLACK,),
                                          SizedBox(height: 5),
                                          TextFieldCustomized(
                                            textController: controller.addressController,
                                            hint: ADDRESS,
                                            textInputType: TextInputType.text,
                                            textInputAction: TextInputAction.done,
                                            // textController: controller.usernameController,
                                          ),
                                          SizedBox(height: 5),
                                          controller.addressValid == false
                                              ? TextCustomized(text: controller.addressError.toString(), color: Colors.red)
                                              : Container(),
                                        ],
                                      )
                                  ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Flexible(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: ButtonCustomized(
                                      CART_CONFIRM_ORDER_BACK,
                                      textColor: BLACK,
                                      onTap: (){
                                        Get.back();
                                      },
                                      backgroundColor: BT_GRAY,
                                    ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: ButtonCustomized(
                                      BT_NEXT,
                                      onTap: (){
                                        Get.to(RegisterStepThreePage());
                                      },
                                      backgroundColor: MAIN_BLACK,
                                    ),
                                ),
                              ),
                              
                            ],
                          ),
                         
                              ]
                              ),
                            ),
                          ),
                        ),
                           ]
              )
          ),
          
        ]
        );    
  }
  Widget imgBackGround(){
    return Image.asset(
    BG_IMG,
    fit: BoxFit.cover,
     width: Get.width,
     height: Get.width,
     alignment: Alignment.center,
  );
  }
  

  
}