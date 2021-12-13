import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/auth/register/controller/register_step_3_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class RegisterStepThreePage extends GetView<RegisterStepThreeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterStepThreeController>(
        init: RegisterStepThreeController(),
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
              //padding: EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
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
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: WHITE),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustomized(
                                  text: LOGIN_REGISTER,
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
                                  textController: controller.passwordController,
                                  errorText: !controller.isPasswordValid
                                      ? controller.passwordError
                                      : null,
                                  hint: LOGIN_PASSWORD,
                                  isObscured: true,
                                  isSuffixIcon: true,
                                ),
                                const SizedBox(height: 5),
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
                                SizedBox(
                                  height: 16,
                                ),
                                TextCustomized(
                                  text: LOGIN_CONFIRM_PASSWORD,
                                  font: SanFranciscoText,
                                  weight: FontWeight.w400,
                                  color: BLACK,
                                ),
                                TextFieldCustomized(
                                  hint: LOGIN_CONFIRM_PASSWORD,
                                  textController:
                                      controller.confirmPassController,
                                  path: icon_password,
                                  isObscured: true,
                                  isSuffixIcon: true,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    controller.isConfirmPassValid == false
                                        ? TextCustomized(
                                            text: controller.confirmPassError,
                                            font: SanFranciscoText,
                                            size: 12,
                                            weight: FontWeight.w400,
                                            color: RED,
                                          )
                                        : Container(),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: ButtonCustomized(
                                          CART_CONFIRM_ORDER_BACK,
                                          textColor: BLACK,
                                          onTap: () {
                                            Get.back();
                                          },
                                          backgroundColor: BT_GRAY,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: ButtonCustomized(
                                          LOGIN_REGISTER,
                                          onTap: () {
                                            controller.onRegister();
                                          },
                                          backgroundColor: MAIN_BLACK,
                                        ),
                                      ),
                                    ),
                                  ],
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
      BG_IMG,
      fit: BoxFit.cover,
      width: Get.width,
      height: Get.width,
      alignment: Alignment.center,
    );
  }
}
