import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viet_trung_mobile/data/response/order_admin_detail_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/view/add_image_enter_warehouse_page.dart';
import 'package:viet_trung_mobile/ui/order_management/order_wait_confirm/controller/order_wait_confirm_detail_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class OrderDetailsWaitingForConfirmPage
    extends GetView<OrderWaitConfirmDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderWaitConfirmDetailController>(
      init: OrderWaitConfirmDetailController(),
      builder: (value) => Scaffold(
          appBar: buildAppBar(),
          body: controller.orderWaitConfirmDetail != null
              ? buildBody(controller.orderWaitConfirmDetail!.data!)
              : SizedBox()),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
        preferredSize: Size(double.infinity, 55),
        child: InitialWidget(
          child: Container(),
          titleAppBar: ORDER_HEADER_DETAILS,
          backgroundAppBar: Colors.black26,
          isShowBack: true,
          iconBack: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: WHITE,
            ),
          ),
        ));
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
                                text: waitConfirm,
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: TEXT_ORDER_W_CONFIRM,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _text(ORDER_LIST_COD),
                              Spacer(),
                              TextCustomized(
                                text: "¥${response.transportFee}",
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: BLACK,
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                  onTap: () {},
                                  child: ImageCustomized(
                                    path: ic_edit,
                                    height: 12,
                                    width: 12,
                                  )),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _text(MANAGE_PACKAGE_SURCHARGE),
                              Spacer(),
                              TextCustomized(
                                text: "¥${response.surcharge}",
                                font: SanFranciscoText,
                                weight: FontWeight.w400,
                                color: BLACK,
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                  onTap: () {},
                                  child: ImageCustomized(
                                    path: ic_edit,
                                    height: 12,
                                    width: 12,
                                  )),
                            ],
                          ),
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
                    AddImageEnterWarehouse(),
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
                    _itemTitle(transformeFormat),
                    SizedBox(height: 5),
                    _itemDropdown(
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                                alignedDropdown: true,
                                child: controller.transportForm != null
                                    ? DropdownButton(
                                        value: controller
                                                    .selectedTransportForm !=
                                                null
                                            ? controller.selectedTransportForm
                                            : null,
                                        icon: _iconDropdown(),
                                        iconSize: 24,
                                        elevation: 16,
                                        isExpanded: true,
                                        items: controller.transportForm!
                                            .map((DataTransportForm value) {
                                          return DropdownMenuItem<
                                              DataTransportForm>(
                                            value: value,
                                            child: Text(
                                              value.name.toString(),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (DataTransportForm? value) {
                                          controller.onChangeTransport(
                                              value!, value.id!);
                                        },
                                        hint: Text(transformeFormat),
                                      )
                                    : DropdownButton(
                                        icon: _iconDropdown(),
                                        iconSize: 24,
                                        elevation: 16,
                                        isExpanded: true,
                                        items: [
                                          DropdownMenuItem<String>(
                                            value: "1",
                                            child: Text(transformeFormat),
                                          ),
                                        ],
                                        onChanged: (value) {},
                                        hint: Text(transformeFormat),
                                      )),
                          ),
                        ),
                        Get.width),
                    SizedBox(height: 5),
                    controller.transportValid == false
                        ? TextCustomized(
                            text: controller.transportError.toString(),
                            color: Colors.red,
                          )
                        : Container(),
                    SizedBox(height: 10),
                    _itemTitle(packFormat),
                    SizedBox(height: 5),
                    _itemDropdown(
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                                alignedDropdown: true,
                                child: controller.packingForm != null
                                    ? DropdownButton(
                                        value: controller.selectedPackingForm !=
                                                null
                                            ? controller.selectedPackingForm
                                            : null,
                                        icon: _iconDropdown(),
                                        iconSize: 24,
                                        elevation: 16,
                                        isExpanded: true,
                                        items: controller.packingForm!
                                            .map((DataPackingForm value) {
                                          return DropdownMenuItem<
                                              DataPackingForm>(
                                            value: value,
                                            child: Text(
                                              value.name.toString(),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (DataPackingForm? value) {
                                          controller.onChangePacking(
                                              value!, value.id!);
                                        },
                                        hint: Text(packFormat),
                                      )
                                    : DropdownButton(
                                        icon: _iconDropdown(),
                                        iconSize: 24,
                                        elevation: 16,
                                        isExpanded: true,
                                        items: [
                                          DropdownMenuItem<String>(
                                            value: "1",
                                            child: Text(packFormat),
                                          ),
                                        ],
                                        onChanged: (value) {},
                                        hint: Text(packFormat),
                                      )),
                          ),
                        ),
                        Get.width),
                    SizedBox(height: 5),
                    controller.packingValid == false
                        ? TextCustomized(
                            text: controller.packingError.toString(),
                            color: Colors.red)
                        : Container(),
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
                      backgroundColor: Colors.grey,
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

  Widget _itemTitle(String text) {
    return TextCustomized(
      text: text,
      color: Colors.black,
      weight: FontWeight.w500,
    );
  }

  Widget _iconDropdown() {
    return Icon(
      Icons.keyboard_arrow_down,
      color: MAIN_LINE,
    );
  }

  Widget _itemDropdown(Widget dropdown, double width) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: MAIN_LINE),
            borderRadius: BorderRadius.circular(9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dropdown,
          ],
        ));
  }
}
