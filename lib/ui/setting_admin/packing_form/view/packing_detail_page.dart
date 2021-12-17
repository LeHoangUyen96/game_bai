import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/packing_form/controller/packing_detail_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class PackingDetailPage extends GetView<PackingDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackingDetailController>(
      init: PackingDetailController(),
      builder: (value) => controller.response != null
          ? Scaffold(
              appBar: buildAppBar(controller.response!.data!.name!, SizedBox()),
              body: buildBody(),
              backgroundColor: MAIN_BG,
            )
          : SizedBox(),
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
                Row(
                  children: [
                    TextCustomized(
                      text: fee,
                      weight: FontWeight.w500,
                      color: BLACK_1,
                    ),
                    Spacer(),
                    TextFieldCustomized(
                      width: 77,
                      textController: controller.feeController,
                      textInputType: TextInputType.number,
                      align: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: RED,
                        fontFamily: inter,
                      ),
                      maxLine: 1,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ButtonCustomized(
                  save,
                  textColor: Colors.white,
                  onTap: () {
                    controller.onUpdatePacking(
                        controller.response!.data!.id!.toString());
                  },
                  backgroundColor: COLOR_BT,
                  height: 48,
                  width: Get.width,
                ),
                SizedBox(height: 10),
                ButtonCustomized(
                  delete,
                  textColor: COLOR_ORDER_BORDER_WAREHOUSE,
                  borderColor: Colors.grey,
                  onTap: () {
                    controller.onDeletePacking(
                        controller.response!.data!.id!.toString());
                  },
                  backgroundColor: Colors.white,
                  height: 48,
                  width: Get.width,
                ),
              ]),
        ));
  }
}
