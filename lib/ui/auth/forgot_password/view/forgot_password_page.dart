import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/view/confirm_password_page.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/view/forgot_password_step_1.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_widget.dart';

class ForgotPage extends GetView<ForgotController> {
 @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(
      init: ForgotController(),
        builder: (value) => Scaffold(
          body: _buildBody(),

        )
    );
  }
  Widget _buildBody(){
    return Screenshot(
        controller: controller.screenshotController,
        child: Stack(
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
                              text: LOGIN_PASSWORD_RECOVERY,
                              font: SanFranciscoText,
                              size: largeSize,
                              color: BLACK,
                              weight: FontWeight.w400,
                          ),
                          const SizedBox(height: 15),
                           TextCustomized(
                              text: LOGIN_ENTER_EMAIL,
                              font: SanFranciscoUIText,
                              size: smallSize,
                              color: GRAY,
                              weight: FontWeight.w400,
                          ),
                          const SizedBox(height: 25),
                              TextCustomized(
                                textAlign: TextAlign.left,
                                text: LOGIN_EMAIL_OR_PHONE,
                                size: 14 ,
                                weight: FontWeight.w400,
                                style: FontStyle.normal,
                                font: SanFranciscoText,
                                color: boderTextFieldEnabledColor,
                              ),
                              // TextFieldCustom(
                              //  textController: controller.emailController,
                              //  errorText: !controller.isEmailValid ? controller.emailError : null,
                              //  hint: LOGIN_EMAIL_OR_PHONE,
                               
                              //   ),
                              SizedBox(height: 5,),
                              TextFieldCustomized(
                               textController: controller.emailController,
                               errorText: !controller.isEmailValid ? controller.emailError : null,
                               hint: LOGIN_EMAIL_OR_PHONE,
                               
                                ),
                                SizedBox(height: 5,),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      controller.isEmailValid == false
                                          ? TextCustomized(
                                        text: controller.emailError!,
                                        font: SanFranciscoText,
                                        size: 12,
                                        weight: FontWeight.w400,
                                        color: boderTextFieldErrorColor,
                                      )
                                          : Container(),
                                    ],
                                  ),
                                
                                SizedBox(height: 16,),
                                ButtonCustomized(
                                    LOGIN_RESET,
                                    onTap: (){
                                      //controller.onForgotPass();
                                      Get.to(ForgotStepOnePage());
                                    },
                                    backgroundColor: MAIN_BLACK,
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