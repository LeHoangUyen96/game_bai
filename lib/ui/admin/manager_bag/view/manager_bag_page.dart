import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/response/list_bag_resoonse.dart';
import 'package:viet_trung_mobile/data/response/list_status_bag_response.dart';
import 'package:viet_trung_mobile/data/response/list_transport_form_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/manager_bag_controller.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/bag_details_page.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/create_bag_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class ManagerBagPage extends GetView<ManagerBagController> {
  BuildContext? mContext;
  List listBag = [{}, {}, {}, {}];
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<ManagerBagController>(
      init: ManagerBagController(),
      builder: (value) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(),
        //body:  SingleChildScrollView(child: buildBody()) ,
        body: controller.mListBagResponse != null
            ? buildBody()
            : LoadingSpinKit(),
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
          text: MANAGE_PACKAGE,
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
        actions: [
          InkWell(
            onTap: () {
              Get.to(CreateBagPage());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SvgPicture.asset(
                IC_PLUS,
                color: WHITE,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: [
          Container(
            color: WHITE,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: WHITE,
                    border: Border.all(color: GRAY),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    controller.onGetListBagFilter();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IC_SEARCH,
                        width: Get.width * 0.1 - 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller.codeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: MANAGE_PACKAGE_SEARCH_BAG,
                            hintStyle: TextStyle(
                                color: GRAY, fontFamily: SanFranciscoUIText),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(spacing: 5.0, children: [
                  TextCustomized(
                    text: MANAGE_PACKAGE_TOTAL_BAG,
                    size: normalSize,
                    color: BLACK,
                    weight: FontWeight.w700,
                    font: SanFranciscoText,
                  ),
                  TextCustomized(
                    text: controller.mDataBagResponse!.length.toString(),
                    size: normalSize,
                    color: BLACK,
                    weight: FontWeight.w700,
                    font: SanFranciscoText,
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      controller.onCheckFilter();
                    },
                    child: SvgPicture.asset(IC_FILTER_ART),
                  ),
                ),
              ],
            ),
          ),
          controller.checkFilter == true
              ? Container(
                  color: WHITE,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        child: DropdownSearch<DataListStatusBagResponse>(
                          mode: Mode.MENU,
                          maxHeight: 120,
                          popupSafeArea: PopupSafeArea(),
                          onFind: (String? filter) =>
                              controller.getDataStatusBag(),
                          hint: "Trạng thái bao",
                          onChanged: (data) {
                            print('----------------$data');
                            controller.statusBag = data!.status_code;
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
                          popupItemBuilder: _customDropdownStatusBag,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: DropdownSearch<DataListTransportFormResponse>(
                          mode: Mode.MENU,
                          maxHeight: 120,
                          popupSafeArea: PopupSafeArea(),
                          onFind: (String? filter) =>
                              controller.getDataTransportForm(),
                          hint: "Chọn hình thức vận chuyển",
                          onChanged: (data) {
                            print('$data');
                            controller.transport_form_id = data!.id;
                            controller.update();
                          },
                          itemAsString: (DataListTransportFormResponse u) =>
                              u.name!,
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
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 48,
                                width: Get.width * 0.4,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: BT_GRAY,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 8,
                                        child: InkWell(
                                            onTap: () {
                                              controller
                                                  .pickFromDate(mContext!)
                                                  .toString();
                                            },
                                            child: TextCustomized(
                                                text: controller.fromDateTime !=
                                                        null
                                                    ? controller.fromDateTime
                                                        .toString()
                                                    : DELIVERY_NOTE_FROM_DATE))),
                                    SvgPicture.asset(
                                      IC_CALENDAR,
                                      height: 30,
                                      width: 30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 48,
                                width: Get.width * 0.4,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: BT_GRAY,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 8,
                                        child: InkWell(
                                            onTap: () {
                                              controller
                                                  .pickToDate(mContext!)
                                                  .toString();
                                            },
                                            child: TextCustomized(
                                                text: controller.toDateTime !=
                                                        null
                                                    ? controller.toDateTime
                                                        .toString()
                                                    : DELIVERY_NOTE_TO_DATE))),
                                    SvgPicture.asset(
                                      IC_CALENDAR,
                                      height: 30,
                                      width: 30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonCustomized(
                        AUTH_CONFIRM,
                        backgroundColor: BLACK_1,
                        textColor: WHITE,
                        onTap: () {
                          controller.onConfirm();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonCustomized(
                        BT_CANCEL,
                        backgroundColor: WHITE,
                        textColor: BLACK_1,
                        borderColor: BT_GRAY,
                        onTap: () {
                          controller.onCheckFilter();
                        },
                      )
                    ],
                  ),
                )
              : Container(),
          SizedBox(height: 15),
          Expanded(
            child: Container(
              height: Get.height * 0.8,
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: controller.onListRefresh,
                header: WaterDropHeader(
                  refresh: SpinKitCircle(
                    color: MAIN_COLOR,
                    size: 30,
                  ),
                  complete: SpinKitCircle(
                    color: MAIN_COLOR,
                    size: 40,
                  ),
                ),
                onLoading: controller.onListLoading,
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Container();
                    } else if (mode == LoadStatus.loading) {
                      body = SpinKitCircle(color: MAIN_COLOR, size: 40);
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = SpinKitCircle(color: MAIN_COLOR, size: 40);
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: controller.refreshController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                    itemCount: controller.mDataBagResponse!.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return _buildListBag(
                          controller.mListBagResponse!.data![index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: ListView.separated(
          //     itemCount: listBag.length,
          //     shrinkWrap: true,
          //     physics: ClampingScrollPhysics(),
          //     itemBuilder: (BuildContext context, int index ){
          //       return _buildListBag();
          //     },
          //     separatorBuilder: (context, index) {
          //         return SizedBox(height: 10);
          //       },
          //     ),
          // ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildListBag(DataBagResponse mData) {
    final Color color;
    color =
        controller.ColorStatusName(mData.parent_pack_status_name.toString());
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(1, 2), // changes position of shadow
            ),
          ],
          border: Border.all(color: BT_GRAY),
          borderRadius: BorderRadius.circular(15),
          color: WHITE),
      padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              //  decoration: BoxDecoration(
              //    border: Border(
              //      bottom: BorderSide(color: BT_GRAY)
              //    )
              //  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Get.to(BagDeatailsPage());
                          },
                          child: TextCustomized(
                            text: mData.code.toString(),
                            font: SanFranciscoText,
                            weight: FontWeight.w700,
                            color: MAIN_BLACK,
                            size: normalSize,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: TextCustomized(
                            text: mData.parent_pack_status_name.toString(),
                            font: SanFranciscoText,
                            weight: FontWeight.w400,
                            color: color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextCustomized(
                    text: mData.created_at.toString(),
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
                        text: mData.parent_pack_name.toString(),
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
                        text: mData.item_number.toString(),
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
                        text: mData.warehouse_back_name.toString(),
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
                        text: mData.transport_form.toString(),
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
                        text: mData.customer_number.toString(),
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
                        text: mData.updated_at.toString(),
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
            //SizedBox(height: 15),
            mData.parent_pack_status_name == ORDER_LIST_CHINA_WAREHOUSE
                ? Container(
                    padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: BT_GRAY))),
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
                  )
                : Container(),
          ]),
    );
  }

  Widget _customDropdownStatusBag(
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
}
