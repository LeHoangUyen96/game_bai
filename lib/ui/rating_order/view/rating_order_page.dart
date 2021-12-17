import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/list_rating_order_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/rating_order/controller/rating_order_controller.dart';
import 'package:viet_trung_mobile_admin/ui/rating_order/view/review_order_page.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class RatingOrderPage extends GetView<RatingOrderController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<RatingOrderController>(
      init: RatingOrderController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body: controller.listRatingOrderResponse != null
            ? buildBody()
            : LoadingSpinKit(),
        backgroundColor: BT_GRAY,
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: InitialWidget(
        child: Container(),
        titleAppBar: RATING_ORDER,
        isCenterTitle: false,
        backgroundAppBar: Colors.black26,
        isShowBack: true,
        iconBack: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _builListRating(
                controller.listRatingOrderResponse!.data![index]);
          },
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          physics: BouncingScrollPhysics(),
          itemCount: controller.listRatingOrderResponse!.data!.length),
    );
  }

  Widget _builListRating(DataListRatingOrderResponse data) {
    return Container(
      padding: EdgeInsets.all(15),
      color: WHITE,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: BT_GRAY))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ReviewOrderPage());
                            },
                            child: TextCustomized(
                              text: data.bill_code.toString(),
                              color: BLACK_1,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Wrap(
                              spacing: 5.0,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Container(
                                  // child: RatingBar.builder(
                                  //   initialRating: 3,
                                  //   minRating: 1,
                                  //   direction: Axis.horizontal,
                                  //   allowHalfRating: false,
                                  //   itemCount: 5,
                                  //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                  //   itemBuilder: (context, _) => Icon(
                                  //     Icons.star,
                                  //     color: Colors.amber,
                                  //   ),
                                  //   onRatingUpdate: (rating) {
                                  //     print(rating);
                                  //   },
                                  // ),
                                  child: RatingBarIndicator(
                                    rating: data.star!.toDouble(),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    unratedColor: BT_GRAY,
                                    direction: Axis.horizontal,
                                    itemPadding: EdgeInsets.all(0.0),
                                  ),
                                ),
                                TextCustomized(
                                  text: data.created_at.toString(),
                                  color: TITLE_POPUP,
                                  size: smallSize,
                                  font: SanFranciscoUIText,
                                  weight: FontWeight.w400,
                                ),
                              ]),
                        ],
                      ),
                      ButtonCustomized(
                        CONTINUE_DELETE_IN_CART,
                        onTap: () {},
                        width: 45,
                        height: 35,
                        backgroundColor: WHITE,
                        textColor: TITLE_POPUP,
                        borderColor: TITLE_POPUP,
                        textStyle: TextStyle(
                            fontSize: 11,
                            fontFamily: SanFranciscoText,
                            color: TITLE_POPUP),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                TextCustomized(
                  text: data.comment.toString(),
                  color: TITLE_POPUP,
                  size: smallSize,
                  font: SanFranciscoUIText,
                  weight: FontWeight.w700,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Wrap(spacing: 2.0, children: [
            TextCustomized(
              text: "Đơn hàng đã hoàn thành vào ngày",
              color: TITLE_POPUP,
              size: smallSize,
              font: SanFranciscoUIText,
              weight: FontWeight.w700,
            ),
            TextCustomized(
              text: data.order_complete_at.toString(),
              color: TITLE_POPUP,
              size: smallSize,
              font: SanFranciscoUIText,
              weight: FontWeight.w700,
            ),
          ]),
        ],
      ),
    );
  }
}
