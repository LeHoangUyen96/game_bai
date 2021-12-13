import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/inventory_management/controller/inventory_management_controller.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';

class InventoryManagementPage extends GetView<InventoryManagementcontroller> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryManagementcontroller>(
      init: InventoryManagementcontroller(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(inventoryManagement, SizedBox()),
        body: buildBody(),
        backgroundColor: MAIN_BG,
      ),
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
              children: []),
        ));
  }
}
