import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/auth/forgot_password/controller/confirm_password_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class ConfirmPage extends GetView<ConfirmPasswordController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmPasswordController>(
        init: ConfirmPasswordController(),
        builder: (value) => Scaffold(
              body: _buildBody(),
            ));
  }

  Widget _buildBody() {
    return GestureDetector(
        onTap: () {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
        },
        child:
            Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
          imgBackGround(),
          Container(
              width: Get.width,
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: WHITE,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 30),
                        child: ImageCustomized(
                          path: IMG_LOGO,
                          height: 150,
                          width: 150,
                        )),
                    SizedBox(height: 8),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: WHITE),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustomized(
                                  text: LOGIN_RESET_PASSWORD,
                                  font: SanFranciscoText,
                                  size: largeSize,
                                  color: BLACK,
                                  weight: FontWeight.w400,
                                ),
                                SizedBox(height: 25),
                                TextCustomized(
                                  text: code,
                                  font: SanFranciscoText,
                                  weight: FontWeight.w400,
                                  color: BLACK,
                                ),
                                SizedBox(height: 5),
                                TextFieldCustomized(
                                  textController: controller.codeController,
                                  hint: inputCode,
                                  path: icon_password,
                                  isObscured: true,
                                  isSuffixIcon: true,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    controller.codeValid == false
                                        ? TextCustomized(
                                            text:
                                                controller.codeError.toString(),
                                            font: SanFranciscoText,
                                            size: 12,
                                            weight: FontWeight.w400,
                                            color: boderTextFieldErrorColor,
                                          )
                                        : Container(),
                                  ],
                                ),
                                TextCustomized(
                                  text: LOGIN_PASSWORD,
                                  font: SanFranciscoText,
                                  weight: FontWeight.w400,
                                  color: BLACK,
                                ),
                                SizedBox(height: 5),
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
                                            text:
                                                controller.passError.toString(),
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
                                  textController:
                                      controller.confirmPassController,
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
                                            text: controller.confirmPassError
                                                .toString(),
                                            font: SanFranciscoText,
                                            size: 12,
                                            weight: FontWeight.w400,
                                            color: boderTextFieldErrorColor,
                                          )
                                        : Container(),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Container(
                                  child:
                                      ButtonCustomized(AUTH_CONFIRM, onTap: () {
                                    controller.onConfirmPass();
                                  }, backgroundColor: COLOR_BT),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ])),
        ]));
  }

  Widget imgBackGround() {
    return Image.asset(
      BG_IMG_LOGIN,
      fit: BoxFit.cover,
      width: double.maxFinite,
      height: double.maxFinite,
      alignment: Alignment.center,
    );
  }
}
