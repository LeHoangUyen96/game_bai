import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_staff/controller/detail_staff_controller.dart';
import 'package:viet_trung_mobile/ui/admin/manager_staff/view/edit_staff_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class DetailStaffPage extends GetView<DetailStaffController> {
  BuildContext? mContext;
  
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<DetailStaffController>(
      init: DetailStaffController(),
      builder: (value) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(),
        body: controller.detailStaffResponse != null ? SingleChildScrollView(child: buildBody()):LoadingSpinKit(),
        backgroundColor: BT_GRAY,
      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        //centerTitle: true,
        title: TextCustomized(
          text: MANAGE_PACKAGE_EMPLOYEE,
          color: WHITE,
          font: SanFranciscoText,
          isCenter: true,
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
        actions: [
          InkWell(
            onTap: () {
              Get.to(EditStaffPage(),arguments: controller.id);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: SvgPicture.asset(
              IC_EDIT,
              color: WHITE,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildBody(){
    return Container(
      child: Column(
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.all(15),
            color: WHITE,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 CircleAvatar(
                    radius: 30.0,
                      child: ClipOval(
                      child: controller.detailStaffResponse!.data!.avatar == null ||
                          controller.detailStaffResponse!.data!.avatar == ''
                      ? ImageCustomized(
                          path: LOGO_IMG,
                          height: 60,
                          width: 60,
                        )
                      :  ImageCustomized(
                              path: controller.detailStaffResponse!.data!.avatar,
                              height: 60,
                              width: 60,
                          ),
                        ),
                      // child:  ImageCustomized(
                      //         path: LOGO_IMG,
                      //     height: 60,
                      //     width: 60,
                      //     ),
                      //),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 5.0),
                  Wrap(
                    spacing: 5.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset(IC_ACCOUNT, color: BT_GRAY,),
                      TextCustomized(
                        text: controller.detailStaffResponse!.data!.name.toString(),
                        size: normalSize,
                        color: BT_GRAY,
                        )
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Wrap(
                    spacing: 5.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset(IC_PHONE, color: BT_GRAY,),
                      TextCustomized(
                        text: controller.detailStaffResponse!.data!.phone.toString(),
                        size: normalSize,
                        color: BT_GRAY,
                        )
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(15),
            color: WHITE,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustomized(
                  text: email,
                  color: BT_GRAY,
                ),
                SizedBox(height: 10.0),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: BT_GRAY
                      )
                    )
                  ),
                  child: TextCustomized(
                    text: controller.detailStaffResponse!.data!.email.toString(),
                    color: BT_CONFIRM,
                  ),
                ),
                SizedBox(height: 15.0),
                TextCustomized(
                  text: "Phân quyền",
                  color: BT_GRAY,
                ),
                SizedBox(height: 10.0),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: BT_GRAY
                      )
                    )
                  ),
                  child: TextCustomized(
                    text: controller.detailStaffResponse!.data!.role_name.toString(),
                    color: BT_CONFIRM,
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustomized(
                              text: "Trạng thái",
                              color: BT_GRAY,
                            ),
                            SizedBox(height: 10.0),
                             TextCustomized(
                                text: controller.detailStaffResponse!.data!.status == 1 ?'Đang họat động' : 'Không hoạt động',
                                color: BT_CONFIRM,
                                weight: FontWeight.w600,
                              ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: CupertinoSwitch(
                           dragStartBehavior: DragStartBehavior.start,
                            //value: controller.detailStaffResponse!.data!.status == 1 ? true: false,
                            value: controller.isStatus,
                            onChanged: (bool value) {
                              controller.onGetStatusStaff(value);
                            },
                            ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(15),
            child: ButtonCustomized(
              RESET_PASSWORD,
              textColor: WHITE,
              onTap: (){
                controller.onResetPasswordAdmin();
              },
              backgroundColor: BT_CONFIRM,
            ),
          )
        ],
      ),
    );
  }
}  