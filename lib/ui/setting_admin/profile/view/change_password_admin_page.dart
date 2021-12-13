import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/profile/controller/chang_password_admin_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class ChangePasswordAdminPage extends GetView<ChangePasswordAdminController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<ChangePasswordAdminController>(
      init: ChangePasswordAdminController(),
      builder: (value) => Scaffold(
          appBar: buildAppBar(PROFILE_BT_CHANGE_PASS, SizedBox()),
          body: buildBody()),
    );
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(mContext!).requestFocus(FocusNode());
      },
      child: Container(
        color: WHITE,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustomized(
                text: PROFILE_OLD_PASS,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: MAIN_BLACK,
              ),
              SizedBox(height: 5),
              TextFieldCustomized(
                textController: controller.oldPassController,
                isObscured: true,
              ),
              controller.oldPassValid == false
                  ? Column(children: [
                      SizedBox(height: 5),
                      TextCustomized(
                        text: controller.oldPassError.toString(),
                        color: Colors.red,
                        size: 12,
                      )
                    ])
                  : SizedBox(),
              SizedBox(height: 15),
              TextCustomized(
                text: PROFILE_NEW_PASS,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: MAIN_BLACK,
              ),
              SizedBox(height: 5),
              TextFieldCustomized(
                textController: controller.newPassController,
                isObscured: true,
              ),
              controller.newPassValid == false
                  ? Column(children: [
                      SizedBox(height: 5),
                      TextCustomized(
                        text: controller.newPassError.toString(),
                        color: Colors.red,
                        size: 12,
                      )
                    ])
                  : SizedBox(),
              SizedBox(height: 15),
              TextCustomized(
                text: PROFILE_NEW_PASS,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: MAIN_BLACK,
              ),
              SizedBox(height: 5),
              TextFieldCustomized(
                textController: controller.confirmPassController,
                isObscured: true,
              ),
              controller.confirmPassValid == false
                  ? Column(children: [
                      SizedBox(height: 5),
                      TextCustomized(
                        text: controller.confirmPassError.toString(),
                        color: Colors.red,
                        size: 12,
                      )
                    ])
                  : SizedBox(),
              SizedBox(height: 30),
              ButtonCustomized(
                save,
                backgroundColor: COLOR_BT,
                onTap: () {
                  controller.onChangePassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
