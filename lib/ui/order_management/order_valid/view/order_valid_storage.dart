import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/response/order_admin_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_valid/controller/valid_order_controller.dart';
import 'package:viet_trung_mobile_admin/ui/order_management/order_valid/view/order_storage_detail_page.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/datepicker_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class OrderValidStorage extends GetView<ValidOrderController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ValidOrderController>(
        init: ValidOrderController(),
        builder: (value) => Scaffold(
              body: SmartRefresher(
                  enablePullUp: true,
                  enablePullDown: true,
                  controller: controller.refreshOrderStorageController,
                  onRefresh: () {
                    controller.onRefreshOrderStorage();
                  },
                  onLoading: () {
                    controller.onLoadingOrderStorage();
                  },
                  child: controller.orderStorage != null
                      ? buildBody()
                      : SizedBox()),
              bottomNavigationBar:
                  controller.checkAction == true ? _buildBottomNav() : null,
              backgroundColor: GRAY_BG,
            ));
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.onCheckAction();
                  },
                  child: controller.checkAction == false
                      ? Container(
                          child: TextCustomized(
                          text: "Thao tác",
                          size: 14,
                          color: Colors.black,
                          weight: FontWeight.w500,
                        ))
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                    ),
                                    child: Checkbox(
                                      checkColor: Colors.red,
                                      activeColor: Colors.white38,
                                      value: controller.isCheck,
                                      tristate: true,
                                      onChanged: (value) {
                                        controller.onChangeDefault();
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  TextCustomized(text: chooseAll),
                                ],
                              ),
                            ],
                          )),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      controller.onCheckFilter();
                    },
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          controller.checkFilter == true
              ? Container(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: DatepickerCustomized()),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: DatepickerCustomized()),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            TextCustomized(
                              text: "Huỷ",
                            ),
                            Spacer(),
                            TextCustomized(
                              text: "Xác nhận",
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: DatePickerWidget(
                            looping: false, // default is not looping
                            firstDate: DateTime(1990, 01, 01),
                            lastDate: DateTime(2030, 1, 1),
                            initialDate: DateTime(1991, 10, 12),
                            dateFormat: "dd-MMM-yyyy",
                            locale: DatePicker.localeFromString('vi'),
                            //onChange: (DateTime newDate, _) => _selectedDate = newDate,
                            pickerTheme: DateTimePickerTheme(
                              itemTextStyle:
                                  TextStyle(color: Colors.black, fontSize: 19),
                              dividerColor: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          child: ButtonCustomized(
                            AUTH_CONFIRM,
                            textColor: Colors.white,
                            backgroundColor: BT_CONFIRM,
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: ButtonCustomized(
                            WALLET_DEPOSIT_BTN_CANCEL,
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                            borderColor: MAIN_BT_SAVE_ADDRESS,
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ))
              : Container(),
          Container(
            child: SingleChildScrollView(
              child: ListView.builder(
                itemCount: controller.orderStorage!.data!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _buildListOrders(
                      controller.orderStorage!.data![index]);
                },
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildListOrders(DataOrderAdmin response) {
    return InkWell(
        onTap: () {
          Get.to(
            OrderStorageDetailPage(),
            arguments: response.id!.toString(),
          );
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

  Widget _buildBottomNav() {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: GRAY4,
                    ),
                    child: Center(
                      child: TextCustomized(
                        text: BT_CANCEL,
                        color: WHITE,
                      ),
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: BT_CONFIRM,
                    ),
                    child: Center(
                      child: TextCustomized(
                        text: CREATE_ORDER,
                        color: WHITE,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Status {
  final String? status;
  Status(this.status);
}
