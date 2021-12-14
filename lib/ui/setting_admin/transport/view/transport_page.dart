import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/response/list_transport_admin_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/transport/controller/transport_controller.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/transport/view/transport_detail_page.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';

class TransportPage extends GetView<TransportController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransportController>(
        init: TransportController(),
        builder: (value) => SmartRefresher(
              enablePullUp: true,
              enablePullDown: true,
              controller: controller.refreshController,
              onRefresh: () {
                controller.onRefresh();
              },
              child: Scaffold(
                appBar: buildAppBar(
                  transformeFormat,
                  SizedBox(),
                ),
                body: controller.response != null ? buildBody() : SizedBox(),
              ),
            ));
  }

  Widget buildBody() {
    return Container(
        color: MAIN_BG,
        child: SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
                itemCount: controller.response!.data!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildItem(
                    controller.response!.data![index],
                    () {
                      Get.to(
                        TransportDetailPage(
                            name: controller.response!.data![index].name!),
                        arguments:
                            controller.response!.data![index].id.toString(),
                      );
                    },
                  );
                }),
          ]),
        ));
  }

  Widget _buildItem(
    DataTransportFormAdmin response,
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
