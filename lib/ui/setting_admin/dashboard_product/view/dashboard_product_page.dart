import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/dashboard_product/controller/dashboard_controller.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/dashboard_product/view/add_product_popup.dart';
import 'package:viet_trung_mobile_admin/ui/setting_admin/dashboard_product/view/edit_product_popup.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class DashboardProductPage extends GetView<DashboardProductController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardProductController>(
        init: DashboardProductController(),
        builder: (value) => SmartRefresher(
              enablePullUp: true,
              enablePullDown: true,
              controller: controller.refreshController,
              onRefresh: () {
                controller.onRefresh();
              },
              child: Scaffold(
                appBar: buildAppBar(
                  dashboardProduct,
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Get.dialog(DialogAddProduct()).then((value) {
                          if (value != null) {
                            controller.onGetListProduct();
                          }
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: WHITE,
                      ),
                    ),
                  ),
                ),
                body: controller.productResponse != null
                    ? buildBody()
                    : SizedBox(),
              ),
            ));
  }

  Widget buildBody() {
    return Container(
        color: MAIN_BG,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: TextCustomized(text: numerical)),
                      DataColumn(label: TextCustomized(text: nameProducts)),
                      DataColumn(label: TextCustomized(text: operation)),
                    ],
                    rows: controller.listProducts!
                        .asMap()
                        .keys
                        .toList()
                        .map((index) {
                      int nummerical = index + 1;
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(TextCustomized(text: nummerical.toString())),
                          DataCell(TextCustomized(
                              text: controller.listProducts![index].name!)),
                          DataCell(Row(
                            children: [
                              SizedBox(width: 10),
                              InkWell(
                                  onTap: () {
                                    Get.dialog(DialogEditProduct(),
                                            arguments: controller
                                                .listProducts![index].id!
                                                .toString())
                                        .then((value) {
                                      if (value != null) {
                                        controller.onGetListProduct();
                                      }
                                    });
                                  },
                                  child: ImageCustomized(
                                    path: ic_edit,
                                    height: 16,
                                    width: 16,
                                    color: Colors.black,
                                  )),
                              SizedBox(width: 5),
                              InkWell(
                                  onTap: () {
                                    controller.onDeleteProduct(controller
                                        .listProducts![index].id!
                                        .toString());
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
                ),
              ),
            ],
          ),
        ));
  }
}
