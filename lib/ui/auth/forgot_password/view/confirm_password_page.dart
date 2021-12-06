import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/controller/confirm_password_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_widget.dart';

class ConfirmPage extends GetView<ConfirmPasswordController> {
 @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmPasswordController>(
      init: ConfirmPasswordController(),
        builder: (value) => Scaffold(
          body: _buildBody(),

        )
    );
  }
  Widget _buildBody(){
    return GestureDetector(
      onTap: () {
        FocusScope.of(Get.context!).requestFocus(FocusNode());
      },
      child:  Stack(
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
                              path: IMG_LOGO,
                              height: 150,
                              width: 150,
                            )
                        
                        ),
                       
                        SizedBox(height: 8),
                      
                        Expanded(
                          //flex: 4,
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
                              text: LOGIN_RESET_PASSWORD,
                              font: SanFranciscoText,
                              size: largeSize,
                              color: BLACK,
                              weight: FontWeight.w400,
                          ),
                          const SizedBox(height: 25),
                           TextCustomized(
                              text: LOGIN_PASSWORD,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BLACK,
                          ),
                          const SizedBox(height: 5),
                          TextFieldCustomized(
                            textController: controller.passController,
                            hint: CP_PASSWORD,
                            path: icon_password,
                            isObscured: true,
                            isSuffixIcon: true,
                          ),
                
                     Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.passValid == false
                          ? TextCustomized(
                        text: controller.passError.toString(),
                        font: SanFranciscoText,
                        size: 12,
                        weight: FontWeight.w400,
                        color: boderTextFieldErrorColor,
                      )
                          : Container(),
                    ],
                  ),
                
                SizedBox(height: 16),
                 TextCustomized(
                              text: BT_CONFIRMPASSWORD,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BLACK,
                          ),
                SizedBox(height: 5),          
                TextFieldCustomized(
                      textController: controller.confirmPassController,
                      hint: BT_CONFIRMPASSWORD,
                      path: icon_password,
                      isObscured: true,
                      isSuffixIcon: true,
                    ),
                     Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.confirmPassValid == false
                          ? TextCustomized(
                        text: controller.confirmPassError.toString(),
                        font: SanFranciscoText,
                        size: 12,
                        weight: FontWeight.w400,
                        color: boderTextFieldErrorColor,
                      )
                          : Container(),
                    ],
                  ),
                
                SizedBox(height: 30,),
                Container(
                  child: ButtonCustomized(
                   AUTH_CONFIRM,
                    onTap: (){
                     controller.onConfirmPass();
                    },
                    backgroundColor: MAIN_BLACK,
                  ),
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
        )
        );    
  }
  Widget imgBackGround(){
    return Image.asset(
    BG_IMG,
    fit: BoxFit.cover,
     width: double.maxFinite,
     height: double.maxFinite,
     alignment: Alignment.center,
  );
  }
 
}