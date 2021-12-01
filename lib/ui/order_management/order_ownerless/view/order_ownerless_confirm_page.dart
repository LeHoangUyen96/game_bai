import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/controller/order_ownerleess_confirm_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/search_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class OwneslessOrderConfirmPage
    extends GetView<OrderOwnerlessConfirmController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderOwnerlessConfirmController>(
        init: OrderOwnerlessConfirmController(),
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
    int? val = -1;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          SearchTextField(
            searchController: controller.searchController,
          ),
          SizedBox(height: 15),
          Container(
            height: 16,
            color: GRAY5,
          ),
          _itemInfoOrder(),
          RadioListTile(
            value: 1,
            groupValue: val,
            onChanged: (value) {
              val = value! as int?;
            },
            title: Text(packOrderBack),
          ),
          RadioListTile(
            value: 1,
            groupValue: val,
            onChanged: (value) {
              val = value! as int?;
            },
            title: Text(storage),
          ),
          RadioListTile(
            value: 1,
            groupValue: val,
            onChanged: (value) {
              val = value! as int?;
            },
            title: Text(sendVerifi),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                _itemTextAndTextField(
                  transformeFormat,
                  controller.emailController,
                  Get.width,
                  TextInputType.emailAddress,
                ),
                _itemTextAndTextField(
                  packFormat,
                  controller.emailController,
                  Get.width,
                  TextInputType.emailAddress,
                ),
              ])),
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
      ),
    );
  }

  Widget _itemInfoOrder() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _itemTextAndTextField(
              customerName,
              controller.nameController,
              Get.width,
              TextInputType.text,
            ),
            _itemTextAndTextField(
              ADDRESS_PHONENUMBER,
              controller.phoneController,
              Get.width,
              TextInputType.number,
            ),
            _itemTextAndTextField(
              email,
              controller.emailController,
              Get.width,
              TextInputType.emailAddress,
            ),
            _itemTextAndTextField(
              city,
              controller.emailController,
              Get.width,
              TextInputType.text,
            ),
            Row(
              children: [
                _itemTextAndTextField(
                  distric,
                  controller.emailController,
                  Get.width * 0.42,
                  TextInputType.text,
                ),
                Spacer(),
                _itemTextAndTextField(
                  ward,
                  controller.emailController,
                  Get.width * 0.42,
                  TextInputType.text,
                ),
              ],
            ),
            _itemTextAndTextField(
              address,
              controller.addressController,
              Get.width,
              TextInputType.text,
            ),
          ],
        ));
  }

  Widget _itemTextAndTextField(String text, TextEditingController controller,
      double width, TextInputType type) {
    return Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustomized(
              text: text,
              color: Colors.black,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller,
              hint: text,
              textInputType: type,
              textInputAction: TextInputAction.next,
              colorBackgrount: GRAY_BG,
              colorHintText: GRAY8,
            ),
          ],
        ));
  }
}
