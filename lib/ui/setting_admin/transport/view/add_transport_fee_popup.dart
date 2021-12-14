import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/models/unit.dart';
import 'package:viet_trung_mobile/data/response/list_product_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/transport/controller/add_transport_fee_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class DialogAddTransportFee extends GetView<AddTransportFormFeeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTransportFormFeeController>(
        init: AddTransportFormFeeController(),
        builder: (value) => Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            child: Container(
              height: Get.height * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: COLOR_BT,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9),
                          topRight: Radius.circular(9),
                        ),
                      ),
                      height: 56,
                      child: Row(
                        children: [
                          Spacer(),
                          Text(add,
                              style: TextStyle(
                                  fontSize: customSize,
                                  fontFamily: SanFranciscoText,
                                  fontWeight: FontWeight.w800,
                                  color: WHITE)),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.clear,
                                size: 20,
                                color: WHITE,
                              )),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _rowInfo(),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Column(children: [
                                    _itemFee(
                                      from,
                                      controller.fromController,
                                      Get.width * 0.4,
                                      inputQuantity,
                                    ),
                                    controller.fromValid == false
                                        ? TextCustomized(
                                            text:
                                                controller.fromError.toString(),
                                            color: Colors.red,
                                            size: 10,
                                          )
                                        : SizedBox(),
                                  ]),
                                  Spacer(),
                                  Column(children: [
                                    _itemFee(
                                      to,
                                      controller.toController,
                                      Get.width * 0.4,
                                      inputQuantity,
                                    ),
                                    controller.toValid == false
                                        ? TextCustomized(
                                            text: controller.toError.toString(),
                                            color: Colors.red,
                                            size: 10,
                                          )
                                        : SizedBox(),
                                  ])
                                ],
                              ),
                              SizedBox(height: 2),
                              _itemFee(feeHN, controller.feeHNController,
                                  Get.width, inputFee),
                              controller.toValid == false
                                  ? TextCustomized(
                                      text: controller.toError.toString(),
                                      color: Colors.red,
                                      size: 10,
                                    )
                                  : SizedBox(),
                              SizedBox(height: 2),
                              _itemFee(feeDN, controller.feeDNController,
                                  Get.width, inputFee),
                              controller.toValid == false
                                  ? TextCustomized(
                                      text: controller.toError.toString(),
                                      color: Colors.red,
                                      size: 10,
                                    )
                                  : SizedBox(),
                              SizedBox(height: 2),
                              _itemFee(feeSG, controller.feeSGController,
                                  Get.width, inputFee),
                              controller.toValid == false
                                  ? TextCustomized(
                                      text: controller.toError.toString(),
                                      color: Colors.red,
                                      size: 10,
                                    )
                                  : SizedBox(),
                              SizedBox(height: 10),
                              ButtonCustomized(
                                save,
                                textColor: Colors.white,
                                onTap: () {
                                  controller.onCreateTransportFee();
                                },
                                backgroundColor: COLOR_BT,
                                height: 48,
                                width: Get.width,
                              ),
                            ]))
                  ],
                ),
              ),
            )));
  }

  Widget _itemFee(
    String title,
    TextEditingController controller,
    double width,
    String hintText,
  ) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextCustomized(
          text: title,
          weight: FontWeight.w500,
          size: 14,
          color: BLACK,
        ),
        SizedBox(height: 5),
        TextFieldCustomized(
          width: width,
          textController: controller,
          maxLine: 5,
          textInputType: TextInputType.number,
          hint: hintText,
        ),
        SizedBox(height: 10),
      ],
    ));
  }

  Widget _itemDropdown(Widget dropdown) {
    return Container(
        width: Get.width * 0.4,
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

  Widget _iconDropdown() {
    return Icon(
      Icons.keyboard_arrow_down,
      color: MAIN_LINE,
    );
  }

  Widget _rowInfo() {
    return Row(children: [
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextCustomized(
              text: product,
              weight: FontWeight.w500,
              size: 14,
              color: BLACK,
            ),
            SizedBox(height: 5),
            _itemDropdown(Expanded(
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                    alignedDropdown: true,
                    child: controller.productResponse != null
                        ? DropdownButton(
                            value: controller.selectedItemProduct != null
                                ? controller.selectedItemProduct
                                : null,
                            icon: _iconDropdown(),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            items: controller.productResponse!.data!
                                .map((ItemProduct value) {
                              return DropdownMenuItem<ItemProduct>(
                                value: value,
                                child: Container(
                                  child: Text(
                                    value.name.toString(),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (ItemProduct? value) {
                              controller.onChangeProduct(value!);
                            },
                            hint: Text(product),
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
                            hint: Text(selectProduct),
                          )),
              ),
            )),
            SizedBox(height: 2),
            controller.productValid == false
                ? TextCustomized(
                    text: controller.productError.toString(),
                    color: Colors.red,
                    size: 10,
                  )
                : SizedBox(),
          ]),
      Spacer(),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextCustomized(
              text: unit,
              weight: FontWeight.w500,
              size: 14,
              color: BLACK,
            ),
            SizedBox(height: 5),
            _itemDropdown(Expanded(
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                    alignedDropdown: true,
                    child: controller.unit != null
                        ? DropdownButton(
                            value: controller.selectedUnit != null
                                ? controller.selectedUnit
                                : null,
                            icon: _iconDropdown(),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            items: controller.unit.map((Unit value) {
                              return DropdownMenuItem<Unit>(
                                value: value,
                                child: Container(
                                  child: Text(
                                    value.name.toString(),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (Unit? value) {
                              controller.onChangeUnit(value!, value.id!);
                            },
                            hint: Text(unit),
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
                            hint: Text(selectUnit),
                          )),
              ),
            )),
            SizedBox(height: 2),
            controller.unitValid == false
                ? TextCustomized(
                    text: controller.unitError.toString(),
                    color: Colors.red,
                    size: 10,
                  )
                : SizedBox(),
          ]),
    ]);
  }
}
