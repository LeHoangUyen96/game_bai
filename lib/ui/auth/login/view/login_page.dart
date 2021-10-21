import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/ui/auth/register/view/register_page.dart';
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

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (value) => InitialWidget(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top:30),
                        child:
                          ImageCustomized(
                            path: viet_trung_mobile_logo,
                            height: 150,
                            width: 150,
                          )
                        // SvgPicture.asset(
                        //   viet_trung_mobile_logo.toString(),
                        //   height: 50.0,
                        //   width: 50.0,
                        //   allowDrawingOutsideViewBox: true,
                        // ),
                      ),
                      TextCustomized(
                        text: "Welcome to Bao Den Logistics",
                        weight: FontWeight.w700,
                        font: SanFranciscoText,
                        size: 16,
                      ),
                      SizedBox(height: 8),
                      TextCustomized(
                        text: "Đăng nhập để tiếp tục",
                        font: SanFranciscoText,
                        size: customSize,
                        color: BLACK,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(height: 16),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFieldCustomized(
                            textController: controller.emailController,
                            errorText: !controller.isEmailValid ? controller.emailError : null,
                            hint: "Tên đăng nhập",
                            path: icon_user,
                          )
                      ),
                      SizedBox(height: 5),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
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
                      ),
                      SizedBox(height: 16),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextFieldCustomized(
                            textController: controller.passwordController,
                            errorText: !controller.isPasswordValid ? controller.passwordError : null,
                            hint: "Mật khẩu",
                            path: icon_password,
                            isObscured: true,
                          )
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
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
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ButtonCustomized(
                          "Đăng nhập",
                          onTap: (){
                            controller.onLogin();
                          },
                          backgroundColor: GRAY,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            InkWell(
                                  onTap: (){},
                                  child:  TextCustomized(
                                    text: "Quên mật khẩu",
                                    font: SanFranciscoText,
                                    size: customSize,
                                    weight: FontWeight.w800,
                                    color: RED,
                                  ),
                                ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextCustomized(
                                  text: "Bạn chưa có tài khoản? ",
                                  font: SanFranciscoText,
                                  size: customSize,
                                  color: GRAY,
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(RegisterPage());
                                  },
                                  child:  TextCustomized(
                                    text: "Đăng ký ngay",
                                    font: SanFranciscoText,
                                    size: customSize,
                                    weight: FontWeight.w800,
                                    color: GRAY,
                                  ),
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     FocusScope.of(context).requestFocus(FocusNode());
                      //     controller.onLogin();
                      //   },
                      //   child: Text('Login'),
                      // )
                    ],
                  ),
                ),
              )
            ));
  }
}
