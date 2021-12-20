import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/order/controller/order_info_controller.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_no_transport/view/order_not_shipped_page.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_ownerless/view/order_ownerless_page.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_shipped/view/order_shipping_page.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_valid/view/order_valid_page.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_wait_confirm/view/order_waitting_for_confirm_page.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';

class OrderAdminPage extends GetView<OrderInfoController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderInfoController>(
      init: OrderInfoController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: InitialWidget(
        child: Container(),
        titleAppBar: MANAGE_PACKAGE_ORDER,
        backgroundAppBar: Colors.black26,
        isShowBack: false,
      ),
    );
  }

  Widget buildBody() {
    return Container(
      color: MAIN_BG,
      child: Column(children: [
        _buildItem(goodsInWarehouseChina, () {
          Get.to(ValidOrderPage());
        }),
        _buildItem(goodsShipper, () {
          Get.to(OrderShippingPage());
        }),
        _buildItem(orderWaitConfirm, () {
          Get.to(OrderWaittingForConfirmPage());
        }),
        _buildItem(ownerlessOrder, () {
          Get.to(OwneslessOrderPage());
        }),
        Container(
            color: WHITE,
            child: Column(
              children: [
                const SizedBox(height: 16.5),
                InkWell(
                    onTap: () {
                      Get.to(OrderNotShippedPage());
                    },
                    child: Row(children: [
                      const SizedBox(width: 12),
                      Text(goodsNotShipper,
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
              ],
            ))
      ]),
    );
  }

  Widget _buildItem(
    String text,
    VoidCallback onTap,
  ) {
    return Container(
        color: WHITE,
        child: Column(
          children: [
            const SizedBox(height: 16.5),
            InkWell(
                onTap: onTap,
                child: Row(children: [
                  const SizedBox(width: 12),
                  Text(text,
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
