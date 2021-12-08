import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/list_packing_form_response.dart';
import 'package:viet_trung_mobile/data/response/list_transport_form_response.dart';
import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/create_bag_controller.dart';
import 'package:viet_trung_mobile/ui/admin/order_valid/create_bag_ord_vaild/controller/create_bag_ord_vaild_controller.dart';
import 'package:viet_trung_mobile/widget/add_product_dialog.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_widget.dart';

class CreateBagOrdValidPage extends GetView<CreateBagOrdValidController> {
  BuildContext? mContext;
  List listBill = [{}, {}, {}, {}];
  List listBag = [{}];
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<CreateBagOrdValidController>(
      init: CreateBagOrdValidController(),
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
          text: MANAGE_PACKAGE_CREATE_NEW,
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
        child: Column(children: [
      Container(
        color: WHITE,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustomized(
              text: MANAGE_PACKAGE_TYPE_BAG,
              font: SanFranciscoUIText,
              size: normalSize,
              weight: FontWeight.w600,
              color: BLACK_1,
            ),
            SizedBox(height: 15),
            Container(
              child: DropdownSearch<DataListWareHouseBackResponse>(
                mode: Mode.MENU,
                maxHeight: 120,
                popupSafeArea: PopupSafeArea(),
                onFind: (String? filter) => controller.getDataWareHouseBack(),
                hint: "Chọn kiểu bao",
                onChanged: (data) {
                  print('$data');
                  controller.item_code = data!.status_code!;
                  controller.update();
                },
                itemAsString: (DataListWareHouseBackResponse u) =>
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
                popupItemBuilder: _customDropdown,
              ),
            ),
            SizedBox(height: 15),
            TextCustomized(
              text: MANAGE_PACKAGE_WARE_HOUSE_MOVE_BACK,
              font: SanFranciscoUIText,
              size: normalSize,
              weight: FontWeight.w600,
              color: BLACK_1,
            ),
            SizedBox(height: 15),
            Container(
              child: DropdownSearch<DataListWareHouseBackResponse>(
                mode: Mode.MENU,
                maxHeight: 120,
                popupSafeArea: PopupSafeArea(),
                onFind: (String? filter) => controller.getDataWareHouseBack(),
                hint: "Chọn kho",
                onChanged: (data) {
                  print('$data');
                  controller.item_code = data!.status_code!;
                  controller.update();
                },
                itemAsString: (DataListWareHouseBackResponse u) =>
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
                popupItemBuilder: _customDropdown,
              ),
            ),
            SizedBox(height: 15),
            TextCustomized(
              text: MANAGE_PACKAGE_TRANSFER_FORM,
              font: SanFranciscoUIText,
              size: normalSize,
              weight: FontWeight.w600,
              color: BLACK_1,
            ),
            SizedBox(height: 15),
            Container(
              child: DropdownSearch<DataListTransportFormResponse>(
                mode: Mode.MENU,
                maxHeight: 120,
                popupSafeArea: PopupSafeArea(),
                onFind: (String? filter) => controller.getDataTransportForm(),
                hint: "Chọn hình thức vận chuyển",
                onChanged: (data) {
                  print('$data');
                  controller.item_code = data!.name!;
                  controller.update();
                },
                itemAsString: (DataListTransportFormResponse u) => u.name!,
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
                popupItemBuilder: _customDropdownTransportForm,
              ),
            ),
            SizedBox(height: 15),
            TextCustomized(
              text: MANAGE_PACKAGE_PACKING_FORM,
              font: SanFranciscoUIText,
              size: normalSize,
              weight: FontWeight.w600,
              color: BLACK_1,
            ),
            SizedBox(height: 15),
            Container(
              child: DropdownSearch<DataListPackingFormFormResponse>(
                mode: Mode.MENU,
                maxHeight: 120,
                popupSafeArea: PopupSafeArea(),
                onFind: (String? filter) => controller.getDataListTransport(),
                hint: "Chọn hình thức đóng gói",
                onChanged: (data) {
                  print('$data');
                  controller.item_code = data!.name!;
                  controller.update();
                },
                itemAsString: (DataListPackingFormFormResponse u) => u.name!,
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
                popupItemBuilder: _customDropdownPackingForm,
              ),
            ),
            SizedBox(height: 15),
            Container(
                width: Get.width * 0.5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustomized(
                        text: ADMIN_NUMBER_PACKAGES,
                        font: SanFranciscoUIText,
                        size: normalSize,
                        weight: FontWeight.w600,
                        color: BLACK_1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        //width: Get.width*0.5,
                        child: TextFieldCustomized(
                          hint: ORDER_LIST_NULL,
                        ),
                      )
                    ])),
          ],
        ),
      ),
      SizedBox(height: 15),
      Container(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        decoration: BoxDecoration(
          color: WHITE,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: BT_GRAY))),
              child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: BT_GRAY),
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        onTap: () {
                          controller.addBagItem();
                        },
                        child: SvgPicture.asset(
                          IC_ADD_CIRCLE,
                          color: BLACK_1,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Flexible(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return _buildListBag(index);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10.0);
                        },
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        reverse: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listBag,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 15),
            listBill.length > 0
                ? Container(
                    child: DottedBorder(
                      dashPattern: [10, 4],
                      strokeWidth: 2,
                      color: GRAY,
                      radius: Radius.circular(20),
                      borderType: BorderType.RRect,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: GRAY7,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextCustomized(
                                    text: MANAGE_PACKAGE_BAG_NAME,
                                    font: SanFranciscoText,
                                    color: BLACK,
                                    size: normalSize,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                TextCustomized(
                                  text: ORDER_NULL,
                                  font: SanFranciscoUIText,
                                  color: BLACK,
                                  size: normalSize,
                                  weight: FontWeight.w400,
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextCustomized(
                                    text: ADMIN_NUMBER_PACKAGES,
                                    font: SanFranciscoText,
                                    color: BLACK,
                                    size: normalSize,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                TextCustomized(
                                  text: ORDER_NULL,
                                  font: SanFranciscoUIText,
                                  color: BLACK,
                                  size: normalSize,
                                  weight: FontWeight.w400,
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  //flex: 2,
                                  child: TextCustomized(
                                    text: MANAGE_PACKAGE_TOTAL_COD,
                                    font: SanFranciscoText,
                                    color: BLACK,
                                    size: normalSize,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                TextCustomized(
                                  text: ORDER_NULL,
                                  font: SanFranciscoUIText,
                                  color: BLACK,
                                  size: normalSize,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  //flex: 2,
                                  child: TextCustomized(
                                    text: MANAGE_PACKAGE_WEIGHT,
                                    font: SanFranciscoText,
                                    color: BLACK,
                                    size: normalSize,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                Expanded(
                                  child: TextFieldCustomized(
                                    hint: MANAGE_PACKAGE_ENTER_WEIGHT,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: BT_GRAY),
                )),
                child: Container(
                  child: Row(
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
                )),
            SizedBox(
              height: 10,
            ),
            controller.changeBill == true
                ? Container(
                    child: ListView.separated(
                        itemCount: listBill.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return _buildListBill();
                        }))
                : Container(),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Get.dialog(AddProductDialog());
                },
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
            SizedBox(height: 15),
            ButtonCustomized(
              BT_REGISTER,
              backgroundColor: BT_CONFIRM,
            ),
            SizedBox(height: 10),
            ButtonCustomized(
              CANCEL_DELETE_IN_CART,
              backgroundColor: WHITE,
              textColor: BT_CONFIRM,
              borderColor: BT_GRAY,
            ),
          ],
        ),
      ),
      //),
    ]));
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
                border: Border(bottom: BorderSide(color: BT_GRAY))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: '0123456AMHDI2',
                    font: SanFranciscoText,
                    weight: FontWeight.w700,
                    color: MAIN_BLACK,
                    size: normalSize,
                  ),
                  InkWell(
                    onTap: () {},
                    child: TextCustomized(
                      text: 'Xoá',
                      font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: RED_1,
                    ),
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

  Widget _customDropdown(BuildContext context,
      DataListWareHouseBackResponse item, bool isSelected) {
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

  Widget _customDropdownTransportForm(BuildContext context,
      DataListTransportFormResponse item, bool isSelected) {
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
                text: item.name?.toString() ?? '',
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

  Widget _customDropdownPackingForm(BuildContext context,
      DataListPackingFormFormResponse item, bool isSelected) {
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
                text: item.name?.toString() ?? '',
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

  Widget _buildListBag(int index) {
    return InkWell(
      onTap: () {
        controller.onChangeColorBag(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: controller.defaultsStatus == index ? BLACK_1 : WHITE,
            border: Border.all(color: BT_GRAY),
            borderRadius: BorderRadius.circular(5)),
        child: controller.listBag > 1
            ? Row(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: BT_GRAY)),
                  ),
                  child: Wrap(spacing: 5.0, children: [
                    TextCustomized(
                      text: MANAGE_PACKAGE_BAG,
                      font: SanFranciscoUIText,
                      weight: FontWeight.w700,
                      color: controller.defaultsStatus == index ? WHITE : BLACK,
                    ),
                    TextCustomized(
                      text: "${index + 1}",
                      color: controller.defaultsStatus == index ? WHITE : BLACK,
                      font: SanFranciscoUIText,
                      weight: FontWeight.w700,
                    ),
                  ]),
                ),
                SizedBox(
                  width: 10.0,
                ),
                InkWell(
                    onTap: () {
                      controller.onDelBagItem();
                    },
                    child: SvgPicture.asset(IC_CANCEL))
              ])
            : Row(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Wrap(spacing: 5.0, children: [
                    TextCustomized(
                      text: MANAGE_PACKAGE_BAG,
                      font: SanFranciscoUIText,
                      weight: FontWeight.w700,
                      color: controller.defaultsStatus == index ? WHITE : BLACK,
                    ),
                    TextCustomized(
                      text: "${index + 1}",
                      color: controller.defaultsStatus == index ? WHITE : BLACK,
                      font: SanFranciscoUIText,
                      weight: FontWeight.w700,
                    ),
                  ]),
                ),
              ]),
      ),
    );
  }
}
