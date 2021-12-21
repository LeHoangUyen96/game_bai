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

class DialogSuccess extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (value) => Dialog(
            backgroundColor: Colors.white,
            elevation: 0,
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            child: Container(
              height: Get.height * 0.35,
              width: Get.width * 0.8,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        child: Column(children: [
                          // ImageCustomized(
                          //   path: ic_success,
                          //   height: 60,
                          //   width: 60,
                          // ),
                          TextCustomized(
                            text: success,
                            size: 20,
                            weight: FontWeight.w500,
                            font: inter,
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: Get.width * 0.8,
                            child: TextCustomized(
                              text: contentSuccess,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                          ButtonCustomized(
                            confirm,
                            textColor: Colors.white,
                            onTap: () {
                              controller.onLogout();
                            },
                            backgroundColor: COLOR_BT,
                            height: 48,
                          ),
                        ]))
                  ],
                ),
              ),
            )));
  }
}
