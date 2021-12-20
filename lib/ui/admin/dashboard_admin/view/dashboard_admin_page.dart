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
import 'package:viet_trung_mobile/ui/order_management/order_valid/view/order_ship_back_detail_page.dart';
import 'package:viet_trung_mobile/ui/order_management/order_valid/view/order_valid_page.dart';
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
                                  child: controller.dashboardAdminResponse!.avatar ==null ||
                                          controller.dashboardAdminResponse!.avatar ==''
                                      ? ImageCustomized(
                                          path: LOGO_IMG,
                                          height: 60,
                                          width: 60,
                                        )
                                      : ImageCustomized(
                                          path: controller.dashboardAdminResponse!.avatar,
                                          fit: BoxFit.fill,
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
                              ]
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
                                text: controller.orderTotal.toString(),
                                color: WHITE,
                                size: 36.0,
                                weight: FontWeight.w700,
                              ),
                              TextCustomized(
                                text: "Tổng đơn hàng",
                                color: WHITE,
                                size: smallSize,
                                weight: FontWeight.w400,
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                 width: Get.width*0.35,
                                 height: 20,
                                 child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      padding: EdgeInsets.all(0.0),
                                        alignedDropdown: true,
                                        child: controller.dashboardAdminResponse!.orders != null
                                            ? DropdownButton(
                                                value: controller.selectedTotalOrder !=
                                                        null
                                                    ? controller.selectedTotalOrder
                                                    : null,
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: MAIN_LINE,
                                                ),
                                                underline: Container(),
                                                iconSize: 20,
                                                elevation: 16,
                                                isExpanded: true,
                                                items: controller.dashboardAdminResponse!.orders!
                                                    .map((DataTotalOrder value) {
                                                  return DropdownMenuItem<
                                                      DataTotalOrder>(
                                                    value: value,
                                                    child: Wrap(
                                                      spacing:  5.0,
                                                      children:[ 
                                                        TextCustomized(
                                                          text: value.percent.toString() + "%",
                                                          size: smallSize,
                                                          color: value.percent! >= 0 ? STATUS_SUCCESS : RED,
                                                          weight: FontWeight.w600,
                                                          )
                                                          ,
                                                      Text(
                                                          value.time.toString(),
                                                        style: TextStyle(
                                                          color: MAIN_LINE,
                                                          fontSize: smallSize,
                                                          fontWeight: FontWeight.w600
                                                          ),
                                                      ),
                                                      ]
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (DataTotalOrder? value) {
                                                  controller.onChangeOrderTotal(value!, value.time.toString()) ;
                                                  //controller.onGetOrderTotal();
                                                },
                                                hint: Row(
                                                  children: [
                                                   TextCustomized(
                                                          text: controller.dashboardAdminResponse!.orders![0].percent.toString() + "%",
                                                          size: smallSize,
                                                          color:controller.dashboardAdminResponse!.orders![0].percent! >= 0 ? STATUS_SUCCESS : RED,
                                                          weight: FontWeight.w600,
                                                          )
                                                          ,
                                                      Text(
                                                          controller.dashboardAdminResponse!.orders![0].time.toString(),
                                                        style: TextStyle(
                                                          color: MAIN_LINE,
                                                          fontSize: smallSize,
                                                          fontWeight: FontWeight.w600
                                                          ),
                                                      )
                                                  ],
                                                ),
                                              )
                                            : DropdownButton(
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: MAIN_LINE,
                                                ),
                                                iconSize: 24,
                                                elevation: 16,
                                                isExpanded: true,
                                                items: [
                                                  DropdownMenuItem<String>(
                                                    value: "1",
                                                    child: Center(
                                                      child: Text("Chưa xác định"),
                                                    ),
                                                  ),
                                                ],
                                                onChanged: (value) {},
                                                hint: Text("Chưa xác định"),
                                              )),
                                  ),
                               ), 
                            ],
                          ),
                        ),
                        Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextCustomized(
                                      text: controller.orderWaits.toString(),
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
                                    Container(
                                          width: Get.width*0.35,
                                          height: 20,
                                          child: DropdownButtonHideUnderline(
                                              child: ButtonTheme(
                                                padding: EdgeInsets.all(0.0),
                                                  alignedDropdown: true,
                                                  child: controller.dashboardAdminResponse!.order_waits != null
                                                      ? DropdownButton(
                                                          value: controller.selectedOrderWaits !=
                                                                  null
                                                              ? controller.selectedOrderWaits
                                                              : null,
                                                          icon: Icon(
                                                            Icons.keyboard_arrow_down,
                                                            color: MAIN_LINE,
                                                          ),
                                                          underline: Container(),
                                                          iconSize: 20,
                                                          elevation: 16,
                                                          isExpanded: true,
                                                          items: controller.dashboardAdminResponse!.order_waits!
                                                              .map((DataOrderWaits value) {
                                                            return DropdownMenuItem<
                                                                DataOrderWaits>(
                                                              value: value,
                                                              child: Wrap(
                                                                spacing:  5.0,
                                                                children:[ 
                                                                  TextCustomized(
                                                                    text: value.percent.toString() + "%",
                                                                    size: smallSize,
                                                                    color: value.percent! >= 0 ? STATUS_SUCCESS : RED,
                                                                    weight: FontWeight.w600,
                                                                    )
                                                                    ,
                                                                Text(
                                                                    value.time.toString(),
                                                                  style: TextStyle(
                                                                    color: MAIN_LINE,
                                                                    fontSize: smallSize,
                                                                    fontWeight: FontWeight.w600
                                                                    ),
                                                                ),
                                                                ]
                                                              ),
                                                            );
                                                          }).toList(),
                                                          onChanged: (DataOrderWaits? value) {
                                                            controller.onChangeOrderWaits(value!, value.time.toString()) ;
                                                            //controller.onGetOrderWait();
                                                          },
                                                          hint: Text("Chọn ngày"),
                                                        )
                                                      : DropdownButton(
                                                          icon: Icon(
                                                            Icons.keyboard_arrow_down,
                                                            color: MAIN_LINE,
                                                          ),
                                                          iconSize: 24,
                                                          elevation: 16,
                                                          isExpanded: true,
                                                          items: [
                                                            DropdownMenuItem<String>(
                                                              value: "1",
                                                              child: Center(
                                                                child: Text("Chưa xác định"),
                                                              ),
                                                            ),
                                                          ],
                                                          onChanged: (value) {},
                                                          hint: Text("Chưa xác định"),
                                                        )),
                                            ),
                                        ),
                        
                                  ]
                                )
                      
              
                              
                        ),
                        
                      ]
                    )
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
                          InkWell(
                            onTap: (){
                              Get.to(ValidOrderPage());
                            },
                            child: TextCustomized(
                              text: HOME_SHOW_MORE,
                              color: RED_1,
                              weight: FontWeight.w600,
                            ),
                             ),
                           ] 
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
                        ]
                       )
                       )
                ]
              )
            )
          )
        ]
      );

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
              InkWell(
                onTap: (){
                  Get.to(OrderShipBackDetailPage(),arguments:data.id.toString() );
                },
                child: TextCustomized(
                  text: data.bill_code.toString(),
                  font: SanFranciscoText,
                  weight: FontWeight.w700,
                  color: MAIN_BLACK,
                ),
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
