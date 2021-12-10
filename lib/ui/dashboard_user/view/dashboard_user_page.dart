import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/dashboard_user/controller/dashboard_user_controller.dart';
import 'package:viet_trung_mobile/ui/notification/view/notification_page.dart';
import 'package:viet_trung_mobile/ui/order/view/order_info_page.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class DashboardUserPage extends GetView<DashboardUserController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardUserController>(
        init: DashboardUserController(),
        builder: (value) => Scaffold(
              body: _buildBody(),
            ));
  }

  Widget _buildBody() {
    return Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          imgBackGround(),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              //padding: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              width: Get.width,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50.0, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                child: ClipOval(
                                  child: ImageCustomized(
                                    path: IMG_DASHBOARD,
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(width: 10.0),
                              TextCustomized(
                                text: "abc",
                                color: WHITE,
                                size: mediumSize,
                                weight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              Get.to(NotificationPage());
                            },
                            child: ImageCustomized(
                              path: IC_NAV_NOTIFICATION,
                              color: WHITE,
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextCustomized(
                                text: "8",
                                size: 30,
                                color: WHITE,
                                weight: FontWeight.w700,
                              ),
                              TextCustomized(
                                text: PROFILE_ARRIVAL_ORDER_LIST,
                                size: smallSize,
                                color: WHITE,
                                weight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextCustomized(
                                text: "9 ",
                                size: 30,
                                color: WHITE,
                                weight: FontWeight.w700,
                              ),
                              TextCustomized(
                                text: ORDER_STOCK,
                                size: smallSize,
                                color: WHITE,
                                weight: FontWeight.w700,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    // padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: MAIN_BG,
                    ),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border:
                                  Border(bottom: BorderSide(color: BT_GRAY))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextCustomized(
                                text: ORDER_SHIPPED,
                                color: BLACK_1,
                                weight: FontWeight.w700,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(OrderInfoPage());
                                },
                                child: TextCustomized(
                                  text: HOME_SHOW_ALL,
                                  color: RED_2,
                                  size: smallSize,
                                  weight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return _builListItem();
                            },
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 10);
                            },
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            padding: EdgeInsets.all(0.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }

  Widget imgBackGround() {
    return Image.asset(
      BG_IMG_DASHBOARD,
      fit: BoxFit.cover,
      width: double.maxFinite,
      height: double.maxFinite,
      alignment: Alignment.center,
    );
  }

  Widget _builListItem() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      color: WHITE,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustomized(
                //text: dataOrder.bill_code.toString(),
                text: ORDER_NULL,
                font: SanFranciscoText,
                weight: FontWeight.w700,
                color: MAIN_BLACK,
              ),
              TextCustomized(
                // text: dataOrder.order_status_name.toString(),
                text: ORDER_NULL,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: BG_ID_PD,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          TextCustomized(
            text: ORDER_NULL,
            // text: dataOrder.created_at.toString(),
            font: SanFranciscoTextLight,
            weight: FontWeight.w400,
            color: MAIN_GRAY,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustomized(
                text: ORDER_LIST_PARCELS,
                font: SanFranciscoTextLight,
                weight: FontWeight.w700,
                color: GRAY1,
              ),
              TextCustomized(
                // text: dataOrder.number_package.toString(),
                text: ORDER_NULL,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: BLACK,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustomized(
                text: ORDER_LIST_ITEMS,
                font: SanFranciscoTextLight,
                weight: FontWeight.w700,
                color: GRAY1,
              ),
              TextCustomized(
                // text: dataOrder.item.toString(),
                text: ORDER_NULL,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: BLACK,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustomized(
                text: ORDER_LIST_PACKING_FORM,
                font: SanFranciscoTextLight,
                weight: FontWeight.w700,
                color: GRAY1,
              ),
              TextCustomized(
                // text: dataOrder.packing_form.toString(),
                text: ORDER_NULL,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: BLACK,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustomized(
                text: ORDER_LIST_COD,
                font: SanFranciscoTextLight,
                weight: FontWeight.w700,
                color: GRAY1,
              ),
              TextCustomized(
                // text: "¥"+dataOrder.transport_fee.toString(),
                text: ORDER_NULL,
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: BLACK,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustomized(
                text: ORDER_LIST_DELIVERY_METHOD,
                font: SanFranciscoTextLight,
                weight: FontWeight.w700,
                color: GRAY1,
              ),
              Expanded(
                flex: 5,
                child: TextCustomized(
                  // text: dataOrder.delivery_form.toString(),
                  text: ORDER_NULL,
                  font: SanFranciscoText,
                  weight: FontWeight.w400,
                  color: BLACK,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          //  Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     TextCustomized(
          //       text: ORDER_LIST_DELIVERY_ADDRESS,
          //       font: SanFranciscoTextLight,
          //       weight: FontWeight.w700,
          //       color: GRAY1,
          //       ),
          //       Expanded(
          //         flex: 5,
          //         child:  TextCustomized(
          //         text: dataOrder.address.toString(),
          //         font: SanFranciscoText,
          //         weight: FontWeight.w400,
          //         color: BLACK,
          //           textAlign: TextAlign.end,
          //       ),),

          //   ],
          // ),
        ],
      ),
    );
  }
}
