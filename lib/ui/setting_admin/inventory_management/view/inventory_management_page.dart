import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/list_warehouse_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/inventory_management/controller/inventory_management_controller.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/inventory_management/view/manager_warehouse_detail_page.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';

class InventoryManagementPage extends GetView<InventoryManagementcontroller> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryManagementcontroller>(
      init: InventoryManagementcontroller(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(inventoryManagement, SizedBox()),
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

  Widget _buildItem(
    DataWarehouseResponse response,
  ) {
    return Container(
        color: WHITE,
        child: Column(
          children: [
            const SizedBox(height: 16.5),
            InkWell(
                onTap: () {
                  Get.to(ManagerWarehouseDetailPage(response.name!),
                      arguments: response.id!);
                },
                child: Row(children: [
                  const SizedBox(width: 12),
                  Text(response.name!,
                      style: const TextStyle(
                        fontFamily: roboto,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: TEXT_DATETIME_NT,
                  ),
                  const SizedBox(width: 16.5),
                ])),
            const SizedBox(height: 16),
            Container(
              height: 1,
              color: TEXT_DATETIME_NT,
            ),
          ],
        ));
  }
}
