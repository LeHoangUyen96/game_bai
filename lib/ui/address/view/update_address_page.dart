import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/city_response.dart';
import 'package:viet_trung_mobile_admin/data/response/district_response.dart';
import 'package:viet_trung_mobile_admin/data/response/wards_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/address/controller/update_address_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class UpdateAddressPage extends GetView<UpdateAddressController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateAddressController>(
      init: UpdateAddressController(),
      builder: (value) => Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return InitialWidget(
        titleAppBar: UPDATE_ADDRESS,
        titleAppBarColor: Colors.white,
        backgroundAppBar: Colors.black26,
        isAdd: false,
        statusBarColor: Colors.blue,
        isShowBack: true,
        iconBack: TextButton(
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () => Get.back(result: true),
        ),
        child: Container(
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25),
                        TextCustomized(text: NAME, weight: FontWeight.w700),
                        SizedBox(height: 5),
                        TextFieldCustomized(
                          textController: controller.nameController,
                          hint: NAME,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          // textController: controller.usernameController,
                        ),
                        SizedBox(height: 5),
                        controller.nameValid == false
                            ? TextCustomized(
                                text: controller.nameError.toString(),
                                color: Colors.red,
                              )
                            : Container(),
                      ],
                    )),
                SizedBox(height: 16),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(text: PHONE, weight: FontWeight.w700),
                        SizedBox(height: 5),
                        TextFieldCustomized(
                          textController: controller.phoneController,
                          hint: PHONE,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          // textController: controller.usernameController,
                        ),
                        SizedBox(height: 5),
                        controller.phoneValid == false
                            ? TextCustomized(
                                text: controller.phoneError.toString(),
                                color: Colors.red)
                            : Container(),
                      ],
                    )),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustomized(text: CITY, weight: FontWeight.w700),
                      SizedBox(height: 5),
                      Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: MAIN_LINE),
                              borderRadius: BorderRadius.circular(9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: controller.mcity != null
                                          ? DropdownButton(
                                              value: controller.selectedCity !=
                                                      null
                                                  ? controller.selectedCity
                                                  : null,
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: MAIN_LINE,
                                              ),
                                              iconSize: 24,
                                              elevation: 16,
                                              isExpanded: true,
                                              items: controller.mcity!
                                                  .map((DataCity value) {
                                                return DropdownMenuItem<
                                                    DataCity>(
                                                  value: value,
                                                  child: Container(
                                                    child: Text(
                                                      value.name.toString(),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (DataCity? value) {
                                                controller.onChangeCity(
                                                    value!, value.id!);
                                              },
                                              hint: Text(controller
                                                  .mdatas!.city_name
                                                  .toString()),
                                            )
                                          : DropdownButton(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: MAIN_LINE,
                                              ),
                                              iconSize: 24,
                                              elevation: 16,
                                              isExpanded: true,
                                              items: [
                                                DropdownMenuItem<String>(
                                                  value: "1",
                                                  child: Center(
                                                    child: Text(NO_CITY),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {},
                                              hint: Text(controller
                                                  .mdatas!.city_name
                                                  .toString()),
                                            )),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 5),
                      controller.cityValid == false
                          ? TextCustomized(
                              text: controller.cityError.toString(),
                              color: Colors.red)
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustomized(text: DISTRICT, weight: FontWeight.w700),
                      SizedBox(height: 5),
                      Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: MAIN_LINE),
                              borderRadius: BorderRadius.circular(9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: controller.mdistric != null
                                          ? DropdownButton(
                                              value: controller
                                                          .selectedDistrict !=
                                                      null
                                                  ? controller.selectedDistrict
                                                  : null,
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: MAIN_LINE,
                                              ),
                                              iconSize: 24,
                                              elevation: 16,
                                              isExpanded: true,
                                              items: controller.mdistric!
                                                  .map((DataDistrict value) {
                                                return DropdownMenuItem<
                                                    DataDistrict>(
                                                  value: value,
                                                  child: Container(
                                                    child: Text(
                                                      value.name.toString(),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (DataDistrict? value) {
                                                controller.onChangeDistrict(
                                                    value!, value.id!);
                                              },
                                              hint: Text(ONCHANGE_DISTRICT),
                                            )
                                          : DropdownButton(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: MAIN_LINE,
                                              ),
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
                                              hint: Text(controller
                                                  .mdatas!.district_name
                                                  .toString()),
                                            )),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 5),
                      controller.districtValid == false
                          ? TextCustomized(
                              text: controller.districtError.toString(),
                              color: Colors.red)
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustomized(text: WARDS, weight: FontWeight.w700),
                      SizedBox(height: 5),
                      Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: MAIN_LINE),
                              borderRadius: BorderRadius.circular(9)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: controller.mwards != null
                                          ? DropdownButton(
                                              value: controller.selectedWards !=
                                                      null
                                                  ? controller.selectedWards
                                                  : null,
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: MAIN_LINE,
                                              ),
                                              iconSize: 24,
                                              elevation: 16,
                                              isExpanded: true,
                                              items: controller.mwards!
                                                  .map((DataWards value) {
                                                return DropdownMenuItem<
                                                    DataWards>(
                                                  value: value,
                                                  child: Container(
                                                    child: Text(
                                                      value.name.toString(),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (DataWards? value) {
                                                controller.onChangeWards(
                                                    value!, value.id!);
                                              },
                                              hint: Text(ONCHANGE_WARDS),
                                            )
                                          : DropdownButton(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: MAIN_LINE,
                                              ),
                                              iconSize: 24,
                                              elevation: 16,
                                              isExpanded: true,
                                              items: [
                                                DropdownMenuItem<String>(
                                                  value: "1",
                                                  child: Center(
                                                    child: Text(NO_WARDS),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {},
                                              hint: Text(controller
                                                  .mdatas!.wards_name
                                                  .toString()),
                                            )),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 5),
                      controller.wardsValid == false
                          ? TextCustomized(
                              text: controller.wardsError.toString(),
                              color: Colors.red)
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(text: ADDRESS, weight: FontWeight.w700),
                        SizedBox(height: 5),
                        TextFieldCustomized(
                          textController: controller.addressController,
                          hint: ADDRESS,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          // textController: controller.usernameController,
                        ),
                        SizedBox(height: 5),
                        controller.addressValid == false
                            ? TextCustomized(
                                text: controller.addressError.toString(),
                                color: Colors.red)
                            : Container(),
                      ],
                    )),
                SizedBox(height: 16),
                Padding(
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
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      width: 1.0, color: Colors.grey),
                                  left: BorderSide(
                                      width: 1.0, color: Colors.grey),
                                  right: BorderSide(
                                      width: 1.0, color: Colors.grey),
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.grey),
                                ),
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
                            TextCustomized(text: CHECKBOX_ADDRESS),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      ButtonCustomized(
                        BT_CANCEL,
                        textColor: Colors.black,
                        onTap: () {
                          Get.back();
                        },
                        backgroundColor: MAIN_BT_CANCEL_ADDRESS,
                        height: 48,
                        width: 165,
                      ),
                      Spacer(),
                      ButtonCustomized(
                        BT_REGISTER,
                        onTap: () {
                          controller.onRegisterAddress();
                        },
                        backgroundColor: MAIN_BT_SAVE_ADDRESS,
                        height: 48,
                        width: 165,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ));
  }
}
