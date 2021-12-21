import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/size.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/finding_customers/controller/finding_customer_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class FindingCustomerPage extends GetView<FindingCustomerController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<FindingCustomerController>(
      init: FindingCustomerController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        //body: SingleChildScrollView(child: buildBody()),
        body: buildBody(),
        backgroundColor: WHITE,
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        title: TextCustomized(
          text: ADMIN_FINDING_CUSTOMERS,
          color: WHITE,
          font: SanFranciscoText,
          isCenter: true,
        ),
        flexibleSpace: Image(
          image: AssetImage(BG_IMG),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: WHITE,
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return GestureDetector(
        onTap: () {
          FocusScope.of(mContext!).requestFocus(FocusNode());
        },
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            //alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustomized(
                  text: ADMIN_ENTER_PHONE_OR_CUSTOMERS_CODE,
                  font: SanFranciscoText,
                  size: largeSize,
                  color: BLACK,
                  isCenter: true,
                ),
                SizedBox(height: 30),
                TextFieldCustomized(
                  textController: controller.phoneValueController,
                  hint: ADMIN_ENTER_PHONE_OR_CUSTOMERS_CODE,
                  errorText:
                      controller.isPhoneValid ? controller.phoneErros : null,
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.isPhoneValid == false
                        ? Expanded(
                            child: TextCustomized(
                              text: controller.phoneErros,
                              font: SanFranciscoText,
                              size: 12,
                              maxLine: 2,
                              weight: FontWeight.w400,
                              color: RED,
                            ),
                          )
                        : Container(),
                  ],
                ),
                SizedBox(height: 20),
                DottedBorder(
                  dashPattern: [8, 6],
                  strokeWidth: 2,
                  color: GRAY,
                  radius: Radius.circular(20),
                  borderType: BorderType.Rect,
                  child: InkWell(
                    onTap: () {
                      // Get.to(EnterWarehousePage(),
                      //    arguments: {
                      //      'phone' : controller.phoneValueController.text,
                      //    });
                      controller.onImportStorageNoInfo();
                    },
                    child: Container(
                      height: 8.0.w,

                      //width: Get.width*0.65,
                      alignment: Alignment.center,
                      child: TextCustomized(
                        text: ADMIN_ENTER_AVIATION_INFORMATION,
                        font: SanFranciscoText,
                        color: BLACK,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ButtonCustomized(
                  ADMIN_ENTER_WAREHOUSE,
                  onTap: () {
                    ///Get.to(EnterWarehousePage());
                    controller.onFindUser();
                  },
                  backgroundColor: BLACK,
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ));
  }
}
