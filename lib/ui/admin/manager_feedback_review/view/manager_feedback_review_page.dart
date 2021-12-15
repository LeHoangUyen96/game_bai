import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_feedback_review/contoller/manager_feedback_review_controller.dart';
import 'package:viet_trung_mobile_admin/ui/order/view/order_list.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class FeedbackAndReviewPage extends GetView<ManagerFeedbackReviewController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagerFeedbackReviewController>(
        init: ManagerFeedbackReviewController(),
        builder: (value) => SmartRefresher(
              enablePullUp: true,
              enablePullDown: true,
              controller: controller.refreshController,
              onRefresh: () {
                controller.onRefresh();
              },
              child: Scaffold(
                appBar: buildAppBar(
                  feedbackAndReview,
                  SizedBox(),
                ),
                body: buildBody(),
              ),
            ));
  }

  Widget buildBody() {
    return Container(
      color: MAIN_BG,
      child: Container(
        padding: EdgeInsets.all(10),
        color: WHITE,
        height: 50,
        child: ListView.separated(
          itemCount: controller.listStatus.length,
          separatorBuilder: (context, position) {
            return SizedBox(width: 10);
          },
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final sta = controller.listStatus[index];
            return InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: GRAY1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: WHITE),
                  child: TextCustomized(
                    text: sta.status.toString(),
                    font: SanFranciscoUIText,
                    weight: FontWeight.w700,
                  ),
                ));
          },
        ),
      ),
    );
  }

  Widget buttonGrey(Status text, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: GRAY1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected == true ? COLOR_BT : Colors.transparent),
      child: TextCustomized(
        text: text.status!,
        font: SanFranciscoUIText,
        weight: FontWeight.w700,
      ),
    );
  }
}
