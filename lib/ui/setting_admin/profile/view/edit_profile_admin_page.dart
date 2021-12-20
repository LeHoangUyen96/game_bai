import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/profile/controller/edit_profile_admin_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class EditProfileAdminPage extends GetView<EditProfileAdminController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<EditProfileAdminController>(
      init: EditProfileAdminController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(editProfile, SizedBox()),
        body: controller.mDataProfile != null
            ? buildBody()
            : Container(
                child: LoadingSpinKit(),
              ),
      ),
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
                text: NAME,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: MAIN_BLACK,
              ),
              SizedBox(height: 5),
              TextFieldCustomized(
                textController: controller.nameController,
              ),
              controller.nameValid == false
                  ? Column(children: [
                      SizedBox(height: 5),
                      TextCustomized(
                        text: controller.nameError.toString(),
                        color: Colors.red,
                        size: 12,
                      )
                    ])
                  : SizedBox(),
              SizedBox(height: 15),
              TextCustomized(
                text: LOGIN_EMAIL,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: MAIN_BLACK,
              ),
              SizedBox(height: 5),
              TextFieldCustomized(
                textController: controller.emailController,
                textInputType: TextInputType.emailAddress,
              ),
              controller.emailValid == false
                  ? Column(children: [
                      SizedBox(height: 5),
                      TextCustomized(
                        text: controller.emailError.toString(),
                        color: Colors.red,
                        size: 12,
                      )
                    ])
                  : SizedBox(),
              SizedBox(height: 15),
              TextCustomized(
                text: LOGIN_PHONE,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: MAIN_BLACK,
              ),
              SizedBox(height: 5),
              TextFieldCustomized(
                textController: controller.phoneController,
                textInputType: TextInputType.number,
              ),
              controller.phoneValid == false
                  ? Column(children: [
                      SizedBox(height: 5),
                      TextCustomized(
                        text: controller.phoneError.toString(),
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
                  controller.onUpdateProfile();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
