import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/dashboard_product/controller/product_detail_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class DialogEditProduct extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        init: ProductDetailController(),
        builder: (value) => Dialog(
            backgroundColor: Colors.white,
            elevation: 0,
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            child: Container(
              height: Get.height * 0.4,
              width: Get.width,
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
                          Text(edit,
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
                                  controller.onUpdateProduct(controller
                                      .productDetail!.data!.id!
                                      .toString());
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
