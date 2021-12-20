import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/list_feedback_review_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_feedback_review/contoller/manager_feedback_review_controller.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_feedback_review/view/manager_feedback_detail.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class FeedbackAndReviewPage extends GetView<ManagerFeedbackReviewController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagerFeedbackReviewController>(
      init: ManagerFeedbackReviewController(),
      builder: (value) => Scaffold(
          appBar: buildAppBar(
            feedbackAndReview,
            SizedBox(),
          ),
          backgroundColor: WHITE,
          body: controller.listResponse != null ? buildBody() : noFeedBack()),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                tabBar(
                    all + ' (${controller.listResponse!.paginate!.total!})', 0),
                tabBar(fiveStar, 1),
                tabBar(twoStar, 2),
                tabBar(threeStar, 3),
                tabBar(fourStar, 4),
                tabBar(oneStar, 5),
              ])),
          SizedBox(height: 10),
          Container(
            color: GRAY5,
            height: 16,
          ),
          controller.positionSelected == 0
              ? listAll()
              : controller.positionSelected == 1
                  ? listFiveStar()
                  : controller.positionSelected == 2
                      ? listFourStar()
                      : controller.positionSelected == 3
                          ? listThreeStar()
                          : controller.positionSelected == 4
                              ? listTwoStar()
                              : listOneStar()
        ],
      ),
    );
  }

  Widget tabBar(String text, int index) {
    return GestureDetector(
      onTap: () {
        controller.onSelect(index);
      },
      child: Container(
        margin: EdgeInsets.only(right: 2),
        child: itemTabBar(
            text, controller.positionSelected == index ? true : false),
      ),
    );
  }

  Widget itemTabBar(String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.transparent : GRAY,
          ),
          borderRadius: BorderRadius.circular(3),
          color: isSelected ? COLOR_BT : WHITE),
      child: TextCustomized(
        text: text,
        font: SanFranciscoUIText,
        weight: FontWeight.w700,
        color: isSelected ? WHITE : GRAY,
      ),
    );
  }

  Widget noFeedBack() {
    return Column(
      children: [
        SizedBox(height: 10),
        Center(child: TextCustomized(text: noFeedback))
      ],
    );
  }

  Widget listAll() {
    return controller.listResponse!.data!.length > 0
        ? SingleChildScrollView(
            child: Column(children: [
            ListView.builder(
              itemCount: controller.listResponse!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return itemFeedback(controller.listResponse!.data![index]);
              },
            ),
          ]))
        : noFeedBack();
  }

  Widget listOneStar() {
    return controller.oneStarResponse!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.oneStarResponse!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return itemFeedback(controller.oneStarResponse!.data![index]);
              },
            ),
          )
        : noFeedBack();
  }

  Widget listTwoStar() {
    return controller.twoStarResponse!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.twoStarResponse!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return itemFeedback(controller.twoStarResponse!.data![index]);
              },
            ),
          )
        : noFeedBack();
  }

  Widget listThreeStar() {
    return controller.threeStarResponse!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.threeStarResponse!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return itemFeedback(controller.threeStarResponse!.data![index]);
              },
            ),
          )
        : noFeedBack();
  }

  Widget listFourStar() {
    return controller.fourStarResponse!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.fourStarResponse!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return itemFeedback(controller.fourStarResponse!.data![index]);
              },
            ),
          )
        : noFeedBack();
  }

  Widget listFiveStar() {
    return controller.fiveStarResponse!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.fiveStarResponse!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return itemFeedback(controller.fiveStarResponse!.data![index]);
              },
            ),
          )
        : noFeedBack();
  }

  Widget itemFeedback(DataFeedbackReviewResponse listResponse) {
    return InkWell(
        onTap: () {
          Get.to(FeedbackDetailPage(), arguments: listResponse.id!.toString());
        },
        child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: BT_GRAY)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextCustomized(
                      text: listResponse.billCode!,
                      font: SanFranciscoText,
                      weight: FontWeight.w700,
                      color: MAIN_BLACK,
                    ),
                    Spacer(),
                    TextCustomized(
                      text: listResponse.orderCompleteAt!,
                      font: inter,
                      weight: FontWeight.w400,
                      color: GRAY3,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(children: [
                  TextCustomized(
                    maxLine: 10,
                    text: listResponse.comment!,
                    font: inter,
                    weight: FontWeight.w400,
                    color: BLACK_1,
                  ),
                  Spacer(),
                  SizedBox(height: 10),
                  listResponse.star == 5
                      ? Row(
                          children: [
                            starAmber(),
                            starAmber(),
                            starAmber(),
                            starAmber(),
                            starAmber()
                          ],
                        )
                      : listResponse.star == 4
                          ? Row(
                              children: [
                                starAmber(),
                                starAmber(),
                                starAmber(),
                                starAmber(),
                                starGrey()
                              ],
                            )
                          : listResponse.star == 3
                              ? Row(
                                  children: [
                                    starAmber(),
                                    starAmber(),
                                    starAmber(),
                                    starGrey(),
                                    starGrey()
                                  ],
                                )
                              : listResponse.star == 2
                                  ? Row(
                                      children: [
                                        starAmber(),
                                        starAmber(),
                                        starGrey(),
                                        starGrey(),
                                        starGrey()
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        starAmber(),
                                        starGrey(),
                                        starGrey(),
                                        starGrey(),
                                        starGrey()
                                      ],
                                    )
                ]),
                SizedBox(height: 5)
              ],
            )));
  }

  Widget starAmber() {
    return Icon(
      Icons.star,
      color: Colors.amber,
      size: 19,
    );
  }

  Widget starGrey() {
    return Icon(
      Icons.star,
      color: Colors.grey,
      size: 19,
    );
  }
}
