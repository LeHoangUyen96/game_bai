import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/list_product_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/transport/controller/edit_transport_fee_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class DialogEditTransportFee extends GetView<EditTransportFormFeeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTransportFormFeeController>(
        init: EditTransportFormFeeController(),
        builder: (value) => controller.response != null
            ? Dialog(
                backgroundColor: Colors.white,
                elevation: 0,
                insetPadding: EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
                child: Container(
                  height: Get.height * 0.85,
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
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: COLOR_BT,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(9),
                              topRight: Radius.circular(9),
                            ),
                          ),
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
                                        controller.response!.data!.from!
                                            .toString(),
                                      ),
                                      Spacer(),
                                      _itemFee(
                                        to,
                                        controller.toController,
                                        Get.width * 0.4,
                                        controller.response!.data!.to!
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  _itemFee(
                                    feeHN,
                                    controller.feeHNController,
                                    Get.width,
                                    controller.response!.data!.transportFeeHN!
                                        .toString(),
                                  ),
                                  _itemFee(
                                    feeDN,
                                    controller.feeDNController,
                                    Get.width,
                                    controller.response!.data!.transportFeeDN!
                                        .toString(),
                                  ),
                                  _itemFee(
                                    feeSG,
                                    controller.feeSGController,
                                    Get.width,
                                    controller.response!.data!.transportFeeSG!
                                        .toString(),
                                  ),
                                  ButtonCustomized(
                                    save,
                                    textColor: Colors.white,
                                    onTap: () {
                                      controller.onUpdateTransportFee(controller
                                          .transportFeeId!
                                          .toString());
                                    },
                                    backgroundColor: COLOR_BT,
                                    height: 48,
                                    width: Get.width,
                                  ),
                                ]))
                      ],
                    ),
                  ),
                ))
            : SizedBox());
  }

  Widget _itemFee(
    String title,
    TextEditingController controller,
    double width,
    String? hintText,
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
                          hint: Text(controller.response!.data!.productName!),
                        )
                      : SizedBox()),
            )))
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
                    child: DropdownButton(
                      value: controller.selectedUnit != null
                          ? controller.selectedUnit
                          : null,
                      icon: _iconDropdown(),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      items: controller.unit.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            child: Text(
                              value,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        controller.onChangeUnit(value!);
                      },
                      hint: Text(controller.response!.data!.unit!),
                    )),
              ),
            ))
          ]),
    ]);
  }
}
