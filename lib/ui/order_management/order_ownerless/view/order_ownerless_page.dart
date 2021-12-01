import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/order_ownerless_response.dart';
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
              body: controller.orderOwnerless != null
                  ? buildBody()
                  : const SizedBox(),
              backgroundColor: GRAY_BG,
            ));
  }

  Widget buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 11.5),
                child: TextCustomized(
                  text:
                      totalOrder + '${controller.orderOwnerless!.data!.length}',
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
      ),
    );
  }

  Widget _buildListOrder(DataOrderOwnerless response) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Card(
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
                  SizedBox(
                    height: 10,
                  ),
                  TextCustomized(
                    text: response.createdAt!,
                    font: SanFranciscoTextLight,
                    weight: FontWeight.w400,
                    color: MAIN_GRAY,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustomized(
                        text: ORDER_LIST_PARCELS,
                        font: SanFranciscoTextLight,
                        weight: FontWeight.w700,
                        color: GRAY1,
                      ),
                      TextCustomized(
                        text: response.numberPackage!.toString(),
                        font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: BLACK,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustomized(
                        text: ORDER_LIST_ITEMS,
                        font: SanFranciscoTextLight,
                        weight: FontWeight.w700,
                        color: GRAY1,
                      ),
                      TextCustomized(
                        text: response.name!,
                        font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: BLACK,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustomized(
                        text: ORDER_LIST_COD,
                        font: SanFranciscoTextLight,
                        weight: FontWeight.w700,
                        color: GRAY1,
                      ),
                      TextCustomized(
                        text: "¥ ${response.transportFee!.toString()}",
                        font: SanFranciscoText,
                        weight: FontWeight.w400,
                        color: RED,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustomized(
                        text: transport,
                        font: SanFranciscoTextLight,
                        weight: FontWeight.w700,
                        color: GRAY1,
                      ),
                      Expanded(
                        flex: 5,
                        child: TextCustomized(
                          text: "¥ ${response.surcharge!.toString()}",
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  ButtonCustomized(
                    verifi,
                    textColor: Colors.black,
                    borderColor: Colors.grey,
                    onTap: () {
                      Get.to(OwneslessOrderConfirmPage());
                    },
                    backgroundColor: Colors.white,
                    height: 48,
                    width: Get.width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
