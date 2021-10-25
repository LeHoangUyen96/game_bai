import 'package:screenshot/screenshot.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/view/forgot_password_page.dart';
import 'package:viet_trung_mobile/ui/auth/register/view/register_page.dart';
import 'package:viet_trung_mobile/ui/profile/view/profile_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/ui/auth/login/controller/login_controller.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/widget/text_field_widget.dart';

class LoginPage extends GetView<LoginController> {
 @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
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
                              text: LOGIN,
                              font: SanFranciscoText,
                              size: largeSize,
                              color: BLACK,
                              weight: FontWeight.w400,
                          ),
                          const SizedBox(height: 25),
                          TextCustomized(
                              text: LOGIN_EMAIL_PHONE,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BLACK,
                          ),
                           TextFieldCustom(
                               textController: controller.emailController,
                               errorText: !controller.isEmailValid ? controller.emailError : null,
                               hint: LOGIN_EMAIL_PHONE,
                               
                           ),
                          SizedBox(height: 5),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.isEmailValid == false
                                    ? TextCustomized(
                                  text: controller.emailError,
                                  font: SanFranciscoText,
                                  size: 12,
                                  weight: FontWeight.w400,
                                  color: GRAY,
                                )
                                    : Container(),
                              ],
                          ),
                          SizedBox(height: 16),
                          TextCustomized(
                              text: LOGIN_PASSWORD,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BLACK,
                          ),
                           TextFieldCustom(
                               textController: controller.passwordController,
                               errorText: !controller.isPasswordValid ? controller.passwordError : null,
                               hint: LOGIN_PASSWORD,
                               
                           ),
                          
                          SizedBox(height: 5),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.isPasswordValid == false
                                    ? TextCustomized(
                                  text: controller.passwordError,
                                  font: SanFranciscoText,
                                  size: 12,
                                  weight: FontWeight.w400,
                                  color: GRAY,
                                )
                                    : Container(),
                              ],
                          ),
                          const SizedBox(height: 16),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: ButtonCustomized(
                                LOGIN,
                                onTap: (){
                                  controller.onLogin();
                                },
                                backgroundColor: MAIN_BLACK,
                              ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  InkWell(
                                        onTap: (){
                                          Get.to(ForgotPage());
                                        },
                                        child:  TextCustomized(
                                          text: LOGIN_FORGOTPASSWORD,
                                          font: SanFranciscoText,
                                          size: customSize,
                                          weight: FontWeight.w800,
                                          color: MAIN_BLACK,
                                        ),
                                      ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      TextCustomized(
                                        text: LOGIN_NO_ACCOUNT,
                                        font: SanFranciscoText,
                                        size: customSize,
                                        color: GRAY,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Get.to(RegisterPage());
                                          
                                        },
                                        child:  TextCustomized(
                                          text: LOGIN_REGISTER_NOW,
                                          font: SanFranciscoText,
                                          size: customSize,
                                          weight: FontWeight.w800,
                                          color: MAIN_BLACK,
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ],
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
