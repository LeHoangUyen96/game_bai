import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/city_response.dart';
import 'package:viet_trung_mobile/data/response/district_response.dart';
import 'package:viet_trung_mobile/data/response/wards_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_user/controller/create_user_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class CreateUserPage extends GetView<CreateUserController> {
  BuildContext? mContext;
  
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<CreateUserController>(
      init: CreateUserController(),
      builder: (value) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(),
        body:   SingleChildScrollView(child: buildBody()),
        backgroundColor: WHITE,
      ),
    );
  }
  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: sizeHeader,
      child: AppBar(
        //centerTitle: true,
        title: TextCustomized(
          text: ADD_NEW,
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
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: WHITE,),
        ),
        
      ),
    );
  }
  Widget buildBody(){
    return GestureDetector(
      onTap: () {
        FocusScope.of(mContext!).requestFocus(FocusNode());
      },
      child:  Container(
        padding: EdgeInsets.all(15),
        color: WHITE,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustomized(
            text: customerName,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.nameController,
              errorText: !controller.isNameValid
                                      ? controller.nameError
                                      : null,
              hint: 'Nhập tên khách hàng',    
            ),
             controller.isNameValid == false
                  ? TextCustomized(
                text: controller.nameError,
                font: SanFranciscoText,
                size: 12,
                weight: FontWeight.w400,
                color: RED,
              )
                  : Container(),
            SizedBox(height: 15,),
            TextCustomized(
            text: PHONE,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.phoneController,
              errorText: !controller.isPhoneValid
                                      ? controller.phoneError
                                      : null,
              hint: 'Nhập số điện thoại',    
            ),
             controller.isPhoneValid == false
                  ? TextCustomized(
                text: controller.phoneError,
                font: SanFranciscoText,
                size: 12,
                weight: FontWeight.w400,
                color: RED,
              )
                  : Container(),
            SizedBox(height: 15,),
            TextCustomized(
            text: email,
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.emailController,
              errorText: !controller.isEmailValid
                                      ? controller.emailError
                                      : null,
              hint: 'Nhập Email',    
            ),
             controller.isEmailValid == false
                  ? TextCustomized(
                text: controller.emailError,
                font: SanFranciscoText,
                size: 12,
                weight: FontWeight.w400,
                color: RED,
              )
                  : Container(),
            SizedBox(height: 15,),
            Container(
                  //padding: EdgeInsets.symmetric(horizontal: 16),
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
                                    hint: Text(ONCHANGE_CITY),
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
                                    hint: Text(ONCHANGE_CITY),
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
                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 16),
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
                                              hint: Text(ONCHANGE_DISTRICT),
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
                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustomized(text: WARDS, weight: FontWeight.w700),
                      SizedBox(height: 5),
                      Container(
                        width: Get.width,
                        //padding: EdgeInsets.symmetric(horizontal: 16),
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
                                            value:
                                                controller.selectedWards != null
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
                                            hint: Text(ONCHANGE_WARDS),
                                          )),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                Container(
                    //padding: EdgeInsets.symmetric(horizontal: 16),
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
                ButtonCustomized(
                  save,
                  onTap: (){
                    controller.onCreateUser();
                  },
                  textColor: WHITE,
                  backgroundColor: BT_CONFIRM,
                ),
                SizedBox(height: 10),    
                ButtonCustomized(
                  cancel,
                  onTap: (){
                    Get.back();
                  },
                  textColor: GRAY1,
                  backgroundColor: WHITE,
                  borderColor: BT_GRAY,
                ),
          ],
        ),
      ),
    );
  }
}  