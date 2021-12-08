import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/response/order_admin_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/controller/order_ownerless_controller.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/view/order_ownerless_confirm_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class OwneslessOrderPage extends GetView<OrderOwnerlessController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderOwnerlessController>(
        init: OrderOwnerlessController(),
        builder: (value) => Scaffold(
              appBar: buildAppBar(ownerlessOrder),
              body: SmartRefresher(
                  enablePullUp: true,
                  enablePullDown: true,
                  controller: controller.refreshOrderController,
                  onRefresh: () {
                    controller.onRefreshOrder();
                  },
                  onLoading: () {
                    controller.onLoadingOrder();
                  },
                  child: controller.orderOwnerless != null
                      ? buildBody()
                      : SizedBox()),
              backgroundColor: GRAY_BG,
            ));
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 11.5),
              child: TextCustomized(
                text: totalOrder + '${controller.total!}',
                size: 14,
                color: Colors.black,
                weight: FontWeight.w500,
              )),
          Container(
            child: SingleChildScrollView(
              child: ListView.builder(
                itemCount: controller.orderOwnerless!.data!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _buildListOrder(
                      controller.orderOwnerless!.data![index]);
                },
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildListOrder(DataOrderAdmin response) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 20,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      borderOnForeground: true,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustomized(
                  text: response.billCode!,
                  font: SanFranciscoText,
                  weight: FontWeight.w700,
                  color: MAIN_BLACK,
                ),
                TextCustomized(
                  text: response.orderStatusName!,
                  font: SanFranciscoText,
                  weight: FontWeight.w400,
                  color: BG_ID_PD,
                ),
              ],
            ),
            SizedBox(height: 10),
            TextCustomized(
              text: response.createdAt!,
              font: SanFranciscoTextLight,
              weight: FontWeight.w400,
              style: FontStyle.italic,
              color: MAIN_GRAY,
            ),
            SizedBox(height: 10),
            _itemInfoOrder(
                ORDER_LIST_PARCELS, response.numberPackage!.toString(), BLACK),
            SizedBox(height: 10),
            _itemInfoOrder(ORDER_LIST_ITEMS, response.item!, BLACK),
            SizedBox(height: 10),
            _itemInfoOrder(
                ORDER_LIST_COD, "¥${response.transportFee!.toString()}", RED),
            SizedBox(height: 10),
            _itemInfoOrder(MANAGE_PACKAGE_SURCHARGE,
                "¥${response.surcharge!.toString()}", BLACK),
            SizedBox(height: 10),
            ButtonCustomized(
              verifi,
              textColor: Colors.black,
              borderColor: Colors.grey,
              onTap: () {
                Get.to(
                  OwneslessOrderConfirmPage(),
                  arguments: response.id!,
                );
              },
              backgroundColor: Colors.white,
              height: 48,
              width: Get.width,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemInfoOrder(String textTitle, String textParam, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustomized(
          text: textTitle,
          font: SanFranciscoTextLight,
          weight: FontWeight.w700,
          color: GRAY1,
        ),
        TextCustomized(
          text: textParam,
          font: SanFranciscoText,
          weight: FontWeight.w400,
          color: color,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
