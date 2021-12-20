import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/packing_form/controller/add_packing_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class AddPackingPage extends GetView<AddPackingController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPackingController>(
      init: AddPackingController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(addNews, SizedBox()),
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
                _itemTextField(
                  titlePacking,
                  controller.nameController,
                  inputNamePacking,
                  TextInputType.text,
                ),
                controller.nameValid == false
                    ? TextCustomized(
                        text: controller.nameError.toString(),
                        color: Colors.red,
                        size: 10,
                      )
                    : SizedBox(),
                SizedBox(height: 2),
                _itemTextField(
                  fee,
                  controller.feeController,
                  inputMoney,
                  TextInputType.number,
                ),
                controller.feeValid == false
                    ? TextCustomized(
                        text: controller.feeError.toString(),
                        color: Colors.red,
                        size: 10,
                      )
                    : SizedBox(),
                SizedBox(height: 30),
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
                SizedBox(height: 10),
                ButtonCustomized(
                  save,
                  textColor: Colors.white,
                  onTap: () {
                    controller.onCreatePackingFee();
                  },
                  backgroundColor: COLOR_BT,
                  height: 48,
                  width: Get.width,
                ),
              ]),
        ));
  }

  Widget _itemTextField(
    String title,
    TextEditingController controller,
    String hintText,
    TextInputType type,
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
          textController: controller,
          maxLine: 5,
          textInputType: type,
          hint: hintText,
        ),
        SizedBox(height: 10),
      ],
    ));
  }
}
