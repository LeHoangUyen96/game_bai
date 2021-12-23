import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/city_response.dart';
import 'package:viet_trung_mobile_admin/data/response/district_response.dart';
import 'package:viet_trung_mobile_admin/data/response/wards_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/size.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_user/controller/edit_customer_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class EditCustomerPage extends GetView<EditCustomerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCustomerController>(
      init: EditCustomerController(),
      builder: (value) => controller.detailUserResponse != null
          ? Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: buildAppBar(),
              body: SingleChildScrollView(child: buildBody()),
              backgroundColor: WHITE,
            )
          : SizedBox(),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        title: TextCustomized(
          text: controller.detailUserResponse!.data!.name!,
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
      color: WHITE,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextCustomized(
            text: nameCustomer,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
          ),
          SizedBox(height: 5),
          TextFieldCustomized(
            textController: controller.userName,
          ),
          SizedBox(height: 15),
          TextCustomized(
            text: PHONE,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
          ),
          SizedBox(height: 5),
          TextFieldCustomized(
            textController: controller.userPhone,
          ),
          SizedBox(height: 15),
          TextCustomized(
            text: email,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
          ),
          SizedBox(height: 5),
          TextFieldCustomized(
            textController: controller.userEmail,
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemTitle(city),
              SizedBox(height: 5),
              _itemDropdown(
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                          alignedDropdown: true,
                          child: controller.cityResponse != null
                              ? DropdownButton(
                                  value: controller.selectedCity != null
                                      ? controller.selectedCity
                                      : null,
                                  icon: _iconDropdown(),
                                  iconSize: 24,
                                  elevation: 16,
                                  isExpanded: true,
                                  items: controller.cityResponse!
                                      .map((DataCity value) {
                                    return DropdownMenuItem<DataCity>(
                                      value: value,
                                      child: Text(
                                        value.name!,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (DataCity? value) {
                                    controller.onChangeCity(value!, value.id!);
                                  },
                                  hint: Text(controller
                                      .detailUserResponse!.data!.cityName!),
                                )
                              : DropdownButton(
                                  icon: _iconDropdown(),
                                  iconSize: 24,
                                  elevation: 16,
                                  isExpanded: true,
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: "1",
                                      child: Text(NO_CITY),
                                    ),
                                  ],
                                  onChanged: (value) {},
                                  hint: Text(city),
                                )),
                    ),
                  ),
                  Get.width),
              SizedBox(height: 5),
              controller.cityValid == false
                  ? TextCustomized(
                      text: controller.cityError.toString(), color: Colors.red)
                  : Container(),
            ],
          ),
          SizedBox(height: 16),
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _itemTitle(distric),
                SizedBox(height: 5),
                _itemDropdown(
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child: controller.districtResponse != null
                                ? DropdownButton(
                                    value: controller.selectedDistrict != null
                                        ? controller.selectedDistrict
                                        : null,
                                    icon: _iconDropdown(),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    items: controller.districtResponse!
                                        .map((DataDistrict value) {
                                      return DropdownMenuItem<DataDistrict>(
                                        value: value,
                                        child: Container(
                                          child: Text(
                                            value.name!,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (DataDistrict? value) {
                                      controller.onChangeDistrict(
                                          value!, value.id!);
                                    },
                                    hint: Text(''),
                                  )
                                : DropdownButton(
                                    icon: _iconDropdown(),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: "1",
                                        child: Center(
                                          child: Text(NO_DISTRICT),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {},
                                    hint: Text(''),
                                  )),
                      ),
                    ),
                    Get.width * 0.43),
                SizedBox(height: 5),
                controller.districtValid == false
                    ? TextCustomized(
                        text: controller.districtError.toString(),
                        color: Colors.red,
                        size: 11,
                      )
                    : Container(),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _itemTitle(ward),
                SizedBox(height: 5),
                _itemDropdown(
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child: controller.wardResponse != null
                                ? DropdownButton(
                                    value: controller.selectedWards != null
                                        ? controller.selectedWards
                                        : null,
                                    icon: _iconDropdown(),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    items: controller.wardResponse!
                                        .map((DataWards value) {
                                      return DropdownMenuItem<DataWards>(
                                        value: value,
                                        child: Text(
                                          value.name!,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (DataWards? value) {
                                      controller.onChangeWards(
                                          value!, value.id!);
                                    },
                                    hint: Text(''),
                                  )
                                : DropdownButton(
                                    icon: _iconDropdown(),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: "1",
                                        child: Text(NO_WARDS),
                                      ),
                                    ],
                                    onChanged: (value) {},
                                    hint: Text(''),
                                  )),
                      ),
                    ),
                    Get.width * 0.43),
                SizedBox(height: 5),
                controller.wardsValid == false
                    ? TextCustomized(
                        text: controller.wardsError.toString(),
                        color: Colors.red,
                        size: 11,
                      )
                    : Container(),
              ],
            ),
          ]),
          SizedBox(height: 5),
          TextCustomized(
            text: address,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
          ),
          SizedBox(height: 5),
          TextFieldCustomized(
            textController: controller.userAddress,
          ),
          SizedBox(height: 25),
          ButtonCustomized(save, backgroundColor: COLOR_BT, textColor: WHITE,
              onTap: () {
            controller.onSave();
          }),
          SizedBox(height: 15),
          ButtonCustomized(
            cancel,
            backgroundColor: WHITE,
            borderColor: BT_GRAY,
            textColor: GRAY3,
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  Widget _itemTitle(String text) {
    return TextCustomized(
      text: text,
      color: Colors.black,
      weight: FontWeight.w500,
    );
  }

  Widget _iconDropdown() {
    return Icon(
      Icons.keyboard_arrow_down,
      color: MAIN_LINE,
    );
  }

  Widget _itemDropdown(Widget dropdown, double width) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: MAIN_LINE),
            borderRadius: BorderRadius.circular(9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dropdown,
          ],
        ));
  }
}
