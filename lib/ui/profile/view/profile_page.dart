import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order/view/order_info_page.dart';
import 'package:viet_trung_mobile/ui/order/view/order_list.dart';
import 'package:viet_trung_mobile/ui/address/view/address_page.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile/ui/profile/view/profile_change_password_page.dart';
import 'package:viet_trung_mobile/ui/profile/view/profile_edit_page.dart';
import 'package:viet_trung_mobile/ui/rating_order/view/rating_order_page.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
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
        body:  controller.mDataProfile != null ?
                 SingleChildScrollView(
                   child: buildBody(),
                   physics: BouncingScrollPhysics(),
                   ) 
               : Container(child: LoadingSpinKit(),),
        backgroundColor: GRAY6,
      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        centerTitle: true,
        title: TextCustomized(
          text: PROFILE_PERSONAL_INFOMATION,
          color: WHITE,
          font: SanFranciscoText,
          isCenter: true,
          ),
        flexibleSpace: Image(
          image: AssetImage(BG_IMG),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () {
            Get.to(ProfileEditPage());
          },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: SvgPicture.asset(
              IC_EDIT,
              color: WHITE,
              width: 20,
              height: 20,
              ),
            ),
          ),
        ],
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
            //  boxShadow: [
            //        BoxShadow(
            //        color: GRAY4,
            //        blurRadius: 8,
            //        offset: Offset(4, 6), // Shadow position
            //        ),
            //     ],
              borderRadius: BorderRadius.all( 
                Radius.circular(15),
                ),
                color: GRAY6,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(width: 15,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       TextCustomized(
                        text: controller.mDataProfile!.data!.name!.toString(),
                        font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: MAIN_BLACK,
                        size: normalXSize,
                        ),
                        SizedBox(height: 5),
                         Wrap(
                           spacing: 5.0,
                          children: [
                            SvgPicture.asset(IC_ACCOUNT, fit: BoxFit.cover,),
                            TextCustomized(
                              text: controller.mDataProfile!.data!.user_code.toString(),
                              font: SanFranciscoUIText,
                              weight: FontWeight.w400,
                              color: MAIN_BLACK,
                              size: smallSize,
                              ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          spacing: 5.0,
                          children: [
                            SvgPicture.asset(IC_PHONE, fit: BoxFit.cover, height: 20, width: 20,),
                            TextCustomized(
                              text: controller.mDataProfile!.data!.phone.toString(),
                              font: SanFranciscoUIText,
                              weight: FontWeight.w400,
                              color: MAIN_BLACK,
                              size: smallSize,
                              ),
                          ],
                        ),
                      ]
                    ),
                      
                  ),
                  ),
              ],
            ),
            
          ),
          SizedBox(height: 25,),
         Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(8),
             color: WHITE,
           ),
           padding: EdgeInsets.all(10),
           child: Column(
             children: [
          Container(
            padding: EdgeInsets.all(5),
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
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 5.0,
                  children:[ 
                  SvgPicture.asset(IC_EMAIL,width: 25,height: 25,),
                  TextCustomized(
                    text: LOGIN_EMAIL,
                    font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: MAIN_BLACK,
                    ),
                  ]
                ),
                  TextCustomized(
                  text: controller.mDataProfile!.data!.email.toString(),
                  font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: MAIN_GRAY,
                  ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
                      Get.to(ProfileChangePasswordPage());
                    },
            child: Container(
              padding: EdgeInsets.all(5),
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
                  Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 5.0,
                  children:[ 
                  SvgPicture.asset(IC_LOCK,width: 25,height: 25,),
                  TextCustomized(
                    text: PROFILE_BT_CHANGE_PASS,
                    font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: MAIN_BLACK,
                    ),
                  ]
                ),
                   SvgPicture.asset(
                        IC_ARROWS_RIGHT,
                        width: 12,
                        height: 12,
                        ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
           InkWell(
             onTap: (){Get.to(()=>AddressPage());},
             child: Container(
              padding: EdgeInsets.all(5),
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
                  Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 5.0,
                  children:[ 
                  SvgPicture.asset(IC_MENUCARD,width: 25,height: 25,),
                  TextCustomized(
                    text: PROFILE_ADDRESS,
                    font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: MAIN_BLACK,
                    ),
                  ]
                ),
                     SvgPicture.asset(
                        IC_ARROWS_RIGHT,
                        width: 12,
                        height: 12,
                        ),
                ],
              ),
          ),
           ),
            InkWell(
              onTap: (){Get.to(RatingOrderPage());},
              child: Container(
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
                   Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 5.0,
                  children:[ 
                  SvgPicture.asset(IC_STAR,width: 20,height: 20,),
                  TextCustomized(
                    text: RATING_ORDER ,
                    font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: MAIN_BLACK,
                    ),
                  ]
                ),
                    SvgPicture.asset(
                        IC_ARROWS_RIGHT,
                        width: 12,
                        height: 12,
                        ),
                ],
              ),
          ),
            ),
           SizedBox(height: 10,),
           InkWell(
              onTap: (){controller.onLogout();},
             child: Container(
              padding: EdgeInsets.all(5),
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
                      Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5.0,
                      children:[ 
                      SvgPicture.asset(IC_POWER,width: 25,height: 25,),
                      TextCustomized(
                        text: PROFILE_LOGOUT,
                        font: SanFranciscoText,
                            weight: FontWeight.w400,
                            color: MAIN_BLACK,
                        ),
                      ]
                    ),
                    SvgPicture.asset(
                        IC_ARROWS_RIGHT,
                        width: 12,
                        height: 12,
                        ),
                    ],
                  ),
              ),
              ),
             ],
           ),
         ),
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
           path: controller.mDataProfile!.data!.avatar.toString().isEmpty ? LOGO_IMG : controller.mDataProfile!.data!.avatar.toString() , 
           fit: BoxFit.cover,
          width: 80,
          height: 80,
        ),
        ),
      ),
    );
 }
 

  Widget buildEditIcon() => buildCircle(
        color: GRAY6,
        all: 1,
        child: buildCircle(
          color: GRAY6,
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
