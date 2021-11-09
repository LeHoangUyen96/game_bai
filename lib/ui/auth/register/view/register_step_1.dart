import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/register/controller/register_step_1_controller.dart';
import 'package:viet_trung_mobile/ui/auth/register/view/resigter_step_2.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_widget.dart';

class RegisterStepOnePage extends GetView<RegisterStepOneController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterStepOneController>(
      init: RegisterStepOneController(),
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
                              const SizedBox(height: 5),  
                              TextCustomized(
                              text: LOGIN_CREATE_ACCOUNT,
                              font: SanFranciscoUIText,
                              size: smallSize,
                              color: BLACK,
                              weight: FontWeight.w400,
                          ),
                          const SizedBox(height: 25),
                          TextCustomized(
                              text: LOGIN_EMAIL,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BLACK,
                          ),
                          const SizedBox(height: 5), 
                            TextFieldCustomized(
                               textController: controller.emailController,
                               errorText: !controller.isEmailValid ? controller.emailError : null,
                               hint: LOGIN_EMAIL,
                               
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
                          color: RED,
                        )
                            : Container(),
                              ],
                          ),
                          const SizedBox(height: 16),
                          TextCustomized(
                              text: LOGIN_PHONE,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BLACK,
                          ),
                        //   TextFieldCustom(
                        // hint: LOGIN_PHONE,
                        // textController: controller.phoneNumberController,
                        // path: icon_phone,
                        // textInputType: TextInputType.phone,
                        //  ),
                
                        const SizedBox(height: 5,),
                          TextFieldCustomized(
                        hint: LOGIN_PHONE,
                        textController: controller.phoneNumberController,
                        textInputType: TextInputType.phone,
                         ),
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isPhoneNumberValid == false
                            ? TextCustomized(
                          text: controller.phoneNumberError,
                          font: SanFranciscoText,
                          size: 12,
                          weight: FontWeight.w400,
                          color: RED,
                        )
                            : Container(),
                      ],
                     ),
                          SizedBox(height: 16),
                          TextCustomized(
                              text: LOGIN_NAME,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BLACK,
                          ),
                     const SizedBox(height: 5,),
                     TextFieldCustomized(
                        hint: LOGIN_NAME,
                        textController: controller.nameController,
                      ),
                     const SizedBox(height: 5,),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isNameValid == false
                            ? TextCustomized(
                          text: controller.nameError,
                          font: SanFranciscoText,
                          size: 12,
                          weight: FontWeight.w400,
                          color: RED,
                        )
                            : Container(),
                      ],
                     ),
                  
                    //      const SizedBox(height: 16),
                    //       TextCustomized(
                    //           text: LOGIN_PASSWORD,
                    //           font: SanFranciscoText,
                    //           weight: FontWeight.w400,
                    //           color: BLACK,
                    //       ),
                    //        TextFieldCustom(
                    //            textController: controller.passwordController,
                    //            errorText: !controller.isPasswordValid ? controller.passwordError : null,
                    //            hint: LOGIN_PASSWORD,
                    //            isObscured: true,
                    //        ),
                          
                    //      const SizedBox(height: 5),
                    //       Row(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             controller.isPasswordValid == false
                    //                 ? TextCustomized(
                    //               text: controller.passwordError,
                    //               font: SanFranciscoText,
                    //               size: 12,
                    //               weight: FontWeight.w400,
                    //               color: RED,
                    //             )
                    //                 : Container(),
                    //           ],
                    //       ),
                    //       SizedBox(height: 16,),
                    //        TextCustomized(
                    //           text: LOGIN_CONFIRM_PASSWORD,
                    //           font: SanFranciscoText,
                    //           weight: FontWeight.w400,
                    //           color: BLACK,
                    //       ),
                    //   TextFieldCustom(
                    //     hint: LOGIN_CONFIRM_PASSWORD,
                    //     textController: controller.confirmPassController,
                    //     path: icon_password,
                    //     isObscured: true,
                    //   ),
                  
                    //   SizedBox(width: 5,),
                    //    Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     controller.isConfirmPassValid == false
                    //         ? TextCustomized(
                    //       text: controller.confirmPassError,
                    //       font: SanFranciscoText,
                    //       size: 12,
                    //       weight: FontWeight.w400,
                    //       color: RED,
                    //     )
                    //         : Container(),
                    //   ],
                    // ),
                          const SizedBox(height: 25),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: ButtonCustomized(
                                BT_NEXT,
                                onTap: (){
                                  Get.to(RegisterStepTwoPage());
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