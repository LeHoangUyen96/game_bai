import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/dashboard_product/controller/dashboard_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class DialogAddProduct extends GetView<DashboardProductController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardProductController>(
        init: DashboardProductController(),
        builder: (value) => Dialog(
            backgroundColor: Colors.white,
            elevation: 0,
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            child: Container(
              height: Get.height * 0.4,
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
                              SizedBox(height: 10),
                              TextCustomized(
                                text: nameProducts,
                                weight: FontWeight.w500,
                                size: 14,
                                color: BLACK,
                              ),
                              SizedBox(height: 5),
                              TextFieldCustomized(
                                textController:
                                    controller.nameProductController,
                                maxLine: 5,
                                textInputType: TextInputType.text,
                                hint: nameProducts,
                              ),
                              SizedBox(height: 10),
                              controller.nameValid == false
                                  ? TextCustomized(
                                      text: controller.nameError.toString(),
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
}
