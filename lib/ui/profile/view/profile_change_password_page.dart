import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class ProfileChangePasswordPage extends GetView<ProfileController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body: //controller.mDataProfile != null
            buildBody(),
        //: Container(child: LoadingSpinKit(),),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: AppBar(
        title: TextCustomized(
          text: PROFILE_BT_CHANGE_PASS,
          color: WHITE,
          font: SanFranciscoText,
        ),
        flexibleSpace: Image(
          image: AssetImage(BG_IMG),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: WHITE,
          ),
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
          padding: EdgeInsets.all(20),
          height: Get.height,
          width: Get.width,
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
                //textController: ,
                //errorText: ,
                hint: PROFILE_OLD_PASS,
                isSuffixIcon: true,
                isObscured: true,
              ),
              SizedBox(
                height: 15,
              ),
              TextCustomized(
                text: PROFILE_NEW_PASS,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: MAIN_BLACK,
              ),
              SizedBox(height: 5),
              TextFieldCustomized(
                //textController: ,
                //errorText: ,
                hint: PROFILE_NEW_PASS,
                isSuffixIcon: true,
                isObscured: true,
              ),
              SizedBox(
                height: 15,
              ),
              TextCustomized(
                text: PROFILE_CONFIRM_PASS,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: MAIN_BLACK,
              ),
              SizedBox(height: 5),
              TextFieldCustomized(
                //textController: ,
                //errorText: ,
                hint: PROFILE_CONFIRM_PASS,
                isSuffixIcon: true,
                isObscured: true,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }

  Widget _buildBottomNav() {
    return Container(
      padding: EdgeInsets.all(20),
      child: ButtonCustomized(
        PROFILE_UPDATE,
        backgroundColor: MAIN_BLACK,
      ),
    );
  }
}
