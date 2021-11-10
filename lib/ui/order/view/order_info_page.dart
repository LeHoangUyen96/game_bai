import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order/controller/order_info_controller.dart';
import 'package:viet_trung_mobile/ui/order/view/order_inventory_list_page.dart';
import 'package:viet_trung_mobile/ui/order/view/order_list.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class OrderInfoPage extends GetView<OrderInfoController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<OrderInfoController>(
      init: OrderInfoController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body:   buildBody() 
               
      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: InitialWidget(
        child: Container(),
        titleAppBar: ORDER_LIST_APP_BAR,
        titleAppBarColor: BLACK,
        backgroundAppBar: WHITE,
         isShowBack: true,
        iconBack: Icon(Icons.arrow_back_ios, color: MAIN_GRAY,),
        
      ),
    );
  }
  Widget buildBody(){
    return Container(
      color: WHITE,
       margin: EdgeInsets.only(top: Get.height * 0.01),
     // padding: EdgeInsets.symmetric(horizontal: Get.width*0.2),
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints.expand(height: Get.height*0.05),
              child: TabBar(
                onTap: (index){ controller.onChangePage(index);},
                isScrollable: true,
                controller: controller.tabController,
                indicatorColor: MAIN_BLACK,
                indicatorWeight: 2,
                tabs: [
                  Container(
                    width: Get.width * 0.4,
                    child: TextCustomized(
                      textAlign: TextAlign.center,
                      text: ORDER_LIST_ARRIVED,
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    width: Get.width * 0.4,
                    child: TextCustomized(
                      textAlign: TextAlign.center,
                      text: ORDER_LIST_STOCK,
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.w800,
                    ),
                  ),
                  
                ],
              ),
            ),
            Expanded(
                child: Container(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      OrderListPage(),
                      OrderInventoryListPage(),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}