import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/detail_user_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/size.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_user/controller/detail_user_controller.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_user/view/edit_customer_page.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class DetailUserPage extends GetView<DetailUserController> {
  BuildContext? mContext;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<DetailUserController>(
      init: DetailUserController(),
      builder: (value) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(),
        body: controller.detailUserResponse != null
            ? SingleChildScrollView(child: buildBody())
            : LoadingSpinKit(),
        backgroundColor: BT_GRAY,
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        title: TextCustomized(
          text: MANAGE_PACKAGE_CUSTOMER,
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
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: WHITE,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(EditCustomerPage(),
                  arguments: controller.detailUserResponse!.data!.id!);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
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

  Widget buildBody() {
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
                Container(
                    height: 70,
                    width: 70,
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 50.0,
                        child: ClipOval(
                          child: controller.detailUserResponse!.data!.avatar ==
                                      null ||
                                  controller.detailUserResponse!.data!.avatar ==
                                      ''
                              ? ImageCustomized(
                                  path: LOGO_IMG,
                                  height: 70,
                                  width: 70,
                                )
                              : ImageCustomized(
                                  path: controller
                                      .detailUserResponse!.data!.avatar,
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ])),
                SizedBox(height: 5.0),
                TextCustomized(
                    text: controller.detailUserResponse!.data!.name!,
                    font: inter,
                    weight: FontWeight.w500,
                    size: 16),
                SizedBox(height: 5),
                Wrap(
                  spacing: 5.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IC_ACCOUNT,
                      color: GRAY3,
                    ),
                    TextCustomized(
                      text: controller.detailUserResponse!.data!.user_code!,
                      size: normalSize,
                      color: GRAY3,
                    )
                  ],
                ),
                SizedBox(height: 5.0),
                Wrap(
                  spacing: 5.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IC_PHONE,
                      color: GRAY3,
                    ),
                    TextCustomized(
                      text:
                          controller.detailUserResponse!.data!.phone.toString(),
                      size: normalSize,
                      color: GRAY3,
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
                  color: GRAY3,
                ),
                SizedBox(height: 10.0),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: BT_GRAY))),
                  child: TextCustomized(
                    text: controller.detailUserResponse!.data!.email.toString(),
                    color: BT_CONFIRM,
                  ),
                ),
                SizedBox(height: 15.0),
                TextCustomized(
                  text: ADDRESS,
                  color: GRAY3,
                ),
                SizedBox(height: 10.0),
                Container(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return _buildListAdress(controller
                            .detailUserResponse!.data!.addresses![index]);
                      },
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      physics: BouncingScrollPhysics(),
                      itemCount: controller
                          .detailUserResponse!.data!.addresses!.length),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(15),
            child: ButtonCustomized(
              resetPassword,
              textColor: WHITE,
              onTap: () {
                controller.onResetPassword();
              },
              backgroundColor: COLOR_BT,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListAdress(DataAddresses data) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(bottom: 5.0),
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: BT_GRAY))),
      child: TextCustomized(
        text: data.full_address.toString(),
        color: BT_CONFIRM,
      ),
    );
  }
}
