import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/address/view/address_page.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile/ui/profile/view/profile_change_password_page.dart';
import 'package:viet_trung_mobile/ui/profile/view/profile_edit_page.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class ProfilePage extends GetView<ProfileController> {
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
      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: InitialWidget(
        child: Container(),
        titleAppBar: PROFILE_PERSONAL_INFOMATION,
        
        backgroundAppBar: WHITE,
         isShowBack: true,
        iconBack: Icon(Icons.arrow_back_ios, color: MAIN_GRAY,),
        floatingActionButton: InkWell(
          onTap: () {
            Get.to(ProfileEditPage());
          },
          child: SvgPicture.asset(
            IC_EDIT,
            width: 20,
            height: 20,
            ),
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
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
             boxShadow: [
                   BoxShadow(
                   color: GRAY4,
                   blurRadius: 8,
                   offset: Offset(4, 6), // Shadow position
                   ),
                ],
              borderRadius: BorderRadius.all( 
                Radius.circular(15),
                ),
                
                color: BG_GRAY,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                children: [
                buildImageAvt(),
                Positioned(
                bottom: -1,
                right: -5,
                child: buildEditIcon(),
                ),
                 ],
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextCustomized(
                      text: NAME,
                      font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                      ),
                      
                  ),
                  ),
              ],
            ),
            
          ),
          SizedBox(height: 25,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: COLOR_MESSAGE_USER,
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustomized(
                  text: PROFILE_CUSTOMERE_CODE,
                  font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                  ),
                  TextCustomized(
                  text: NAME,
                  font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_GRAY,
                  ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: COLOR_MESSAGE_USER,
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustomized(
                  text: LOGIN_PHONE,
                  font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                  ),
                 TextCustomized(
                  text: LOGIN_PHONE,
                  font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_GRAY,
                  ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: COLOR_MESSAGE_USER,
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustomized(
                  text: LOGIN_EMAIL,
                  font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                  ),
                  TextCustomized(
                  text: LOGIN_EMAIL,
                  font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_GRAY,
                  ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: COLOR_MESSAGE_USER,
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustomized(
                  text: PROFILE_BT_CHANGE_PASS,
                  font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(ProfileChangePasswordPage());
                    },
                    child: SvgPicture.asset(
                      IC_ARROWS_RIGHT,
                      width: 12,
                      height: 12,
                      ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 10,),
           Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: COLOR_MESSAGE_USER,
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustomized(
                  text: PROFILE_ADDRESS,
                  font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_BLACK,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(()=>AddressPage());
                    },
                    child: SvgPicture.asset(
                      IC_ARROWS_RIGHT,
                      width: 12,
                      height: 12,
                      ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),

    );
  }
 
 Widget buildImageAvt(){
      
    return ClipRRect(
      borderRadius:const BorderRadius.only(
       topLeft: Radius.circular(15.0),
       topRight: Radius.circular(15.0),
       bottomRight: Radius.circular(15.0),
       bottomLeft: Radius.circular(15.0),
        ),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: (){},
          child: ImageCustomized(
           path: BG_IMG,
           fit: BoxFit.cover,
          width: 60,
          height: 60,
        ),
        ),
      ),
    );
 }
 

  Widget buildEditIcon() => buildCircle(
        color: BG_GRAY,
        all: 1,
        child: buildCircle(
          color: BG_GRAY,
          all: 2,
          child: SvgPicture.asset(
            IC_EDIT_PROFILE,
            width: 18,
            height: 18,
            )
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

}
