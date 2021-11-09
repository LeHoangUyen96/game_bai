import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_edit_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_widget.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<ProfileEditController>(
      init: ProfileEditController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body:  controller.mDataProfile != null ?
                 buildBody()
          : Container(child: LoadingSpinKit(),),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: AppBar(
        title: TextCustomized(
          text: PROFILE_CHANGE_INFORMATION,
          color: WHITE,
          font: SanFranciscoText,
          ),
        flexibleSpace: Image(
          image: AssetImage(BG_IMG),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: WHITE,),
        ),
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
            text: NAME,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.name,
              //errorText: ,
              hint: controller.mDataProfile!.data!.name,    
            ),
            SizedBox(height: 15,),
            TextCustomized(
            text: LOGIN_EMAIL,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.email,
              //errorText: ,
              hint: controller.mDataProfile!.data!.email,    
            ),
            SizedBox(height: 15,),
            TextCustomized(
            text: LOGIN_PHONE,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.phone,
              //errorText: ,
              hint: controller.mDataProfile!.data!.phone,    
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