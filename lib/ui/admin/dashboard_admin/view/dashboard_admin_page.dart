import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/dashboard_admin_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/dashboard_admin/controller/dashboard_admin_controller.dart';
import 'package:viet_trung_mobile/ui/admin/notification_admin/view/notification_admin_page.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class DashboardAdminPage extends GetView<DashboardAdminController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardAdminController>(
        init: DashboardAdminController(),
        builder: (value) => Scaffold(
              body: controller.dashboardAdminResponse != null ? _buildBody() : LoadingSpinKit(),
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
                         Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                child: ClipOval(
                                  child: controller.dashboardAdminResponse!
                                                  .avatar ==
                                              null ||
                                          controller.dashboardAdminResponse!
                                                  .avatar ==
                                              ''
                                      ? ImageCustomized(
                                          path: LOGO_IMG,
                                          height: 60,
                                          width: 60,
                                        )
                                      : ImageCustomized(
                                          path: controller
                                              .dashboardAdminResponse!.avatar,
                                          height: 60,
                                          width: 60,
                                        ),
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(width: 5.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustomized(
                                    text: controller.dashboardAdminResponse!.name.toString(),
                                    color: WHITE,
                                    size: normalSize,
                                    weight: FontWeight.w700,
                                  ),
                                  TextCustomized(
                                    text: controller.dashboardAdminResponse!.role_name.toString(),
                                    color: WHITE,
                                    size: smallSize,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                        ),
                        //SizedBox(width: 10,),
                         Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(color: BT_GRAY))),
                                  child: TextCustomized(
                                    text: "Tỷ giá: "+ ParseNumber.parseInt(controller.dashboardAdminResponse!.exchange_rate).toString(),
                                    color: WHITE,
                                    size: smallSize,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(NotificationAdminPage());
                                    },
                                    child: ImageCustomized(
                                      path: IC_NAV_NOTIFICATION,
                                      color: WHITE,
                                      width: 28,
                                      height: 28,
                                    ),
                                  ),
                                ),
                              ]),
                        
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
                                text: "abc",
                                color: WHITE,
                                size: mediumSize,
                                weight: FontWeight.w700,
                              ),
                              TextCustomized(
                                text: "Tổng đơn hàng",
                                size: smallSize,
                                color: WHITE,
                                size: smallSize,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5.0,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                                border:
                                    Border(right: BorderSide(color: BT_GRAY))),
                            child: TextCustomized(
                              text: "Tỷ giá: 3.75",
                              color: WHITE,
                              size: smallSize,
                              weight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                Get.to(NotificationAdminPage());
                              },
                              child: ImageCustomized(
                                path: IC_NAV_NOTIFICATION,
                                color: WHITE,
                                width: 28,
                                height: 28,
                              ),
                            ),
                          ),
                        ]),
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
                            text: "8.223",
                            size: 36.0,
                            color: WHITE,
                            weight: FontWeight.w700,
                          ),
                          SizedBox(height: 5.0),
                          TextCustomized(
                            text: "ĐH chuyển về",
                            size: smallSize,
                            color: WHITE,
                            weight: FontWeight.w700,
                          ),
                          SizedBox(height: 10.0),
                          Wrap(
                            spacing: 5.0,
                            children: [
                              TextCustomized(
                                text: "+15%",
                                size: smallSize,
                                color: STATUS_SUCCESS,
                                weight: FontWeight.w700,
                              ),
                              TextCustomized(
                                text: "Hôm nay",
                                size: smallSize,
                                color: WHITE,
                                weight: FontWeight.w700,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextCustomized(
                            text: "932 ",
                            size: 36.0,
                            color: WHITE,
                            weight: FontWeight.w700,
                          ),
                          SizedBox(height: 5.0),
                          TextCustomized(
                            text: "ĐH chờ xác nhận",
                            size: smallSize,
                            color: WHITE,
                            weight: FontWeight.w700,
                          ),
                          SizedBox(height: 10.0),
                          Wrap(
                            spacing: 5.0,
                            children: [
                              TextCustomized(
                                text: "-4%",
                                size: smallSize,
                                color: RED_1,
                                weight: FontWeight.w700,
                              ),
                              TextCustomized(
                                text: "Tuần này",
                                size: smallSize,
                                color: WHITE,
                                weight: FontWeight.w700,
                              ),
                            ],
                          )
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
                  color: GRAY9,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustomized(
                            text: ORDER_SHIPPED,
                            color: BLACK_1,
                            weight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return _builListItem(controller.dashboardAdminResponse!.order_closes![index]);
                            },
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 10);
                            },
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.dashboardAdminResponse!.order_closes!.length,
                            padding: EdgeInsets.all(0.0),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
      BG_IMG_DASHBOARD_ADMIN,
      fit: BoxFit.cover,
      width: double.maxFinite,
      height: double.maxFinite,
      alignment: Alignment.center,
    );
  }

  Widget _builListItem(DataOrderCloses data) {
    final Color color;
    color = controller.ColorStatusName(data.order_status_name.toString());
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: WHITE,
        border: Border.all(color: BT_GRAY),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustomized(
                text: data.bill_code.toString(),
                font: SanFranciscoText,
                weight: FontWeight.w700,
                color: MAIN_BLACK,
              ),
              TextCustomized(
                 text: data.order_status_name.toString(),
                font: SanFranciscoText,
                weight: FontWeight.w700,
                color: color,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          TextCustomized(
            text: data.created_at.toString(),
            font: SanFranciscoTextLight,
            weight: FontWeight.w400,
            color: GRAY8,
            size: verySmallSize,
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
                 text: data.number_package.toString(),
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: BLACK,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: BT_GRAY))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustomized(
                  text: ORDER_LIST_ITEMS,
                  font: SanFranciscoTextLight,
                  weight: FontWeight.w700,
                  color: GRAY1,
                ),
                TextCustomized(
                   text:data.item != null ? data.item.toString() : "Chưa xác định",
                  font: SanFranciscoText,
                  weight: FontWeight.w400,
                  color: BLACK,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
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
                text: "¥"+data.transport_fee.toString(),
                font: SanFranciscoText,
                weight: FontWeight.w400,
                color: RED_2,
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
                text: "Phụ phí",
                font: SanFranciscoTextLight,
                weight: FontWeight.w700,
                color: GRAY1,
              ),
              Expanded(
                flex: 5,
                child: TextCustomized(
                   text:  data.surcharge.toString(),
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
        ],
      ),
    );
  }
}
