import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_no_transport/controller/order_not_shipped_detail_controller.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_no_transport/view/item_images.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class OrderDetailNotShippedPage
    extends GetView<OrderNoTransportDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderNoTransportDetailController>(
      init: OrderNoTransportDetailController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(ORDER_HEADER_DETAILS, SizedBox()),
        body: controller.orderNoTransport != null
            ? buildBody(controller.orderNoTransport!.data!)
            : SizedBox(),
      ),
    );
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                              _text(PHONE),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    launch(('tel://${response.phone!}'));
                                  },
                                  child: TextCustomized(
                                    text: response.phone!,
                                    weight: FontWeight.w500,
                                  )),
                              SizedBox(width: 2),
                              Icon(Icons.phone, size: 16, color: Colors.black)
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
                          controller.orderNoTransport != null
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
                                                disabledBorder:
                                                    InputBorder.none,
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
                    AddImageOrderNoTransport(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: WHITE,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        itemCount: controller.methodSend.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Radio(
                                  value: index,
                                  groupValue: controller.currentMethodSend,
                                  activeColor: COLOR_BT,
                                  onChanged: (int? value) {
                                    controller.onChangeMethodSend(
                                      controller.methodSend[index],
                                      value!,
                                    );
                                  }),
                              Text(controller.methodSend[index].name!),
                            ],
                          );
                        }),
                    SizedBox(height: 10),
                    TextCustomized(
                      text: NOTES_IN_CART,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 5),
                    TextFieldCustomized(
                      textController: controller.noteController,
                      hint: NOTES_IN_CART,
                      maxLine: 5,
                      height: 100,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20),
                    ButtonCustomized(
                      save,
                      backgroundColor: COLOR_BT,
                      onTap: () {
                        controller.onSave(response.id!);
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ])));
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
