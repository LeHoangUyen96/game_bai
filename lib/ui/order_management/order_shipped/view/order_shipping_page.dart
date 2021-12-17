import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/response/list_status_response.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_shipped/controller/order_shipped_controller.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_shipped/view/order_china_detail_page.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_shipped/view/order_vietnam_detail_page.dart';
import 'package:viet_trung_mobile_admin/widget/header_order._page.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class OrderShippingPage extends GetView<OrderShippedController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderShippedController>(
        init: OrderShippedController(),
        builder: (value) => Scaffold(
              appBar: buildAppBar(
                  orderShipped,
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.search,
                        color: WHITE,
                      ),
                    ),
                  )),
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
                  child: controller.orderShipped != null &&
                          controller.statusResponse != null
                      ? buildBody()
                      : SizedBox()),
              backgroundColor: GRAY_BG,
            ));
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: WHITE,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    _tabBar(
                        all + ' (${controller.orderShipped!.paginate!.total!})',
                        0),
                    Row(
                      children: List.generate(
                          controller.statusResponse!.data!.length,
                          (index) => tabBar(
                              controller.statusResponse!.data![index],
                              index + 1)),
                    )
                  ]))),
          SizedBox(height: 10),
          controller.positionSelected == 0
              ? listOrder()
              : controller.positionSelected == 1
                  ? listOrderCN()
                  : controller.positionSelected == 2
                      ? listOrderBorder()
                      : controller.positionSelected == 3
                          ? listOrderProcedure()
                          : controller.positionSelected == 4
                              ? listOrderHN()
                              : controller.positionSelected == 5
                                  ? listOrderSG()
                                  : controller.positionSelected == 6
                                      ? listOrderDN()
                                      : controller.positionSelected == 7
                                          ? listOrderDelivery()
                                          : listOrderReceive(),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget noOrder() {
    return Column(
      children: [
        SizedBox(height: 10),
        Center(child: TextCustomized(text: noOrders))
      ],
    );
  }

  Widget listOrder() {
    return controller.orderShipped!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.orderShipped!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder(controller.orderShipped!.data![index]);
              },
            ),
          )
        : noOrder();
  }

  Widget listOrderCN() {
    return controller.orderCN != null && controller.orderCN!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.orderCN!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder(controller.orderCN!.data![index]);
              },
            ),
          )
        : noOrder();
  }

  Widget listOrderHN() {
    return controller.orderHN != null && controller.orderHN!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.orderHN!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder(controller.orderHN!.data![index]);
              },
            ),
          )
        : noOrder();
  }

  Widget listOrderDN() {
    return controller.orderDN != null && controller.orderDN!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.orderDN!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder(controller.orderDN!.data![index]);
              },
            ),
          )
        : noOrder();
  }

  Widget listOrderSG() {
    return controller.orderSG != null && controller.orderSG!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.orderSG!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder(controller.orderSG!.data![index]);
              },
            ),
          )
        : noOrder();
  }

  Widget listOrderProcedure() {
    return controller.orderProcedure != null &&
            controller.orderProcedure!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.orderProcedure!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder(controller.orderProcedure!.data![index]);
              },
            ),
          )
        : noOrder();
  }

  Widget listOrderBorder() {
    return controller.orderBorder != null &&
            controller.orderBorder!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.orderBorder!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder(controller.orderBorder!.data![index]);
              },
            ),
          )
        : noOrder();
  }

  Widget listOrderDelivery() {
    return controller.orderDelivery != null &&
            controller.orderDelivery!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.orderDelivery!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder(controller.orderDelivery!.data![index]);
              },
            ),
          )
        : noOrder();
  }

  Widget listOrderReceive() {
    return controller.orderReceive != null &&
            controller.orderReceive!.data!.length > 0
        ? SingleChildScrollView(
            child: ListView.builder(
              itemCount: controller.orderReceive!.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildListOrder(controller.orderReceive!.data![index]);
              },
            ),
          )
        : noOrder();
  }

  Widget _tabBar(String text, int index) {
    return GestureDetector(
      onTap: () {
        controller.onSelect(index);
      },
      child: Container(
        margin: EdgeInsets.only(right: 2),
        child: itemTabBar(
            text, controller.positionSelected == index ? true : false),
      ),
    );
  }

  Widget tabBar(StatusResponse data, int index) {
    return GestureDetector(
      onTap: () {
        controller.onSelect(index);
      },
      child: itemTabBar(data.statusName!,
          controller.positionSelected == index ? true : false),
    );
  }

  Widget itemTabBar(String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.transparent : GRAY,
          ),
          borderRadius: BorderRadius.circular(3),
          color: isSelected ? COLOR_BT : WHITE),
      child: TextCustomized(
        text: text,
        font: inter,
        weight: FontWeight.w500,
        color: isSelected ? WHITE : GRAY,
      ),
    );
  }

  Widget _buildListOrder(DataOrderAdmin response) {
    return InkWell(
        onTap: response.orderStatusName == ORDER_EXPORT_TO_CHINA ||
                response.orderStatusName == ORDER_BORDER_WAREHOUSE ||
                response.orderStatusName == ORDER_BORDER_WAREHOUSE
            ? () {
                Get.to(OrderChinaDetailPage(),
                    arguments: response.id!.toString());
              }
            : () {
                Get.to(OrderVietNamDetailPage(),
                    arguments: response.id!.toString());
              },
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
                      color: response.orderStatusName! == ORDER_EXPORT_TO_CHINA
                          ? COLOR_ORDER_CHINESE_WAREHOUSE
                          : response.orderStatusName! == ORDER_BORDER_WAREHOUSE
                              ? COLOR_ORDER_BORDER_WAREHOUSE
                              : response.orderStatusName! == ORDER_PROCESS
                                  ? COLOR_ORDER_PROCESS
                                  : response.orderStatusName! ==
                                          ORDER_HN_WAREHOUSE
                                      ? COLOR_ORDER_HN_WAREHOUSE
                                      : response.orderStatusName! ==
                                              ORDER_SG_WAREHOUSE
                                          ? COLOR_ORDER_SG_WAREHOUSE
                                          : response.orderStatusName! ==
                                                  ORDER_DN_WAREHOUSE
                                              ? COLOR_ORDER_DN_WAREHOUSE
                                              : response.orderStatusName! ==
                                                      ORDER_DELIVERY_IN_PROGRESS
                                                  ? COLOR_ORDER_DELIVERY_IN_PROGRESS
                                                  : COLOR_ORDER_DELIVERY_SUCCESSFULL,
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
                _itemInfoOrder(ORDER_LIST_PARCELS,
                    response.numberPackage!.toString(), BLACK),
                SizedBox(height: 10),
                _itemInfoOrder(ORDER_LIST_ITEMS, response.item!, BLACK),
                SizedBox(height: 10),
                _itemInfoOrder(ORDER_LIST_COD,
                    "¥${response.transportFee!.toString()}", RED),
                SizedBox(height: 10),
                _itemInfoOrder(MANAGE_PACKAGE_SURCHARGE,
                    "¥${response.surcharge!.toString()}", BLACK),
              ],
            ),
          ),
        ));
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
