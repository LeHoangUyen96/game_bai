import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_info_controller.dart';
import 'package:viet_trung_mobile/ui/profile/view/profile_page.dart';
import 'package:viet_trung_mobile/ui/setting_admin/packing_form/view/packing_page.dart';
import 'package:viet_trung_mobile/ui/setting_admin/role/view/role_page.dart';
import 'package:viet_trung_mobile/ui/setting_admin/transport/view/transport_page.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';

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
        _buildItem(dashboardProduct, () {}),
        _buildItem(inventoryManagement, () {}),
        _buildItem(rateSettings, () {}),
        _buildItem(report, () {}),
        _buildItem(userInfo, () {
          Get.to(ProfilePage());
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
