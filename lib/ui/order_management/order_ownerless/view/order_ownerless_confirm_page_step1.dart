import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/city_response.dart';
import 'package:viet_trung_mobile/data/response/district_response.dart';
import 'package:viet_trung_mobile/data/response/packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/transport_form_response.dart';
import 'package:viet_trung_mobile/data/response/wards_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/controller/order_ownerleess_confirm_controller_step1.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/view/search_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class OwneslessOrderConfirmPageStep1
    extends GetView<OrderOwnerlessConfirmControllerStep1> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderOwnerlessConfirmControllerStep1>(
        init: OrderOwnerlessConfirmControllerStep1(),
        builder: (value) => Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size(double.infinity, 55),
                  child: InitialWidget(
                      child: Container(),
                      titleAppBar: verifi,
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
                      ))),
              body: buildBody(),
              backgroundColor: GRAY_BG,
            ));
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          SearchTextField(
            searchController: controller.searchController,
          ),
          SizedBox(height: 15),
          Container(
            height: 16,
            color: GRAY5,
          ),
          _itemInfoOrder(),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: controller.methodSend
                .map(
                  (method) => Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: controller.currentMethodSend,
                          activeColor: COLOR_BT,
                          onChanged: (int? value) {
                            controller.currentMethodSend = value!;
                          }),
                      Text(method.name!),
                    ],
                  ),
                )
                .toList(),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    controller.wardsValid == false
                        ? TextCustomized(
                            text: controller.wardsError.toString(),
                            color: Colors.red,
                            size: 12,
                          )
                        : Container(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    controller.wardsValid == false
                        ? TextCustomized(
                            text: controller.wardsError.toString(),
                            color: Colors.red)
                        : Container(),
                  ],
                ),
                _itemTextAndTextField(
                  note,
                  controller.noteController,
                  Get.width,
                  TextInputType.text,
                ),
              ])),
          SizedBox(height: 30),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                ButtonCustomized(
                  save,
                  textColor: Colors.white,
                  onTap: () {
                    controller.onVerifi();
                  },
                  backgroundColor: COLOR_BT,
                  height: 48,
                  width: Get.width,
                ),
                SizedBox(height: 10),
                ButtonCustomized(
                  cancel,
                  textColor: Colors.black,
                  borderColor: Colors.grey,
                  onTap: () {
                    Get.back();
                  },
                  backgroundColor: Colors.white,
                  height: 48,
                  width: Get.width,
                )
              ])),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _itemInfoOrder() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _itemTextAndTextField(
              customerName,
              controller.nameController,
              Get.width,
              TextInputType.text,
            ),
            controller.nameValid == false
                ? TextCustomized(
                    text: ERROR_NAME,
                    color: Colors.red,
                  )
                : Container(),
            _itemTextAndTextField(
              ADDRESS_PHONENUMBER,
              controller.phoneController,
              Get.width,
              TextInputType.number,
            ),
            controller.phoneValid == false
                ? TextCustomized(
                    text: ERROR_PHONE,
                    color: Colors.red,
                  )
                : Container(),
            _itemTextAndTextField(
              email,
              controller.emailController,
              Get.width,
              TextInputType.emailAddress,
            ),
            controller.emailValid == false
                ? TextCustomized(
                    text: EMAIL_NOT_FORMAT,
                    color: Colors.red,
                  )
                : Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _itemTitle(city),
                SizedBox(height: 5),
                _itemDropdown(
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child: controller.cityResponse != null
                                ? DropdownButton(
                                    value: controller.selectedCity != null
                                        ? controller.selectedCity
                                        : null,
                                    icon: _iconDropdown(),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    items: controller.cityResponse!
                                        .map((DataCity value) {
                                      return DropdownMenuItem<DataCity>(
                                        value: value,
                                        child: Text(
                                          value.name.toString(),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (DataCity? value) {
                                      controller.onChangeCity(
                                          value!, value.id!);
                                    },
                                    hint: Text(city),
                                  )
                                : DropdownButton(
                                    icon: _iconDropdown(),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: "1",
                                        child: Text(NO_CITY),
                                      ),
                                    ],
                                    onChanged: (value) {},
                                    hint: Text(city),
                                  )),
                      ),
                    ),
                    Get.width),
                SizedBox(height: 5),
                controller.cityValid == false
                    ? TextCustomized(
                        text: controller.cityError.toString(),
                        color: Colors.red)
                    : Container(),
              ],
            ),
            SizedBox(height: 16),
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemTitle(distric),
                  SizedBox(height: 5),
                  _itemDropdown(
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                              alignedDropdown: true,
                              child: controller.districtResponse != null
                                  ? DropdownButton(
                                      value: controller.selectedDistrict != null
                                          ? controller.selectedDistrict
                                          : null,
                                      icon: _iconDropdown(),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      items: controller.districtResponse!
                                          .map((DataDistrict value) {
                                        return DropdownMenuItem<DataDistrict>(
                                          value: value,
                                          child: Container(
                                            child: Text(
                                              value.name.toString(),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (DataDistrict? value) {
                                        controller.onChangeDistrict(
                                            value!, value.id!);
                                      },
                                      hint: Text(ONCHANGE_DISTRICT),
                                    )
                                  : DropdownButton(
                                      icon: _iconDropdown(),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      items: [
                                        DropdownMenuItem<String>(
                                          value: "1",
                                          child: Center(
                                            child: Text(NO_DISTRICT),
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                      hint: Text(distric),
                                    )),
                        ),
                      ),
                      Get.width * 0.43),
                  SizedBox(height: 5),
                  controller.districtValid == false
                      ? TextCustomized(
                          text: controller.districtError.toString(),
                          color: Colors.red,
                          size: 11,
                        )
                      : Container(),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemTitle(ward),
                  SizedBox(height: 5),
                  _itemDropdown(
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                              alignedDropdown: true,
                              child: controller.wardResponse != null
                                  ? DropdownButton(
                                      value: controller.selectedWards != null
                                          ? controller.selectedWards
                                          : null,
                                      icon: _iconDropdown(),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      items: controller.wardResponse!
                                          .map((DataWards value) {
                                        return DropdownMenuItem<DataWards>(
                                          value: value,
                                          child: Text(
                                            value.name.toString(),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (DataWards? value) {
                                        controller.onChangeWards(
                                            value!, value.id!);
                                      },
                                      hint: Text(ward),
                                    )
                                  : DropdownButton(
                                      icon: _iconDropdown(),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      items: [
                                        DropdownMenuItem<String>(
                                          value: "1",
                                          child: Text(NO_WARDS),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                      hint: Text(ward),
                                    )),
                        ),
                      ),
                      Get.width * 0.43),
                  SizedBox(height: 5),
                  controller.wardsValid == false
                      ? TextCustomized(
                          text: controller.wardsError.toString(),
                          color: Colors.red,
                          size: 11,
                        )
                      : Container(),
                ],
              ),
            ]),
            SizedBox(height: 16),
            _itemTextAndTextField(
              address,
              controller.addressController,
              Get.width,
              TextInputType.text,
            ),
            controller.addressValid == false
                ? TextCustomized(
                    text: controller.addressError!,
                    color: Colors.red,
                  )
                : Container(),
          ],
        ));
  }

  Widget _itemTextAndTextField(
    String text,
    TextEditingController controller,
    double width,
    TextInputType type,
  ) {
    return Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _itemTitle(text),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller,
              hint: text,
              textInputType: type,
              textInputAction: TextInputAction.next,
              colorBackgrount: GRAY_BG,
              colorHintText: GRAY8,
            ),
          ],
        ));
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
