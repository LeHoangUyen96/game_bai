import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/auth/forgot_password/view/forgot_password_page.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/ui/auth/login/controller/login_controller.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
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
            Stack(alignment: Alignment.center, fit: StackFit.expand, children: <
                Widget>[
          imgBackGround(),
          Container(
              width: Get.width,
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 50),
                        child: ImageCustomized(
                          path: IMG_LOGO,
                          height: 150,
                          width: 150,
                        )),
                    SizedBox(height: 50),
                    Expanded(
                      child: Container(
                        height: Get.height * 0.7,
                        padding: EdgeInsets.all(20),
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
                                  text: LOGIN,
                                  font: SanFranciscoText,
                                  size: largeSize,
                                  color: BLACK,
                                  weight: FontWeight.w400,
                                ),
                                SizedBox(height: 5),
                                TextCustomized(
                                  text: LOGIN_SIGN_TO_CONTINUE,
                                  font: SanFranciscoUIText,
                                  size: verySmallSize,
                                  color: GRAY,
                                  weight: FontWeight.w400,
                                ),
                                SizedBox(height: 25),
                                TextCustomized(
                                  text: LOGIN_EMAIL_PHONE,
                                  font: SanFranciscoText,
                                  weight: FontWeight.w400,
                                  color: BLACK,
                                ),
                                SizedBox(height: 5),
                                TextFieldCustomized(
                                  textController: controller.emailController,
                                  errorText: !controller.isEmailValid
                                      ? controller.emailError
                                      : null,
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
                                            color: RED,
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
                                SizedBox(height: 5),
                                TextFieldCustomized(
                                  textController: controller.passwordController,
                                  errorText: !controller.isPasswordValid
                                      ? controller.passwordError
                                      : null,
                                  hint: LOGIN_PASSWORD,
                                  isSuffixIcon: true,
                                  isObscured: true,
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
                                            color: RED,
                                          )
                                        : Container(),
                                  ],
                                ),
                                SizedBox(height: 16),
                                ButtonCustomized(
                                  LOGIN,
                                  onTap: () {
                                    controller.onLogin();
                                  },
                                  backgroundColor: COLOR_BT,
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(ForgotPage());
                                      },
                                      child: TextCustomized(
                                        text: LOGIN_FORGOTPASSWORD,
                                        font: SanFranciscoText,
                                        size: customSize,
                                        weight: FontWeight.w800,
                                        color: BLACK_1,
                                      ),
                                    ),
                                  ),
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
