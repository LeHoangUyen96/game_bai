import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile/ui/setting_admin/profile/view/change_password_admin_page.dart';
import 'package:viet_trung_mobile/ui/setting_admin/profile/view/edit_profile_admin_page.dart';
import 'package:viet_trung_mobile/ui/setting_admin/profile/view/popup_logout.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class ProfileAdminPage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (value) => controller.mDataProfile != null
          ? Scaffold(
              appBar: buildAppBar(
                PROFILE_PERSONAL_INFOMATION,
                InkWell(
                  onTap: () {
                    Get.to(EditProfileAdminPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SvgPicture.asset(
                      IC_EDIT,
                      color: WHITE,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              body: controller.mDataProfile != null
                  ? SingleChildScrollView(child: buildBody())
                  : Container(
                      child: LoadingSpinKit(),
                    ),
              backgroundColor: GRAY6,
            )
          : SizedBox(),
    );
  }

  Widget buildBody() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: WHITE,
              padding: EdgeInsets.all(16),
              child: Column(children: [
                Center(
                    child: Stack(
                  children: [
                    buildImageAvt(),
                    Positioned(
                      bottom: -1,
                      right: -5,
                      child: buildEditIcon(),
                    ),
                  ],
                )),
                SizedBox(width: 15),
                Center(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(children: [
                        TextCustomized(
                          text: controller.mDataProfile!.data!.name!,
                          font: SanFranciscoText,
                          weight: FontWeight.w500,
                          color: MAIN_BLACK,
                          size: 16,
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          spacing: 5.0,
                          children: [
                            SvgPicture.asset(
                              IC_ACCOUNT,
                              fit: BoxFit.cover,
                              height: 16,
                              width: 16,
                            ),
                            TextCustomized(
                              text: controller.mDataProfile!.data!.user_code!,
                              font: inter,
                              weight: FontWeight.w400,
                              color: TITLE_POPUP,
                              size: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          spacing: 5.0,
                          children: [
                            SvgPicture.asset(
                              IC_PHONE,
                              fit: BoxFit.cover,
                              height: 16,
                              width: 16,
                            ),
                            TextCustomized(
                              text: controller.mDataProfile!.data!.phone
                                  .toString(),
                              font: inter,
                              weight: FontWeight.w500,
                              color: TITLE_POPUP,
                              size: 14,
                            ),
                          ],
                        ),
                      ])),
                ),
              ])),
          SizedBox(height: 16),
          Container(
              color: WHITE,
              padding: EdgeInsets.only(top: 16, right: 16, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustomized(
                    text: LOGIN_EMAIL,
                    font: inter,
                    weight: FontWeight.w400,
                    size: 12,
                    color: TITLE_POPUP,
                  ),
                  TextCustomized(
                    text: controller.mDataProfile!.data!.email!,
                    font: inter,
                    weight: FontWeight.w400,
                    color: BLACK,
                    size: 14,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: TEXT_DATETIME_NT,
                  ),
                  SizedBox(height: 16),
                  TextCustomized(
                    text: role,
                    font: inter,
                    weight: FontWeight.w400,
                    size: 12,
                    color: TITLE_POPUP,
                  ),
                  TextCustomized(
                    text: controller.mDataProfile!.data!.is_admin == 1
                        ? admin
                        : user,
                    font: inter,
                    weight: FontWeight.w400,
                    color: BLACK,
                    size: 14,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: TEXT_DATETIME_NT,
                  ),
                  Column(
                    children: [
                      SizedBox(height: 16.5),
                      InkWell(
                          onTap: () {
                            Get.to(ChangePasswordAdminPage());
                          },
                          child: Row(children: [
                            Text(PROFILE_BT_CHANGE_PASS,
                                style: TextStyle(
                                  fontFamily: roboto,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: TEXT_DATETIME_NT,
                            ),
                            SizedBox(width: 16.5),
                          ])),
                      SizedBox(height: 16),
                      Container(
                        height: 1,
                        color: TEXT_DATETIME_NT,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Get.dialog(DialogLogout());
                    },
                    child: Text(PROFILE_LOGOUT,
                        style: TextStyle(
                          fontFamily: roboto,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(height: 16),
                ],
              ))
        ]);
  }

  Widget buildImageAvt() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: ImageCustomized(
            path: controller.mDataProfile!.data!.avatar.toString().isEmpty
                ? LOGO_IMG
                : controller.mDataProfile!.data!.avatar.toString(),
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
            )),
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
