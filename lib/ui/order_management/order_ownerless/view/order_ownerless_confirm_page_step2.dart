import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/controller/order_ownerleess_confirm_controller_step2.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class OwneslessOrderConfirmPageStep2
    extends GetView<OrderOwnerlessConfirmControllerStep2> {
  String? userName;
  String? userCode;
  String? userPhone;
  OwneslessOrderConfirmPageStep2({
    Key? key,
    this.userCode,
    this.userName,
    this.userPhone,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderOwnerlessConfirmControllerStep2>(
        init: OrderOwnerlessConfirmControllerStep2(),
        builder: (value) => Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size(double.infinity, 55),
                  child: InitialWidget(
                      child: Container(),
                      titleAppBar: verifi,
                      backgroundAppBar: Colors.black26,
                      isShowBack: true,
                      iconBack: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: WHITE,
                        ),
                      ))),
              body: buildBody(),
              backgroundColor: GRAY_BG,
            ));
  }

  Widget buildBody() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(16),
            child: Stack(children: [
              SizedBox(
                width: Get.width * 0.9,
                child: ImageCustomized(path: bg_card),
              ),
              Container(
                decoration: BoxDecoration(
                  color: GRAY7,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: Get.width * 0.89,
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.symmetric(
                  vertical: Get.width * 0.14,
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustomized(
                            text: usersCode,
                            weight: FontWeight.w500,
                          ),
                          TextCustomized(
                            text: ADMIN_CUSTOMER_NAME,
                            weight: FontWeight.w500,
                          ),
                          TextCustomized(
                            text: PHONE,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustomized(text: userCode!),
                          TextCustomized(text: userName!),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    launch(('tel://${userPhone!}'));
                                  },
                                  child: TextCustomized(
                                    text: userPhone!,
                                    weight: FontWeight.w500,
                                  )),
                              SizedBox(width: 2),
                              Icon(
                                Icons.phone,
                                size: 16,
                                color: Colors.black,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ))
            ])),
        SizedBox(height: 30),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              ButtonCustomized(
                save,
                textColor: Colors.white,
                onTap: () {},
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
              )
            ])),
        SizedBox(height: 15),
      ],
    );
  }
}
