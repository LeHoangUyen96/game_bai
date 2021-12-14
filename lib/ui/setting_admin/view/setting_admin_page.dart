import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/order/controller/order_info_controller.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/dashboard_product/view/dashboard_product_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/exchange_rate/view/exchange_rate_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/inventory_management/view/inventory_management_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/packing_form/view/packing_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/profile/view/proflie_admin_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/role/view/role_page.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/transport/view/transport_page.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';

class SettingAdminPage extends GetView<OrderInfoController> {
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
        titleAppBar: setting,
        backgroundAppBar: Colors.black26,
      ),
    );
  }

  Widget buildBody() {
    return Container(
      color: MAIN_BG,
      child: Column(children: [
        _buildItem(role, () {
          Get.to(RolePage());
        }),
        _buildItem(transformeFormat, () {
          Get.to(TransportPage());
        }),
        _buildItem(packFormat, () {
          Get.to(PackingPage());
        }),
        _buildItem(dashboardProduct, () {
          Get.to(DashboardProductPage());
        }),
        _buildItem(inventoryManagement, () {
          Get.to(InventoryManagementPage());
        }),
        _buildItem(rateSettings, () {
          Get.to(ExchangeRatePage());
        }),
        _buildItem(report, () {}),
        _buildItem(userInfo, () {
          Get.to(ProfileAdminPage());
        })
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
            SizedBox(height: 16.5),
            InkWell(
                onTap: onTap,
                child: Row(children: [
                  SizedBox(width: 12),
                  Text(text,
                      style: TextStyle(
                        fontFamily: roboto,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: TEXT_DATETIME_NT,
                  ),
                  SizedBox(width: 16.5),
                ])),
            SizedBox(height: 16),
            Container(
              height: 1,
              color: TEXT_DATETIME_NT,
            ),
          ],
        ));
  }
}
