import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/profile/controller/profile_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class DialogLogout extends GetView<ProfileController> {
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
              height: Get.height * 0.24,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        child: Column(children: [
                          TextCustomized(
                            text: PROFILE_LOGOUT,
                            size: 20,
                            weight: FontWeight.w500,
                            font: inter,
                          ),
                          SizedBox(height: 8),
                          TextCustomized(text: youSureLogout),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              ButtonCustomized(
                                cancel,
                                textColor: Colors.black,
                                borderColor: Colors.grey,
                                onTap: () {
                                  Get.back();
                                },
                                backgroundColor: Colors.white,
                                height: 48,
                                width: Get.width * 0.4,
                              ),
                              Spacer(),
                              ButtonCustomized(
                                confirm,
                                textColor: Colors.white,
                                onTap: () {
                                  controller.onLogout();
                                },
                                backgroundColor: COLOR_BT,
                                height: 48,
                                width: Get.width * 0.4,
                              ),
                            ],
                          ),
                        ]))
                  ],
                ),
              ),
            )));
  }
}
