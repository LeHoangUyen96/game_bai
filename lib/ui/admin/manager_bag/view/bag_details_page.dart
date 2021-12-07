import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/bag_details_controller.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class BagDeatailsPage extends GetView<BagDetailsController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<BagDetailsController>(
      init: BagDetailsController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(child: buildBody()),
        backgroundColor: BT_GRAY,
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        //centerTitle: true,
        title: TextCustomized(
          text: MANAGE_PACKAGE_DETAILS_BAG,
          color: WHITE,
          font: SanFranciscoText,
          isCenter: true,
        ),
        flexibleSpace: Image(
          image: AssetImage(BG_IMG),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: WHITE,
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            color: WHITE,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: BT_GRAY)),
                ),
                child: TextCustomized(
                  text: MANAGE_PACKAGE_INFO_BAG,
                  font: SanFranciscoUIText,
                  size: normalSize,
                  weight: FontWeight.w600,
                  color: BLACK_1,
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: BT_GRAY))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: '#DH0123456',
                          font: SanFranciscoText,
                          weight: FontWeight.w700,
                          color: MAIN_BLACK,
                          size: normalSize,
                        ),
                        TextCustomized(
                          text: 'Kho Cửa Khẩu',
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BG_ID_PD,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextCustomized(
                      text: '10:10 21/10/2021',
                      font: SanFranciscoTextLight,
                      weight: FontWeight.w400,
                      color: MAIN_GRAY,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_TYPE_BAG,
                          font: SanFranciscoUIText,
                          weight: FontWeight.w500,
                          size: normalSize,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: ORDER_NULL,
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_NUMBER_PACKAGE,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: ORDER_NULL,
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_WARE_HOUSE_MOVE_BACK,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: ORDER_NULL,
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_TRANSFER_FORM,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: ORDER_NULL,
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: RED_1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_NUMBER_OF_CUSTOMER,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: ORDER_NULL,
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustomized(
                          text: MANAGE_PACKAGE_UPDATE_DAY,
                          font: SanFranciscoUIText,
                          size: normalSize,
                          weight: FontWeight.w500,
                          color: BLACK_1,
                        ),
                        TextCustomized(
                          text: ORDER_NULL,
                          font: SanFranciscoText,
                          weight: FontWeight.w400,
                          color: BLACK,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {},
                  child: Wrap(
                    spacing: 5.0,
                    children: [
                      SvgPicture.asset(
                        IC_ADD_CIRCLE,
                        color: GRAY8,
                      ),
                      TextCustomized(
                        text: MANAGE_PACKAGE_MOVE_GOOD,
                        size: normalSize,
                        color: GRAY8,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: 15.0),
          Container(
            color: WHITE,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustomized(
                  text: MANAGE_PACKAGE_PACKING_FORM,
                  font: SanFranciscoUIText,
                  size: normalSize,
                  weight: FontWeight.w600,
                  color: BLACK_1,
                ),
                SizedBox(height: 15),
                Container(
                  child: DropdownSearch<DataListStatusBagResponse>(
                    mode: Mode.MENU,
                    maxHeight: 120,
                    popupSafeArea: PopupSafeArea(),
                    onFind: (String? filter) => controller.getDataStatusBag(),
                    hint: "Chọn Trạng thái bao hàng",
                    onChanged: (data) {
                      print('$data');
                      controller.item_code = data!.status_name!;
                      controller.update();
                    },
                    itemAsString: (DataListStatusBagResponse u) =>
                        u.status_name!,
                    dropdownButtonBuilder: (_) => Container(
                      padding: EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        IC_ARROW_DOWN,
                        color: GRAY,
                      ),
                    ),
                    popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    popupItemBuilder: _customDropdownBagStatus,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: WHITE,
            ),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: BT_GRAY),
              )),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustomized(
                              text: MANAGE_PACKAGE_LIST_BILL,
                              font: SanFranciscoUIText,
                              size: normalSize,
                              weight: FontWeight.w600,
                              color: BLACK_1,
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  controller.onChange(1);
                                },
                                child: controller.changeBill == true
                                    ? Icon(Icons.keyboard_arrow_up)
                                    : Icon(Icons.keyboard_arrow_down)),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                controller.changeBill == true
                    ? Container(
                        color: WHITE,
                        child: ListView.separated(
                            itemCount: 6,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 10);
                            },
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return _buildListBill();
                            }))
                    : Container(),
              ]),
            ),
          ),
          SizedBox(height: 15),
          Container(
            color: WHITE,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextCustomized(
                    text: orderJourney,
                    size: 16,
                    font: SanFranciscoText,
                    weight: FontWeight.w700,
                    color: BLACK,
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 0.5,
                  color: GRAY1,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      TimelineTile(
                        isFirst: true,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.4,
                        indicatorStyle: IndicatorStyle(
                          color: Colors.green,
                          height: 10,
                          width: 10,
                          drawGap: false,
                          indicatorXY: 0,
                        ),
                        beforeLineStyle:
                            LineStyle(color: BT_GRAY, thickness: 2),
                        endChild: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustomized(
                                text: "Kho Trung Quốc, đang đóng hàng về",
                                font: SanFranciscoTextLight,
                                weight: FontWeight.w400,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        startChild: Container(
                          child: Container(
                            alignment: const Alignment(0.7, -0.800),
                            child: TextCustomized(
                              text: "11/11/2021",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w400,
                              color: MAIN_GRAY,
                            ),
                          ),
                        ),
                      ),
                      TimelineTile(
                        alignment: TimelineAlign.manual,
                        lineXY: 0.4,
                        indicatorStyle: IndicatorStyle(
                          color: Colors.green,
                          height: 10,
                          width: 10,
                          drawGap: false,
                          indicatorXY: 0,
                        ),
                        beforeLineStyle:
                            LineStyle(color: BT_GRAY, thickness: 2),
                        endChild: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustomized(
                                text: "Kho Trung Quốc ",
                                font: SanFranciscoTextLight,
                                weight: FontWeight.w400,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        startChild: Container(
                          child: Container(
                            alignment: const Alignment(0.7, -0.800),
                            child: TextCustomized(
                              text: "11/11/2021",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w400,
                              color: MAIN_GRAY,
                            ),
                          ),
                        ),
                      ),
                      TimelineTile(
                        isLast: true,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.4,
                        indicatorStyle: IndicatorStyle(
                          color: Colors.green,
                          height: 10,
                          width: 10,
                          drawGap: false,
                          indicatorXY: 0,
                        ),
                        beforeLineStyle:
                            LineStyle(color: BT_GRAY, thickness: 2),
                        endChild: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustomized(
                                text: "Kho Trung Quốc, đang đóng hàng về",
                                font: SanFranciscoTextLight,
                                weight: FontWeight.w400,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        startChild: Container(
                          child: Container(
                            alignment: const Alignment(0.7, -0.800),
                            child: TextCustomized(
                              text: "11/11/2021",
                              font: SanFranciscoTextLight,
                              weight: FontWeight.w400,
                              color: MAIN_GRAY,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListBill() {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: BT_GRAY),
              //bottom: BorderSide(color: BT_GRAY)
            )),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextCustomized(
                text: '0123456AMHDI2',
                font: SanFranciscoText,
                weight: FontWeight.w700,
                color: MAIN_BLACK,
                size: normalSize,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: MANAGE_PACKAGE_PACKING_FORM,
                    font: SanFranciscoUIText,
                    weight: FontWeight.w500,
                    size: normalSize,
                    color: BLACK_1,
                  ),
                  TextCustomized(
                    text: ORDER_NULL,
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: BLACK,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: ADMIN_NUMBER_PACKAGES,
                    font: SanFranciscoUIText,
                    size: normalSize,
                    weight: FontWeight.w500,
                    color: BLACK_1,
                  ),
                  TextCustomized(
                    text: ORDER_NULL,
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: BLACK,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: ORDER_LIST_COD,
                    font: SanFranciscoUIText,
                    size: normalSize,
                    weight: FontWeight.w500,
                    color: BLACK_1,
                  ),
                  TextCustomized(
                    text: ORDER_NULL,
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: BLACK,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: MANAGE_PACKAGE_SURCHARGE,
                    font: SanFranciscoUIText,
                    size: normalSize,
                    weight: FontWeight.w500,
                    color: BLACK_1,
                  ),
                  TextCustomized(
                    text: ORDER_NULL,
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: RED_1,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: DELIVERY_FEE_TRANSACTION,
                    font: SanFranciscoUIText,
                    size: normalSize,
                    weight: FontWeight.w500,
                    color: BLACK_1,
                  ),
                  TextCustomized(
                    text: ORDER_NULL,
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: BLACK,
                  ),
                ],
              ),
            ]),
          )
        ]));
  }

  Widget _customDropdownBagStatus(
      BuildContext context, DataListStatusBagResponse item, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: GRAY, width: 1.0)),
        //borderRadius: BorderRadius.circular(5),
        //color: bdredColor,
      ),
      child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: TextCustomized(
                text: item.status_name?.toString() ?? '',
                font: SanFranciscoUIText,
                weight: FontWeight.w400,
              )),
              //  Flexible(
              //    child: SvgPicture.asset(IC_CHECK1),
              //    )
            ],
          )),
    );
  }
}
