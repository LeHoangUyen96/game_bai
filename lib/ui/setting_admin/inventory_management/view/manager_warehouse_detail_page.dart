import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/list_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/inventory_management/controller/manager_warehouse_detail_controller.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/inventory_management/view/delete_popup.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/inventory_management/view/edit_warehouse_popup.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';

class ManagerWarehouseDetailPage
    extends GetView<ManagerWarehouseDetailController> {
  String? name;
  ManagerWarehouseDetailPage(this.name);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagerWarehouseDetailController>(
      init: ManagerWarehouseDetailController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(
            name!,
            Container(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Get.dialog(DialogEditWarehouse(),
                          arguments: controller.warehouseId)
                      .then((value) {
                    if (value != null) {
                      controller.onGetListWarehouse(controller.warehouseId!);
                    }
                  });
                },
                child: Icon(
                  Icons.add,
                  color: WHITE,
                ),
              ),
            )),
        body: controller.response != null ? buildBody() : SizedBox(),
        backgroundColor: MAIN_BG,
      ),
    );
  }

  Widget buildBody() {
    return Container(
        color: WHITE,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    itemCount: controller.response!.data!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _buildItem(
                        controller.response!.data![index],
                      );
                    }),
              ]),
        ));
  }

  Widget _buildItem(DataWarehouseResponse response) {
    return Container(
        color: WHITE,
        child: Column(
          children: [
            SizedBox(height: 16.5),
            Row(children: [
              SizedBox(width: 12),
              Text(response.name!,
                  style: TextStyle(
                    fontFamily: roboto,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
              Spacer(),
              InkWell(
                  onTap: () {
                    Get.dialog(DialogDelete(response.id!.toString()));
                  },
                  child: Icon(
                    Icons.clear,
                    size: 16,
                  )),
              SizedBox(width: 16.5),
            ]),
            SizedBox(height: 16),
            Container(
              height: 1,
              color: TEXT_DATETIME_NT,
            ),
          ],
        ));
  }
}
