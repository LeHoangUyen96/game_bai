import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/setting_admin/transport/controller/transport_controller.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class TransportDetailPage extends GetView<TransportController> {
  String? name;
  TransportDetailPage({this.name});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransportController>(
      init: TransportController(),
      builder: (value) => controller.response != null
          ? Scaffold(
              backgroundColor: MAIN_BG,
              appBar: buildAppBar(
                  name!,
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
              body: buildBody())
          : SizedBox(),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.all(16),
      color: MAIN_BG,
      child: Column(children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: TextCustomized(text: product)),
                DataColumn(label: TextCustomized(text: unit)),
                DataColumn(label: TextCustomized(text: from)),
                DataColumn(label: TextCustomized(text: to)),
                DataColumn(label: TextCustomized(text: HN)),
                DataColumn(label: TextCustomized(text: DN)),
                DataColumn(label: TextCustomized(text: SG)),
                DataColumn(label: TextCustomized(text: operation)),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(TextCustomized(text: 'Quần áo')),
                  DataCell(TextCustomized(text: 'kg')),
                  DataCell(TextCustomized(text: '1')),
                  DataCell(TextCustomized(text: '10')),
                  DataCell(TextCustomized(text: '29000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '')),
                ]),
                DataRow(cells: [
                  DataCell(TextCustomized(text: 'Quần áo')),
                  DataCell(TextCustomized(text: 'kg')),
                  DataCell(TextCustomized(text: '1')),
                  DataCell(TextCustomized(text: '10')),
                  DataCell(TextCustomized(text: '29000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '')),
                ]),
                DataRow(cells: [
                  DataCell(TextCustomized(text: 'Quần áo')),
                  DataCell(TextCustomized(text: 'kg')),
                  DataCell(TextCustomized(text: '1')),
                  DataCell(TextCustomized(text: '10')),
                  DataCell(TextCustomized(text: '29000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '')),
                ]),
                DataRow(cells: [
                  DataCell(TextCustomized(text: 'Quần áo')),
                  DataCell(TextCustomized(text: 'kg')),
                  DataCell(TextCustomized(text: '1')),
                  DataCell(TextCustomized(text: '10')),
                  DataCell(TextCustomized(text: '29000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '')),
                ]),
                DataRow(cells: [
                  DataCell(TextCustomized(text: 'Quần áo')),
                  DataCell(TextCustomized(text: 'kg')),
                  DataCell(TextCustomized(text: '1')),
                  DataCell(TextCustomized(text: '10')),
                  DataCell(TextCustomized(text: '29000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '37000')),
                  DataCell(TextCustomized(text: '')),
                ]),
              ],
            )),
      ]),
    );
  }

  Widget _itemParam() {
    return TextCustomized(text: '');
  }
}
