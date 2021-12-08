import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/list_decentralization_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/decentralization/controller/decentralization_controller.dart';
import 'package:viet_trung_mobile/ui/setting_admin/decentralization/view/decentralization_detail_page.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';

class DecentralizationPage extends GetView<DecentralizationController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DecentralizationController>(
      init: DecentralizationController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(
            decentralization,
            Container(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.add,
                  color: WHITE,
                ),
              ),
            )),
        body: controller.response != null ? buildBody() : SizedBox(),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      color: MAIN_BG,
      child: Column(children: [
        ListView.builder(
            itemCount: controller.response!.data!.length,
            shrinkWrap: true,
            reverse: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildItem(
                controller.response!.data![index],
                () {
                  Get.to(DecentralizationDetailPage());
                },
              );
            }),
      ]),
    );
  }

  Widget _buildItem(
    DataDecentralization response,
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
