import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/exchange_rate/controller/exchange_rate_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class ExchangeRatePage extends GetView<ExchangeRateController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExchangeRateController>(
      init: ExchangeRateController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(exchangRate, SizedBox()),
        body: buildBody(),
        backgroundColor: MAIN_BG,
      ),
    );
  }

  Widget buildBody() {
    return Container(
        color: WHITE,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustomized(
                  text: rate,
                  weight: FontWeight.w500,
                  size: 14,
                  color: BLACK,
                ),
                SizedBox(height: 5),
                TextFieldCustomized(
                  textController: controller.exchangeRateController,
                  maxLine: 5,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                controller.nameValid == false
                    ? TextCustomized(
                        text: controller.nameError.toString(),
                        color: Colors.red,
                        size: 10,
                      )
                    : SizedBox(),
                SizedBox(height: 30),
                ButtonCustomized(
                  save,
                  textColor: Colors.white,
                  onTap: () {
                    controller.onUpdateExchangeRate();
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
                ),
              ]),
        ));
  }
}
