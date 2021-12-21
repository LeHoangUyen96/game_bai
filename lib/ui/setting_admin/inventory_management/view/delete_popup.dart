import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/inventory_management/controller/manager_warehouse_detail_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class DialogDelete extends GetView<ManagerWarehouseDetailController> {
  String? id;
  DialogDelete(this.id);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagerWarehouseDetailController>(
        init: ManagerWarehouseDetailController(),
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
                            text: delete,
                            size: 20,
                            weight: FontWeight.w500,
                            font: inter,
                          ),
                          SizedBox(height: 8),
                          TextCustomized(text: youSureDelete),
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
                                  controller.onDeleteWarehouse(id!);
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
