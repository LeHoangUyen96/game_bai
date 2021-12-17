import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_shipped/controller/order_vietnam_detail_controller.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_shipped/view/item_images_order_vn.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class OrderVietNamDetailPage extends GetView<OrderVietnamDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderVietnamDetailController>(
      init: OrderVietnamDetailController(),
      builder: (value) => Scaffold(
          appBar: buildAppBar(ORDER_HEADER_DETAILS, SizedBox()),
          body: controller.orderDetail != null ? buildBody() : SizedBox()),
    );
  }

  Widget buildBody() {
    return Container(
      color: GRAY7,
      padding: EdgeInsets.only(top: Get.height * 0.01),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: WHITE,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: TextCustomized(
                      text: infoOrder,
                      size: 16,
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: Get.width,
                    height: 0.5,
                    color: GRAY1,
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextCustomized(
                                text: controller.orderDetail!.data!.billCode!,
                                font: SanFranciscoText,
                                weight: FontWeight.w700,
                                color: MAIN_BLACK,
                              ),
                              TextCustomized(
                                text: controller
                                    .orderDetail!.data!.orderStatusName!,
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: controller.orderDetail!.data!
                                            .orderStatusName! ==
                                        ORDER_EXPORT_TO_CHINA
                                    ? COLOR_ORDER_CHINESE_WAREHOUSE
                                    : controller.orderDetail!.data!
                                                .orderStatusName! ==
                                            ORDER_BORDER_WAREHOUSE
                                        ? COLOR_ORDER_BORDER_WAREHOUSE
                                        : controller.orderDetail!.data!
                                                    .orderStatusName! ==
                                                ORDER_PROCESS
                                            ? COLOR_ORDER_PROCESS
                                            : controller.orderDetail!.data!
                                                        .orderStatusName! ==
                                                    ORDER_HN_WAREHOUSE
                                                ? COLOR_ORDER_HN_WAREHOUSE
                                                : controller.orderDetail!.data!
                                                            .orderStatusName! ==
                                                        ORDER_SG_WAREHOUSE
                                                    ? COLOR_ORDER_SG_WAREHOUSE
                                                    : controller
                                                                .orderDetail!
                                                                .data!
                                                                .orderStatusName! ==
                                                            ORDER_DN_WAREHOUSE
                                                        ? COLOR_ORDER_DN_WAREHOUSE
                                                        : controller
                                                                    .orderDetail!
                                                                    .data!
                                                                    .orderStatusName! ==
                                                                ORDER_DELIVERY_IN_PROGRESS
                                                            ? COLOR_ORDER_DELIVERY_IN_PROGRESS
                                                            : COLOR_ORDER_DELIVERY_SUCCESSFULL,
                              ),
                            ]),
                        SizedBox(height: 10),
                        TextCustomized(
                            text: controller.orderDetail!.data!.createdAt!,
                            font: SanFranciscoTextLight,
                            weight: FontWeight.w400,
                            color: MAIN_GRAY),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextCustomized(
                                text: customer,
                                font: SanFranciscoTextLight,
                                weight: FontWeight.w700,
                                color: GRAY1,
                              ),
                              TextCustomized(
                                text: controller.orderDetail!.data!.name!,
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: BLACK,
                              ),
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextCustomized(
                                text: PHONE,
                                font: SanFranciscoTextLight,
                                weight: FontWeight.w700,
                                color: GRAY1,
                              ),
                              TextCustomized(
                                text: controller.orderDetail!.data!.phone!,
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: BLACK,
                              ),
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextCustomized(
                                text: 'Số lượng bao',
                                font: SanFranciscoTextLight,
                                weight: FontWeight.w700,
                                color: GRAY1,
                              ),
                              TextCustomized(
                                text: controller
                                    .orderDetail!.data!.numberPackage!
                                    .toString(),
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: BLACK,
                              ),
                            ]),
                        SizedBox(height: 10),
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
                                text: "10",
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: BLACK,
                              ),
                            ]),
                        SizedBox(height: 10),
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
                                text: controller.orderDetail!.data!.item!,
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: BLACK,
                              ),
                            ]),
                        SizedBox(height: 10),
                        Container(width: Get.width, height: 0.5, color: GRAY1),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        controller.orderDetail != null
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _text(ORDER_LIST_COD),
                                  Spacer(),
                                  TextCustomized(
                                    text: "¥",
                                    font: SanFranciscoText,
                                    weight: FontWeight.w400,
                                    color: BLACK,
                                  ),
                                  controller.isEditTransport == true
                                      ? SizedBox(
                                          height: 22,
                                          width: 50,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                            ),
                                            style: TextStyle(
                                              fontFamily: SanFranciscoText,
                                              fontWeight: FontWeight.w400,
                                              color: BLACK,
                                            ),
                                            onSubmitted: (newValue) {
                                              controller.textTransportFee =
                                                  newValue;
                                              controller.isEditTransport =
                                                  false;
                                            },
                                            autofocus: true,
                                            controller: controller
                                                .transportFeeController,
                                          ))
                                      : InkWell(
                                          onTap: () {
                                            controller.onChangeTransportFee();
                                          },
                                          child: Text(
                                            controller.textTransportFee!,
                                            style: TextStyle(
                                              fontFamily: SanFranciscoText,
                                              fontWeight: FontWeight.w400,
                                              color: BLACK,
                                            ),
                                          )),
                                  SizedBox(width: 3),
                                  ImageCustomized(
                                    path: ic_edit,
                                    height: 12,
                                    width: 12,
                                    color: BLACK,
                                  ),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _text(MANAGE_PACKAGE_SURCHARGE),
                              Spacer(),
                              TextCustomized(
                                text: "¥",
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: BLACK,
                              ),
                              controller.isEditSurcharge == true
                                  ? SizedBox(
                                      height: 22,
                                      width: 50,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          fontFamily: SanFranciscoText,
                                          fontWeight: FontWeight.w400,
                                          color: BLACK,
                                        ),
                                        onSubmitted: (newValue) {
                                          controller.textSurcharge = newValue;
                                          controller.isEditSurcharge = false;
                                        },
                                        autofocus: true,
                                        controller:
                                            controller.surchargeController,
                                      ))
                                  : InkWell(
                                      onTap: () {
                                        controller.onChangeSurcharge();
                                      },
                                      child: Text(
                                        controller.textSurcharge!,
                                        style: TextStyle(
                                          fontFamily: SanFranciscoText,
                                          fontWeight: FontWeight.w400,
                                          color: BLACK,
                                        ),
                                      )),
                              SizedBox(width: 3),
                              ImageCustomized(
                                path: ic_edit,
                                height: 12,
                                width: 12,
                                color: BLACK,
                              ),
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _text(transportFee),
                              Spacer(),
                              TextCustomized(
                                text: "¥",
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: BLACK,
                              ),
                              controller.isEditVNFee == true
                                  ? SizedBox(
                                      height: 22,
                                      width: 50,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          fontFamily: SanFranciscoText,
                                          fontWeight: FontWeight.w400,
                                          color: BLACK,
                                        ),
                                        onSubmitted: (newValue) {
                                          controller.textVNFee = newValue;
                                          controller.isEditVNFee = false;
                                        },
                                        autofocus: true,
                                        controller: controller.vnFeeController,
                                      ))
                                  : InkWell(
                                      onTap: () {
                                        controller.onChangeVNFee();
                                      },
                                      child: Text(
                                        controller.textVNFee!,
                                        style: TextStyle(
                                          fontFamily: SanFranciscoText,
                                          fontWeight: FontWeight.w400,
                                          color: BLACK,
                                        ),
                                      )),
                              SizedBox(width: 3),
                              ImageCustomized(
                                path: ic_edit,
                                height: 12,
                                width: 12,
                                color: BLACK,
                              ),
                            ]),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: WHITE,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustomized(
                    text: ADMIN_IMG,
                    size: 16,
                    font: SanFranciscoText,
                    weight: FontWeight.w700,
                    color: BLACK,
                  ),
                  AddImageOrderShippedVN(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                color: WHITE,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(children: [
                  _itemInfoTransport(
                      packFormat, controller.orderDetail!.data!.packingForm!),
                  SizedBox(height: 7),
                  _itemInfoTransport(transformeFormat,
                      controller.orderDetail!.data!.transportForm!),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _text(deliveryFormat),
                      Spacer(),
                      Expanded(
                          flex: 0,
                          child: _text(
                              controller.orderDetail!.data!.deliveryForm!)),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _text(warehouse),
                      Spacer(),
                      Expanded(
                          flex: 0,
                          child: _text(
                              controller.orderDetail!.data!.storageReceive!)),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _text(note),
                      Spacer(),
                      Expanded(
                          flex: 0,
                          child: _text(controller.orderDetail!.data!.note!)),
                    ],
                  )
                ])),
            SizedBox(height: 10),
            Container(
              color: WHITE,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustomized(
                                text: kg,
                                size: 14,
                                font: SanFranciscoText,
                                weight: FontWeight.w700,
                                color: BLACK,
                              ),
                              SizedBox(height: 10),
                              TextFieldCustomized(
                                textController: controller.volumeController,
                                hint: inputWeight,
                              ),
                            ],
                          )),
                      SizedBox(width: 5),
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustomized(
                                text: m3,
                                size: 14,
                                font: SanFranciscoText,
                                weight: FontWeight.w700,
                                color: BLACK,
                              ),
                              SizedBox(height: 10),
                              TextFieldCustomized(
                                textController: controller.weightController,
                                hint: inputVolume,
                              ),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                ]),
              ),
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ButtonCustomized(
                  save,
                  backgroundColor: COLOR_BT,
                  onTap: () {
                    controller.onSave();
                  },
                )),
            SizedBox(height: 10),
            Container(
              color: WHITE,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: TextCustomized(
                      text: orderJourney,
                      size: 16,
                      font: inter,
                      weight: FontWeight.w500,
                      color: BLACK,
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 0.5,
                    color: GRAY1,
                  ),
                  _itemOrderJourney(
                    controller.orderDetail!.data!.orderJouney![8],
                    Colors.green,
                  ),
                  SingleChildScrollView(
                    child: ListView.builder(
                      itemCount:
                          controller.orderDetail!.data!.orderJouney!.length - 1,
                      shrinkWrap: true,
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return _itemOrderJourney(
                          controller.orderDetail!.data!.orderJouney![index],
                          MAIN_GRAY,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _itemOrderJourney(OrderJourney orderJourney, Color color) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          TimelineTile(
            isFirst: true,
            alignment: TimelineAlign.manual,
            lineXY: 0.4,
            indicatorStyle: IndicatorStyle(
              color: color,
              height: 10,
              width: 10,
              drawGap: false,
              indicatorXY: 0,
            ),
            beforeLineStyle: LineStyle(color: BT_GRAY, thickness: 2),
            endChild: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustomized(
                    text: orderJourney.statusName!,
                    font: SanFranciscoTextLight,
                    weight: FontWeight.w400,
                    color: color,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            startChild: Container(
              child: Container(
                alignment: const Alignment(0.7, -0.800),
                child: TextCustomized(
                  text: orderJourney.createdAt!,
                  font: SanFranciscoTextLight,
                  weight: FontWeight.w400,
                  color: MAIN_GRAY,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemInfoTransport(String title, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _text(title),
        Spacer(),
        _text(info),
      ],
    );
  }

  Widget _text(String text) {
    return TextCustomized(
      text: text,
      font: SanFranciscoTextLight,
      weight: FontWeight.w700,
      color: GRAY1,
    );
  }
}
