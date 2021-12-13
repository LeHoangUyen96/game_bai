import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/response/list_transport_admin_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/packing_form/controller/packing_controller.dart';
import 'package:viet_trung_mobile/ui/setting_admin/packing_form/view/add_packing_page.dart';
import 'package:viet_trung_mobile/ui/setting_admin/packing_form/view/packing_detail_page.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';

class PackingPage extends GetView<PackingController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackingController>(
        init: PackingController(),
        builder: (value) => SmartRefresher(
              enablePullUp: true,
              enablePullDown: true,
              controller: controller.refreshController,
              onRefresh: () {
                controller.onRefresh();
              },
              child: Scaffold(
                appBar: buildAppBar(
                  packFormat,
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Get.to(AddPackingPage());
                      },
                      child: Icon(
                        Icons.add,
                        color: WHITE,
                      ),
                    ),
                  ),
                ),
                body: controller.response != null ? buildBody() : SizedBox(),
              ),
            ));
  }

  Widget buildBody() {
    return Container(
      color: MAIN_BG,
      child: Column(children: [
        ListView.builder(
            itemCount: controller.response!.data!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildItem(controller.response!.data![index]);
            }),
      ]),
    );
  }

  Widget _buildItem(DataTransportFormAdmin response) {
    return Container(
        color: WHITE,
        child: Column(
          children: [
            const SizedBox(height: 16.5),
            InkWell(
                onTap: () {
                  Get.to(PackingDetailPage(),
                      arguments: response.id!.toString());
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
