import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/controller/order_management_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/order_valid/view/order_valid_ship_back.dart';
import 'package:viet_trung_mobile/ui/order_management/order_valid/view/order_valid_storage.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class ValidOrderPage extends GetView<OrderManagementController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderManagementController>(
      init: OrderManagementController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(orderValid),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      color: WHITE,
      margin: EdgeInsets.only(top: Get.height * 0.01),
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints.expand(height: Get.height * 0.05),
              child: TabBar(
                onTap: (index) {
                  controller.onChangePage(index);
                },
                isScrollable: true,
                controller: controller.tabController,
                indicatorColor: MAIN_BLACK,
                indicatorWeight: 2,
                tabs: [
                  Container(
                    width: Get.width * 0.4,
                    child: TextCustomized(
                      textAlign: TextAlign.center,
                      text: "Hàng chuyển về",
                      color: Colors.black,
                      size: 14,
                      weight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    width: Get.width * 0.4,
                    child: TextCustomized(
                      textAlign: TextAlign.center,
                      text: "Hàng lưu kho",
                      color: Colors.black,
                      size: 14,
                      weight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  OrderValidShipBack(),
                  OrderValidStorage(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
