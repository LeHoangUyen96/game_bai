import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/order_wait_confirm/controller/order_wait_confirm_controller.dart';
import 'package:viet_trung_mobile/widget/header_order._page.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class OrderWaittingForConfirmPage extends GetView<OrderWaitConfirmController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<OrderWaitConfirmController>(
        init: OrderWaitConfirmController(),
        builder: (value) => Scaffold(
              appBar: buildAppBar('Đơn hàng chờ xác nhận'),
              body: controller.orderWaitConfirm != null
                  ? buildBody()
                  : SizedBox(),
              backgroundColor: GRAY_BG,
            ));
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextCustomized(
              text: "Tổng đơn: ${controller.orderWaitConfirm!.data!.length}",
              size: 14,
              font: SanFranciscoText,
              weight: FontWeight.w700,
              color: BLACK,
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: SingleChildScrollView(
              child: ListView.builder(
                itemCount: controller.orderWaitConfirm!.data!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _buildListOrder(
                      controller.orderWaitConfirm!.data![index]);
                },
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildListOrder(DataOrderOwnerless response) {
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
