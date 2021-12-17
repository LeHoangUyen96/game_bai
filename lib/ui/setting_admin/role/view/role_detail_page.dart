import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/role_detail_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/role/controller/role_detail_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class RoleDetailPage extends GetView<RoleDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoleDetailController>(
      init: RoleDetailController(),
      builder: (value) => controller.response != null
          ? Scaffold(
              backgroundColor: MAIN_BG,
              appBar: buildAppBar(controller.response!.data!.name!, SizedBox()),
              body: buildBody())
          : SizedBox(),
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
                TextCustomized(
                  text: name,
                  weight: FontWeight.w500,
                  size: 14,
                  color: BLACK,
                ),
                SizedBox(height: 5),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: GRAY,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  child: controller.isEditName == true
                      ? Row(children: [
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                fillColor: GRAY4,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontFamily: SanFranciscoText,
                                fontWeight: FontWeight.w400,
                                color: BLACK,
                              ),
                              onSubmitted: (newValue) {
                                controller.nameRole = newValue;
                                controller.isEditName = false;
                              },
                              autofocus: true,
                              controller: controller.nameController,
                            ),
                          )
                        ])
                      : Container(
                          padding: EdgeInsets.all(16),
                          child: InkWell(
                              onTap: () {
                                controller.onEdit();
                              },
                              child: Text(
                                controller.nameRole!,
                                style: TextStyle(
                                  fontFamily: SanFranciscoText,
                                  fontWeight: FontWeight.w400,
                                  color: BLACK,
                                ),
                              ))),
                ),
                SizedBox(height: 10),
                ListView.builder(
                    itemCount: controller.response!.data!.permissions!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _itemRightsGroup(
                        controller.response!.data!,
                        index,
                      );
                    }),
                SizedBox(height: 30),
                ButtonCustomized(
                  save,
                  textColor: Colors.white,
                  onTap: () {
                    controller.onSave(controller.response!.data!.id!);
                  },
                  backgroundColor: COLOR_BT,
                  height: 48,
                  width: Get.width,
                ),
                SizedBox(height: 10),
                ButtonCustomized(
                  delete,
                  textColor: Colors.black,
                  borderColor: Colors.grey,
                  backgroundColor: Colors.white,
                  onTap: () {
                    controller.onDeleteRole(controller.response!.data!.id!);
                  },
                  height: 48,
                  width: Get.width,
                )
              ]),
        ));
  }

  Widget _itemRightsGroup(DataRoleDetail response, int index) {
    return Column(children: [
      Row(
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: response.permissions![index].checked == true
                      ? RED
                      : COLOR_BORDER_CHECKBOX,
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
                    value: response.permissions![index].checked,
                    tristate: true,
                    onChanged: (value) {
                      controller.onCheck(
                        response.permissions![index],
                      );
                    }),
              )),
          SizedBox(width: 10),
          TextCustomized(
            text: response.permissions![index].name!,
            size: 14,
            color: BLACK,
          ),
        ],
      ),
      SizedBox(height: 10)
    ]);
  }
}
