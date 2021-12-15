import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/size.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/general_management/controller/general_management_controller.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_bag/view/manager_bag_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_feedback_review/view/manager_feedback_review_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_staff/view/manager_staff_list_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_user/view/manager_user_list_page.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class GenaeralManagePage extends GetView<GenaralManageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenaralManageController>(
      init: GenaralManageController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(child: buildBody()),
        backgroundColor: BT_GRAY,
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        title: TextCustomized(
          text: MANAGE_PACKAGE_GENERAL,
          color: WHITE,
          font: SanFranciscoText,
          isCenter: true,
        ),
        flexibleSpace: Image(
          image: AssetImage(BG_IMG),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
    );
  }

  Widget buildBody() {
    return Container(
      color: BT_GRAY,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: WHITE,
              border: Border(bottom: BorderSide(color: GRAY)),
            ),
            child: InkWell(
              onTap: () {
                Get.to(ManagerBagPage());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: SvgPicture.asset(IC_WAREHOUSE)),
                  Expanded(
                    flex: 6,
                    child: TextCustomized(
                      text: MANAGE_PACKAGE,
                      size: normalSize,
                      font: SanFranciscoText,
                      weight: FontWeight.w700,
                    ),
                  ),
                  SvgPicture.asset(IC_ARROWS_RIGHT),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: WHITE,
              border: Border(bottom: BorderSide(color: GRAY)),
            ),
            child: InkWell(
              onTap: () {
                Get.to(ManagerStaffPage());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: SvgPicture.asset(IC_ID_CARD)),
                  Expanded(
                    flex: 6,
                    child: TextCustomized(
                      text: MANAGE_PACKAGE_EMPLOYEE,
                      size: normalSize,
                      font: SanFranciscoText,
                      weight: FontWeight.w700,
                    ),
                  ),
                  SvgPicture.asset(IC_ARROWS_RIGHT),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: WHITE,
              border: Border(bottom: BorderSide(color: GRAY)),
            ),
            child: InkWell(
              onTap: () {
                Get.to(ManagerUserPage());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: SvgPicture.asset(IC_MANAGER_USER)),
                  Expanded(
                    flex: 6,
                    child: TextCustomized(
                      text: MANAGE_PACKAGE_CUSTOMER,
                      size: normalSize,
                      font: SanFranciscoText,
                      weight: FontWeight.w700,
                    ),
                  ),
                  SvgPicture.asset(IC_ARROWS_RIGHT),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: WHITE,
            ),
            child: InkWell(
              onTap: () {
                Get.to(FeedbackAndReviewPage());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: SvgPicture.asset(IC_REVIEW)),
                  Expanded(
                    flex: 6,
                    child: TextCustomized(
                      text: MANAGE_PACKAGE_FEEDBACK,
                      size: normalSize,
                      font: SanFranciscoText,
                      weight: FontWeight.w700,
                    ),
                  ),
                  SvgPicture.asset(IC_ARROWS_RIGHT),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
