import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_widget.dart';

class ProfileChangePasswordPage extends GetView<ProfileController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body:  //controller.mDataProfile != null
                 buildBody(), 
          //: Container(child: LoadingSpinKit(),),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: InitialWidget(
        child: Container(),
        titleAppBar: PROFILE_BT_CHANGE_PASS,
        
        backgroundAppBar: WHITE,
         isShowBack: true,
        iconBack: Icon(Icons.arrow_back_ios, color: MAIN_GRAY,),
       
      ),
    );
  }

  Widget buildBody(){
    return Container(
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
            TextFieldCustom(
              //textController: ,
              //errorText: ,
              hint: PROFILE_OLD_PASS,    
            ),
            SizedBox(height: 15,),
            TextCustomized(
            text: PROFILE_NEW_PASS,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            TextFieldCustom(
              //textController: ,
              //errorText: ,
              hint: PROFILE_NEW_PASS,    
            ),
            SizedBox(height: 15,),
            TextCustomized(
            text: PROFILE_CONFIRM_PASS,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            TextFieldCustom(
              //textController: ,
              //errorText: ,
              hint: PROFILE_CONFIRM_PASS,    
            ),
            SizedBox(height: 15,),
            
        ],
      ),

    );
  }

  Widget _buildBottomNav(){
    return Container(
      padding: EdgeInsets.all(20),
      child: ButtonCustomized(
        PROFILE_UPDATE,
        backgroundColor: MAIN_BLACK,
      ),
    );
  }
}