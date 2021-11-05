import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/controller/forgot_password_step_1_controller.dart';
import 'package:viet_trung_mobile/ui/auth/forgot_password/view/confirm_password_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class ForgotStepOnePage extends GetView<ForgotStepOneController> {
 @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotStepOneController>(
      init: ForgotStepOneController(),
        builder: (value) => Scaffold(
          body: _buildBody(context),

        )
    );
  }
  Widget _buildBody(BuildContext context){
    return  Stack(
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
                              text: AUTH_VERIFICATION,
                              font: SanFranciscoText,
                              size: largeSize,
                              color: BLACK,
                              weight: FontWeight.w400,
                          ),
                          const SizedBox(height: 15),
                           TextCustomized(
                              text: AUTH_SENT_PIN_CODE,
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
                              // Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //           vertical: 8.0, horizontal: 30),
                              //       child: PinCodeTextField(
                              //         appContext: context,
                              //         pastedTextStyle: TextStyle(
                              //           color: Colors.green.shade600,
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //         length: 6,
                              //         obscureText: true,
                              //         obscuringCharacter: '*',
                              //         obscuringWidget: FlutterLogo(
                              //           size: 24,
                              //         ),
                              //         blinkWhenObscuring: true,
                              //         animationType: AnimationType.fade,
                              //         validator: (v) {
                              //           if (v!.length < 3) {
                              //             return "I'm from validator";
                              //           } else {
                              //             return null;
                              //           }
                              //         },
                              //         pinTheme: PinTheme(
                              //           shape: PinCodeFieldShape.box,
                              //           borderRadius: BorderRadius.circular(5),
                              //           fieldHeight: 50,
                              //           fieldWidth: 40,
                              //           activeFillColor: Colors.white,
                              //         ),
                              //         cursorColor: Colors.black,
                              //         animationDuration: Duration(milliseconds: 300),
                              //         enableActiveFill: true,
                              //         //errorAnimationController: errorController,
                              //         //controller: textEditingController,
                              //         keyboardType: TextInputType.number,
                              //         boxShadows: [
                              //           BoxShadow(
                              //             offset: Offset(0, 1),
                              //             color: Colors.black12,
                              //             blurRadius: 10,
                              //           )
                              //         ],
                              //         onCompleted: (v) {
                              //           print("Completed");
                              //         },
                              //         // onTap: () {
                              //         //   print("Pressed");
                              //         // },
                              //         onChanged: (value) {
                              //           print(value);
                                        
                              //         },
                              //         beforeTextPaste: (text) {
                              //           print("Allowing to paste $text");
                              //           //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //           //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              //           return true;
                              //         },
                              //       )),
                               

                              // TextFieldCustomized(
                              //  textController: controller.emailController,
                              //  errorText: !controller.isEmailValid ? controller.emailError : null,
                              //  hint: LOGIN_EMAIL_OR_PHONE,
                               
                              //   ),
                              //   SizedBox(height: 5,),
                              //   Row(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         controller.isEmailValid == false
                              //             ? TextCustomized(
                              //           text: controller.emailError!,
                              //           font: SanFranciscoText,
                              //           size: 12,
                              //           weight: FontWeight.w400,
                              //           color: boderTextFieldErrorColor,
                              //         )
                              //             : Container(),
                              //       ],
                              //     ),
                                
                                SizedBox(height: 16,),
                                ButtonCustomized(
                                    LOGIN_RESET,
                                    onTap: (){
                                      //controller.onForgotPass();
                                      Get.to(ConfirmPage());
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