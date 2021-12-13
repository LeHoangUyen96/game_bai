import 'package:viet_trung_mobile/data/response/home_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/home/controller/home_controller.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';
import 'package:sizer/sizer.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (value) => InitialWidget(
          titleAppBar: HOME_APP_BAR,
          backgroundAppBar: MAIN_COLOR,
          child: _buildBody()
          // child: controller.homeResponse != null && controller.exchangeRateResponse != null ? _buildBody() : LoadingSpinKit(),
          ),
    );
  }

  Widget _buildBody() {
    final vnd = Currency.create('VND', 2, symbol: 'đ', pattern: 'S0.000,00');

    Money cny2VNDExchangeRate =
        Money.from(controller.homeResponse!.data!.current_balance!, vnd);
    return Container(
      width: Get.width,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Get.width,
                padding: EdgeInsets.all(8),
                color: BG_CURRENCY,
                child: TextCustomized(
                  text: HOME_CURRENCY_RATE +
                      controller.exchangeRateResponse!.data!.exchange_rate!
                          .toString() +
                      HOME_VND_CNY,
                  font: SanFranciscoUIText,
                  size: 12,
                  isCenter: true,
                  color: BG_WHITE,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    controller.haveCopy
                        ? Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: BG_CURRENCY,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          HOME_ASK_SEE_PRODUCT_FROM_COPY,
                                          style: TextStyle(
                                            color: BLACK,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: SanFranciscoUIText,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: InkWell(
                                        onTap: () => controller.onSearchClick(),
                                        child: Container(
                                          child: Container(
                                            height: 30,
                                            alignment: Alignment.center,
                                            margin:
                                                EdgeInsets.fromLTRB(0, 5, 5, 5),
                                            decoration: BoxDecoration(
                                              color: RED,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              HOME_SEE,
                                              style: TextStyle(
                                                color: WHITE,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: SanFranciscoUIText,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          )
                        : Container(),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: BG_BALANCE,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: TextCustomized(
                                              text: HOME_BANLANCE,
                                              font: SanFranciscoText,
                                              color: WHITE,
                                              weight: FontWeight.w700,
                                            ),
                                          ),
                                          Expanded(
                                              child:
                                                  SvgPicture.asset(IC_DOLLAR))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextCustomized(
                                        text: cny2VNDExchangeRate
                                            .format('###,###,###,###S'),
                                        font: SanFranciscoText,
                                        color: WHITE,
                                        weight: FontWeight.w700,
                                        size: 20,
                                      ),
                                      TextButton(
                                          onPressed: () => {},
                                          child: Container(
                                            child: Text(
                                              HOME_VIEW_DEATAIL,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: WHITE,
                                                fontFamily: SanFranciscoUIText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: BG_INCOMING_ORDER,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: TextCustomized(
                                              text: HOME_INCOMING_ORDER,
                                              font: SanFranciscoText,
                                              color: WHITE,
                                              weight: FontWeight.w700,
                                            ),
                                          ),
                                          Expanded(
                                              child: SvgPicture.asset(IC_NOTES))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextCustomized(
                                        text: controller
                                            .homeResponse!.data!.number_order!
                                            .toString(),
                                        font: SanFranciscoText,
                                        color: WHITE,
                                        weight: FontWeight.w700,
                                        size: 20,
                                      ),
                                      TextButton(
                                          onPressed: () => {},
                                          child: Container(
                                            child: Text(
                                              HOME_VIEW_DEATAIL,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: WHITE,
                                                fontFamily: SanFranciscoUIText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: BG_SHOPPING_CART,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: TextCustomized(
                                              text: HOME_CART,
                                              font: SanFranciscoText,
                                              color: WHITE,
                                              weight: FontWeight.w700,
                                            ),
                                          ),
                                          Expanded(
                                              child: SvgPicture.asset(
                                                  IC_SHOPPING_CART))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextCustomized(
                                        text: controller
                                            .homeResponse!.data!.number_product!
                                            .toString(),
                                        font: SanFranciscoText,
                                        color: WHITE,
                                        weight: FontWeight.w700,
                                        size: 20,
                                      ),
                                      TextButton(
                                          onPressed: () => {},
                                          child: Container(
                                            child: Text(
                                              HOME_VIEW_DEATAIL,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: WHITE,
                                                fontFamily: SanFranciscoUIText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: BG_COMPLAINT,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: TextCustomized(
                                              text: HOME_COMPLAINT,
                                              font: SanFranciscoText,
                                              color: WHITE,
                                              weight: FontWeight.w700,
                                            ),
                                          ),
                                          Expanded(
                                              child: SvgPicture.asset(IC_SAD))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextCustomized(
                                        text: controller
                                            .homeResponse!.data!.complain!
                                            .toString(),
                                        font: SanFranciscoText,
                                        color: WHITE,
                                        weight: FontWeight.w700,
                                        size: 20,
                                      ),
                                      TextButton(
                                          onPressed: () => {},
                                          child: Container(
                                            child: Text(
                                              HOME_VIEW_DEATAIL,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: WHITE,
                                                fontFamily: SanFranciscoUIText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextCustomized(
                                text: HOME_INFO_ORDER,
                                font: SanFranciscoUIText,
                                weight: FontWeight.w700,
                                color: BLACK,
                              ),
                              InkWell(
                                onTap: () => {},
                                child: TextCustomized(
                                  text: HOME_SHOW_MORE,
                                  font: SanFranciscoUIText,
                                  weight: FontWeight.w700,
                                  color: BG_ID_PD,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: List.generate(
                                1000,
                                (index) => Expanded(
                                      child: Container(
                                        color: index % 2 == 0
                                            ? Colors.transparent
                                            : Colors.grey,
                                        height: 1,
                                      ),
                                    )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            itemBuilder:
                                (BuildContext buildContext, int index) {
                              return _buildListInfoOrder(controller
                                  .homeResponse!.data!.orders![index]);
                            },
                            itemCount:
                                controller.homeResponse!.data!.orders!.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustomized(
                            text: HOME_NEWS,
                            font: SanFranciscoText,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: List.generate(
                                1000,
                                (index) => Expanded(
                                      child: Container(
                                        color: index % 2 == 0
                                            ? Colors.transparent
                                            : Colors.grey,
                                        height: 1,
                                      ),
                                    )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //ListNewsCustomized(),
                          ListView.builder(
                            itemCount: controller.mNotifications!.length > 5
                                ? 5
                                : controller.mNotifications!.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return _buildListNews(
                                  controller.mNotifications![index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListInfoOrder(DataOrders data) {
    final Color colors;
    colors = controller.colorButton(data.order_status_name.toString());
    return Container(
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: GRAY)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              //flex: 2,
              child: Wrap(
            children: [
              TextCustomized(
                text: HOME_ORDER_CODE,
                font: SanFranciscoUIText,
                weight: FontWeight.w400,
                color: BLACK,
                size: miniSize,
              ),
              TextCustomized(
                text: data.order_code.toString(),
                font: SanFranciscoUIText,
                weight: FontWeight.w700,
                color: BG_ID_PD,
              ),
            ],
          )),
          Expanded(
            //flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(Get.context!).size.width - 50) * 0.4,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: colors,
                  ),
                  child: TextCustomized(
                    text: data.order_status_name.toString(),
                    font: SanFranciscoUIText,
                    weight: FontWeight.w700,
                    color: WHITE,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextCustomized(
                  text: data.updated_at.toString(),
                  font: SanFranciscoUIText,
                  weight: FontWeight.w700,
                  color: BG_ID_PD,
                  size: smallSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListNews(DataNotifications data) {
    return Container(
      //padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: data.image != null
                ? ImageCustomized(
                    path: data.image.toString(),
                    height: 12.0.w,
                    width: 12.0.w,
                    fit: BoxFit.contain,
                  )
                : Container(),
            //) != null ? Container() : Container(),
            // child : SvgPicture.network(
            // NetworkConfig.URL_SERVER_BASE_CDN + data.image.toString(),
            //   height: 12.0.w,
            //   width: 12.0.w,
            //   fit: BoxFit.cover,
            //   ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: TextCustomized(
                            text: data.content.toString(),
                            font: SanFranciscoUIText,
                            color: GRAY,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            data.created_at.toString(),
                            style: TextStyle(
                                fontFamily: SanFranciscoUIText,
                                color: GRAY,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
