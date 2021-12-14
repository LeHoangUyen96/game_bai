import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class DialogFaild extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (value) => Dialog(
              backgroundColor: Colors.white,
              elevation: 0,
              insetPadding: EdgeInsets.symmetric(horizontal: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)),
              child: Container(
                  height: Get.height * 0.37,
                  width: Get.width * 0.75,
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    ImageCustomized(
                      path: ic_faild,
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(height: 8),
                    TextCustomized(
                      text: faild,
                      size: 20,
                      weight: FontWeight.w500,
                      font: inter,
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: Get.width * 0.5,
                      child: TextCustomized(
                        text: contentFaild,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    ButtonCustomized(
                      confirm,
                      textColor: Colors.white,
                      onTap: () {
                        Get.back();
                      },
                      backgroundColor: COLOR_BT,
                      height: 48,
                    ),
                  ]))),
            ));
  }
}
