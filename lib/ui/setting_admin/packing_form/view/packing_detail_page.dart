import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/packing_form/controller/packing_detail_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

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
                    TextCustomized(text: fee),
                    Spacer(),
                    controller.isEdit == false
                        ? InkWell(
                            onTap: () {
                              controller.editFee();
                            },
                            child: Container(
                              height: 48,
                              width: 77,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: GRAY),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
                              child: Center(
                                child: TextCustomized(
                                  text: "¥" +
                                      controller.response!.data!.packingFee!
                                          .toString(),
                                  color: RED,
                                  font: inter,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ))
                        : TextFieldCustomized(
                            textController: controller.feeController,
                            textInputType: TextInputType.number,
                            width: 77,
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
                  textColor: RED,
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
