import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:viet_trung_mobile/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/order_valid/controller/order_ship_back_detail_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/order_valid/view/item_images.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class OrderShipBackDetailPage extends GetView<OrderShipBackDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderShipBackDetailController>(
        init: OrderShipBackDetailController(),
        builder: (value) => Scaffold(
            appBar: buildAppBar(
                ORDER_HEADER_DETAILS,
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: WHITE,
                    ),
                  ),
                )),
            body: controller.orderShipBack != null
                ? buildBody(controller.orderShipBack!.data!)
                : SizedBox()));
  }

  Widget buildBody(DataOrderAdminDetail response) {
    return Container(
      color: GRAY7,
      padding: EdgeInsets.only(top: Get.height * 0.01),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: WHITE,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: TextCustomized(
                      text: infoOrder,
                      size: 16,
                      weight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
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
                              text: response.billCode!,
                              font: SanFranciscoText,
                              weight: FontWeight.w700,
                              color: MAIN_BLACK,
                            ),
                            TextCustomized(
                              text: response.orderStatusName!,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BG_ID_PD,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextCustomized(
                          text: response.createdAt!,
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w400,
                          color: MAIN_GRAY,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _text(customer),
                            TextCustomized(
                              text: response.name!,
                              weight: FontWeight.w500,
                              color: BLACK,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _text(PHONE),
                            Spacer(),
                            TextCustomized(
                              text: response.phone!,
                              weight: FontWeight.w500,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _text(ADMIN_NUMBER_PACKAGES),
                            TextCustomized(
                              text: response.numberPackage!.toString(),
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BLACK,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _text(ADMIN_ITEMS),
                            TextCustomized(
                              text: response.item!,
                              font: SanFranciscoText,
                              weight: FontWeight.w400,
                              color: BLACK,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: Get.width,
                          height: 0.5,
                          color: GRAY1,
                        ),
                        SizedBox(height: 10),
                        controller.orderShipBack != null
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
                      ],
                    ),
                  )
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
                  AddImageConfirmOrderValid(),
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
                  _itemInfoTransport(packFormat, response.packingForm!),
                  SizedBox(height: 7),
                  _itemInfoTransport(transformeFormat, response.transportForm!),
                  SizedBox(height: 7),
                  _itemInfoTransport(deliveryFormat, response.deliveryForm!),
                  SizedBox(height: 7),
                  _itemInfoTransport(warehouse, response.orderStatusName!),
                  SizedBox(height: 7),
                  _itemInfoTransport(note, response.note!),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              color: WHITE,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemCheckBox(),
                  SizedBox(height: 10),
                  ButtonCustomized(
                    save,
                    onTap: () {
                      controller.onSave(response.id!);
                    },
                    backgroundColor: COLOR_BT,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            controller.orderShipBack!.data!.orderJouney != null
                ? Container(
                    color: WHITE,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: TextCustomized(
                            text: orderJourney,
                            size: 16,
                            font: SanFranciscoText,
                            weight: FontWeight.w700,
                            color: BLACK,
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: 0.5,
                          color: GRAY,
                        ),
                        _itemOrderJourney(
                          response
                              .orderJouney![response.orderJouney!.length - 1],
                          Colors.green,
                        ),
                        SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: response.orderJouney!.length - 1,
                            shrinkWrap: true,
                            reverse: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return _itemOrderJourney(
                                response.orderJouney![index],
                                MAIN_GRAY,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _itemCheckBox() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              controller.onCheck();
            },
            child: SizedBox(
                height: 18,
                width: 18,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 2,
                      color:
                          controller.isCheck == true ? COLOR_BT : Colors.black,
                    )),
                    child: controller.isCheck == true
                        ? const Center(
                            child: Icon(
                            Icons.check,
                            color: COLOR_BT,
                            size: 16,
                          ))
                        : const SizedBox())),
          ),
          const SizedBox(width: 10),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustomized(
                    text: 'Hàng không vận chuyển được',
                    textOverflow: TextOverflow.ellipsis,
                    maxLine: 2,
                    textAlign: TextAlign.start,
                  ),
                ],
              ))
        ],
      ),
      const SizedBox(height: 5),
    ]);
  }

  Widget _text(String text) {
    return TextCustomized(
      text: text,
      font: SanFranciscoTextLight,
      weight: FontWeight.w700,
      color: GRAY1,
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
}
