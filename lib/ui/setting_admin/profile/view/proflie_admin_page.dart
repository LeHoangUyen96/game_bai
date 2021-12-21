import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/profile/view/change_password_admin_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/profile/view/edit_profile_admin_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/profile/view/popup_logout.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

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
                    child: Container(
                        height: 80,
                        width: 80,
                        child: Stack(
                          children: [
                            buildImageAvt(),
                            InkWell(
                                onTap: () {
                                  Get.dialog(_selectedImageDialog());
                                },
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: SvgPicture.asset(
                                      camera,
                                      width: 18,
                                      height: 18,
                                    ))),
                          ],
                        ))),
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
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: ImageCustomized(
          path: controller.mDataProfile!.data!.avatar.toString().isEmpty
              ? LOGO_IMG
              : NetworkConfig.URL_SERVER_BASE_CDN +
                  controller.mDataProfile!.data!.avatar.toString(),
          fit: BoxFit.cover,
          width: 80,
          height: 80,
        ),
      ),
    );
  }

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

  Widget _selectedImageDialog() {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 80,
        width: Get.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: Get.width,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: TEXT_GREY_IN_CART,
                    width: 0.5,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () {
                  controller.onPickerImage(ImageSource.camera);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      TextCustomized(
                        size: smallMediumSize,
                        weight: FontWeight.w500,
                        color: Colors.black,
                        text: PROFILE_NEW_IMAGE,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: Get.width,
              child: InkWell(
                onTap: () {
                  controller.onPickerImage(ImageSource.gallery);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      TextCustomized(
                        size: smallMediumSize,
                        weight: FontWeight.w500,
                        color: Colors.black,
                        text: PROFILE_IMAGE_LIB,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
