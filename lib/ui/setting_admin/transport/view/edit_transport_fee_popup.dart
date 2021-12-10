import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/models/unit.dart';
import 'package:viet_trung_mobile/data/response/list_product_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/transport/controller/edit_transport_fee_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class DialogEditTransportFee extends GetView<EditTransportFormFeeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTransportFormFeeController>(
        init: EditTransportFormFeeController(),
        builder: (value) => Dialog(
            backgroundColor: Colors.white,
            elevation: 0,
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            child: Container(
              height: Get.height * 0.8,
              width: Get.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 56,
                      color: COLOR_BT,
                      child: Row(
                        children: [
                          Spacer(),
                          Text(edit,
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
                                  _itemFee(
                                    from,
                                    controller.fromController,
                                    Get.width * 0.4,
                                    '',
                                  ),
                                  Spacer(),
                                  _itemFee(
                                    to,
                                    controller.toController,
                                    Get.width * 0.4,
                                    '',
                                  ),
                                ],
                              ),
                              _itemFee(feeHN, controller.feeHNController,
                                  Get.width, inputFee),
                              _itemFee(feeDN, controller.feeDNController,
                                  Get.width, inputFee),
                              _itemFee(feeSG, controller.feeSGController,
                                  Get.width, inputFee),
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
          textInputType: TextInputType.text,
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
                            hint: Text(''),
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
            ))
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
            ))
          ]),
    ]);
  }
}
