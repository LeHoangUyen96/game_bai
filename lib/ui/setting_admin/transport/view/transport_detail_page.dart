import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/transport/controller/transport_detail_controller.dart';
import 'package:viet_trung_mobile/ui/setting_admin/transport/view/add_transport_fee_popup.dart';
import 'package:viet_trung_mobile/ui/setting_admin/transport/view/edit_transport_fee_popup.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class TransportDetailPage extends GetView<TransportDetailController> {
  String? name;
  TransportDetailPage({this.name});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransportDetailController>(
      init: TransportDetailController(),
      builder: (value) => controller.response != null
          ? SmartRefresher(
              enablePullUp: true,
              enablePullDown: true,
              controller: controller.refreshController,
              onRefresh: () {
                controller.onRefresh();
              },
              onLoading: () {
                controller.onLoading();
              },
              child: Scaffold(
                  backgroundColor: MAIN_BG,
                  appBar: buildAppBar(
                      name!,
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            Get.dialog(DialogAddTransportFee(),
                                arguments: controller.transportId!);
                          },
                          child: Icon(
                            Icons.add,
                            color: WHITE,
                          ),
                        ),
                      )),
                  body: controller.response!.data!.isNotEmpty
                      ? buildBody()
                      : SizedBox()))
          : SizedBox(),
    );
  }

  Widget buildBody() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        color: MAIN_BG,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Scrollbar(
                child: ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        sortAscending: true,
                        columns: [
                          DataColumn(label: TextCustomized(text: product)),
                          DataColumn(
                              label: TextCustomized(
                            text: unit,
                          )),
                          DataColumn(label: TextCustomized(text: from)),
                          DataColumn(label: TextCustomized(text: to)),
                          DataColumn(label: TextCustomized(text: HN)),
                          DataColumn(label: TextCustomized(text: DN)),
                          DataColumn(label: TextCustomized(text: SG)),
                          DataColumn(label: TextCustomized(text: operation)),
                        ],
                        rows: controller.transportDetail!.map<DataRow>((e) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(TextCustomized(text: e.productId!)),
                              DataCell(TextCustomized(text: e.unit!)),
                              DataCell(TextCustomized(text: e.from!)),
                              DataCell(TextCustomized(text: e.to!)),
                              DataCell(TextCustomized(text: e.transportFeeHN!)),
                              DataCell(TextCustomized(text: e.transportFeeDN!)),
                              DataCell(TextCustomized(text: e.transportFeeSG!)),
                              DataCell(Row(
                                children: [
                                  SizedBox(width: 10),
                                  InkWell(
                                      onTap: () {
                                        Get.dialog(DialogEditTransportFee(),
                                            arguments: e.id!.toString());
                                      },
                                      child: ImageCustomized(
                                        path: ic_edit,
                                        height: 18,
                                        width: 18,
                                      )),
                                  SizedBox(width: 5),
                                  InkWell(
                                      onTap: () {
                                        controller.onDeleteTransport(
                                            e.id!.toString());
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        size: 20,
                                      )),
                                ],
                              )),
                            ],
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
