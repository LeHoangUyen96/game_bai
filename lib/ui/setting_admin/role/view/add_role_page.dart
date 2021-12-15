import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/list_rights_group.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/role/controller/add_role_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class AddRolePage extends GetView<AddRoleController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddRoleController>(
        init: AddRoleController(),
        builder: (value) => controller.response != null
            ? Scaffold(
                backgroundColor: MAIN_BG,
                appBar: buildAppBar(addNews, SizedBox()),
                body: buildBody(),
              )
            : SizedBox());
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
                TextCustomized(
                  text: name,
                  weight: FontWeight.w500,
                  size: 14,
                  color: BLACK,
                ),
                SizedBox(height: 5),
                TextFieldCustomized(
                  textController: controller.nameController,
                  maxLine: 5,
                  textInputType: TextInputType.text,
                ),
                controller.nameValid == false
                    ? Column(children: [
                        SizedBox(height: 5),
                        TextCustomized(
                          text: controller.nameError.toString(),
                          color: Colors.red,
                          size: 12,
                        )
                      ])
                    : SizedBox(),
                SizedBox(height: 20),
                ListView.builder(
                    itemCount: controller.response!.data!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _itemRightsGroup(
                        controller.response!.data![index],
                        index,
                      );
                    }),
                SizedBox(height: 30),
                ButtonCustomized(
                  save,
                  textColor: Colors.white,
                  onTap: () {
                    controller.onSave();
                  },
                  backgroundColor: COLOR_BT,
                  height: 48,
                  width: Get.width,
                ),
                SizedBox(height: 10),
                ButtonCustomized(
                  cancel,
                  textColor: Colors.black,
                  borderColor: Colors.grey,
                  backgroundColor: Colors.white,
                  onTap: () {
                    Get.back();
                  },
                  height: 48,
                  width: Get.width,
                )
              ]),
        ));
  }

  Widget _itemRightsGroup(DataRightsGroup response, int index) {
    return Column(children: [
      Row(
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: response.checked == true ? RED : COLOR_BORDER_CHECKBOX,
                  width: 2,
                ),
              ),
              width: 20,
              height: 20,
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.transparent),
                child: Checkbox(
                    checkColor: RED,
                    activeColor: Colors.transparent,
                    value: response.checked,
                    tristate: true,
                    onChanged: (value) {
                      controller.onCheck(response);
                    }),
              )),
          SizedBox(width: 10),
          TextCustomized(
            text: response.name!,
            size: 14,
            color: BLACK,
          ),
        ],
      ),
      SizedBox(height: 10)
    ]);
  }
}
