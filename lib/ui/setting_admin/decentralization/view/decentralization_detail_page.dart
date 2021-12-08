import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/list_rights_group.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/decentralization/controller/decentralization_detail_controller.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class DecentralizationDetailPage
    extends GetView<DecentralizationDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DecentralizationDetailController>(
      init: DecentralizationDetailController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(warehouseCNStaff, SizedBox()),
        body: controller.response != null ? buildBody() : SizedBox(),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      color: MAIN_BG,
      child: Column(children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(top: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextCustomized(
                text: 'Tên',
                weight: FontWeight.w500,
                size: 14,
                color: BLACK,
              ),
              SizedBox(height: 5),
              TextFieldCustomized(
                textController: controller.nameController,
                hint: warehouseCNStaff,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                colorBackgrount: MAIN_BG,
                colorHintText: GRAY8,
              ),
            ])),
        SizedBox(height: 10),
        ListView.builder(
            itemCount: controller.response!.data!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _itemRightsGroup(
                controller.response!.data![index],
              );
            }),
      ]),
    );
  }

  Widget _itemRightsGroup(DataRightsGroup response) {
    return Row(
      children: [
        Checkbox(
          checkColor: RED,
          activeColor: WHITE,
          value: controller.isCheck,
          tristate: true,
          onChanged: (value) {
            controller.onCheck();
          },
        ),
        TextCustomized(
          text: response.name!,
          size: 14,
          color: BLACK,
        ),
      ],
    );
  }
}
