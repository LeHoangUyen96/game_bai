import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/check_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/inventory_management/controller/edit_warehouse_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class DialogEditWarehouse extends GetView<EditWarehouseController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditWarehouseController>(
        init: EditWarehouseController(),
        builder: (value) => Dialog(
            backgroundColor: Colors.white,
            elevation: 0,
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            child: Container(
              height: Get.height * 0.9,
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
                          Text(CITY,
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
                    controller.data != null ? buildBody() : SizedBox(),
                  ],
                ),
              ),
            )));
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
                ListView.builder(
                    itemCount: controller.data!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _itemRightsGroup(
                        controller.data![index],
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
              ]),
        ));
  }

  Widget _itemRightsGroup(DataCheckWarehouse response) {
    return Column(children: [
      Row(
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: response.isCheck == true ? RED : COLOR_BORDER_CHECKBOX,
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
                    value: response.isCheck,
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
