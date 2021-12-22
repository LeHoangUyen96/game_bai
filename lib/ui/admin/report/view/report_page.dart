import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_bag/view/create_bag_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/report/controller/report_controller.dart';
import 'package:viet_trung_mobile_admin/ui/admin/report/view/date_time_picker.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/datepicker_customized.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';
import 'package:viet_trung_mobile_admin/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class ReportPage extends GetView<ReportController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      init: ReportController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body: controller.reportResponse != null ? buildBody() : LoadingSpinKit(),
        backgroundColor: MAIN_BG,
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55),
      child: InitialWidget(
        child: Container(),
        titleAppBar: report,
        backgroundAppBar: Colors.black26,
        isShowBack: true,
        iconBack: Icon(Icons.arrow_back_ios, color: WHITE,),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: Get.width,
              color: WHITE,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustomized(
                    text: PICK_TIME,
                    color: BLACK_1,
                    font: SanFranciscoText,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                child: DropdownSearch<DataTypeTime>(
                  mode: Mode.MENU,
                  maxHeight: 160,
                  popupSafeArea: PopupSafeArea(),
                  items: [
                    DataTypeTime(
                        type: 1,  nameTimeType: "Hôm nay"),
                    DataTypeTime(
                        type: 2,  nameTimeType: "Hôm qua"),
                    DataTypeTime(
                        type: 3,  nameTimeType: "7 ngày qua"),
                    DataTypeTime(
                        type: 4,  nameTimeType: "Tháng này"),
                    DataTypeTime(
                        type: 5,  nameTimeType: "Tuỳ chọn"),            
                  ],
                  //onFind: (String? filter) => getData(filter),
                  hint: "Hôm nay",
                  //selectedItem: DataTypeTime(type: 1,  nameTimeType: "Hôm nay"),
                  onChanged: (data) {
                    print('${controller.typeTime}');
                    controller.typeTime = data!.type!;
                    controller.onChangeTypeTime();
                    controller.onCheckTime();
                    controller.update();
                  },
                  itemAsString: (DataTypeTime u) => u.nameTimeType!,
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
                 SizedBox(height: 10.0),
                 controller.isCheckTime == true
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
                              child:Container(
                              height: 48,
                              width: Get.width,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: MAIN_BT_SAVE_ADDRESS,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(9))),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    controller.pickFromDate(Get.context!).toString();
                                  },
                                  child: TextCustomized(
                                      text: controller.fromDateTime != null
                                          ? controller.fromDateTime.toString()
                                          : DELIVERY_NOTE_FROM_DATE
                                  ),
                                ),
                              ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 5,
                              child:Container(
                              height: 48,
                              width: Get.width,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: MAIN_BT_SAVE_ADDRESS,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(9))),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    controller.pickToDate(Get.context!).toString();
                                  },
                                  child: TextCustomized(
                                    text: controller.toDateTime != null
                                        ? controller.toDateTime!.toString()
                                        : DELIVERY_NOTE_TO_DATE
                                  ),
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  controller.onCheckTime();
                                },
                                child: TextCustomized(text: CANCEL)),
                            Spacer(),
                            TextCustomized(
                              text: CONFIRM,
                              color: COLOR_BT,
                              weight: FontWeight.bold,
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
                            onTap: () {
                              controller.onCheckTime();
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ))
              : Container(),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: Get.width,
              color: WHITE,
              //padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BT_GRAY
                        ),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustomized(
                          text: REPORT_BAG_OUT_OF_STOCK,
                          color: BLACK_1,
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w600,
                          ),
                        TextCustomized(
                          text: controller.reportResponse!.number_parent_pack.toString(),
                          color: BLACK_1,
                          font: SanFranciscoText,
                          weight: FontWeight.w600,
                          ),  
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BT_GRAY
                        ),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustomized(
                          text: REPORT_NUMBER_PARCEL_SHIPPED,
                          color: BLACK_1,
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w600,
                          ),
                        TextCustomized(
                          text: controller.reportResponse!.number_package.toString(),
                          color: BLACK_1,
                          font: SanFranciscoText,
                          weight: FontWeight.w600,
                          ),  
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BT_GRAY
                        ),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustomized(
                          text: REPORT_NUMBER_USER,
                          color: BLACK_1,
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w600,
                          ),
                        TextCustomized(
                          text: controller.reportResponse!.number_user.toString(),
                          color: BLACK_1,
                          font: SanFranciscoText,
                          weight: FontWeight.w600,
                          ),  
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BT_GRAY
                        ),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustomized(
                          text: REPORT_TOTAL_WEIGHT,
                          color: BLACK_1,
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w600,
                          ),
                        TextCustomized(
                          text: controller.reportResponse!.total_weight.toString(),
                          color: BLACK_1,
                          font: SanFranciscoText,
                          weight: FontWeight.w600,
                          ),  
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BT_GRAY
                        ),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustomized(
                          text: REPORT_TOTAL_VOLUME,
                          color: BLACK_1,
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w600,
                          ),
                        TextCustomized(
                          text: controller.reportResponse!.total_volume.toString(),
                          color: BLACK_1,
                          font: SanFranciscoText,
                          weight: FontWeight.w600,
                          ),  
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BT_GRAY
                        ),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustomized(
                          text: REPORT_TOTAL_COD,
                          color: BLACK_1,
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w600,
                          ),
                        TextCustomized(
                          text: controller.reportResponse!.total_cod.toString(),
                          color: BLACK_1,
                          font: SanFranciscoText,
                          weight: FontWeight.w600,
                          ),  
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BT_GRAY
                        ),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustomized(
                          text: REPORT_TOTAL_COST_PACKING,
                          color: BLACK_1,
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w600,
                          ),
                        TextCustomized(
                          text: controller.reportResponse!.total_packing_fee.toString(),
                          color: BLACK_1,
                          font: SanFranciscoText,
                          weight: FontWeight.w600,
                          ),  
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BT_GRAY
                        ),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustomized(
                          text: REPORT_SHIPPING_FEE,
                          color: BLACK_1,
                          font: SanFranciscoTextLight,
                          weight: FontWeight.w600,
                          ),
                        TextCustomized(
                          text: controller.reportResponse!.total_transport_vn_fee.toString(),
                          color: BLACK_1,
                          font: SanFranciscoText,
                          weight: FontWeight.w600,
                          ),  
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: ButtonCustomized(
                      REPORT_EXPORT,
                      onTap: (){
                        controller.onExportReport();
                      },
                      textColor: WHITE,
                      backgroundColor: BT_CONFIRM,
                    ),
                  ),
                 controller.downloading == true
              ? Container(
                  height: 250,
                  width: 250,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          controller.downloadingStr,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget _customDropdown(
      BuildContext context, DataTypeTime item, bool isSelected) {
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
                text: item.nameTimeType?.toString() ?? '',
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
class DataTypeTime {
  int? type;
  String? nameTimeType;
  DataTypeTime({required this.type, required this.nameTimeType});
}  