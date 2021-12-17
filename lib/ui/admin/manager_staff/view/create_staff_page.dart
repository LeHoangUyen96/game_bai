import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/response/list_role_response.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/size.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/inventory_management/view/add_image_enter_warehouse_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_bag/view/create_bag_page.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_staff/controller/create_staff_controller.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_staff/controller/edit_staff_controller.dart';
import 'package:viet_trung_mobile_admin/widget/button_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';
import 'package:viet_trung_mobile_admin/widget/text_field_customized.dart';

class CreateStaffPage extends GetView<CreateStaffController> {
  BuildContext? mContext;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<CreateStaffController>(
      init: CreateStaffController(),
      builder: (value) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(),
        body: SingleChildScrollView(child: buildBody()),
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(mContext!).requestFocus(FocusNode());
      },
      child: Container(
        color: WHITE,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustomized(
              text: ID_STAFF,
              font: SanFranciscoText,
              weight: FontWeight.w400,
              color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.userCodeController,
              errorText:
                  !controller.isUserCodeValid ? controller.userCodeError : null,
              hint: 'Nhập mã nhân viên',
            ),
            controller.isUserCodeValid == false
                ? TextCustomized(
                    text: controller.userCodeError,
                    font: SanFranciscoText,
                    size: 12,
                    weight: FontWeight.w400,
                    color: RED,
                  )
                : Container(),
            SizedBox(
              height: 15,
            ),
            TextCustomized(
              text: NAME,
              font: SanFranciscoText,
              weight: FontWeight.w400,
              color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.nameController,
              errorText: !controller.isNameValid ? controller.nameError : null,
              hint: NAME,
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
            SizedBox(
              height: 15,
            ),
            TextCustomized(
              text: PHONE,
              font: SanFranciscoText,
              weight: FontWeight.w400,
              color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.phoneController,
              errorText:
                  !controller.isPhoneValid ? controller.phoneError : null,
              hint: PHONE,
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
            SizedBox(
              height: 15,
            ),
            TextCustomized(
              text: email,
              font: SanFranciscoText,
              weight: FontWeight.w400,
              color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              textController: controller.emailController,
              errorText:
                  !controller.isEmailValid ? controller.emailError : null,
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
            SizedBox(
              height: 15,
            ),
            TextCustomized(
              text: "Phân quyền",
              font: SanFranciscoText,
              weight: FontWeight.w400,
              color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            Container(
              child: DropdownSearch<DataRole>(
                mode: Mode.MENU,
                maxHeight: 120,
                popupSafeArea: PopupSafeArea(),
                onFind: (String? filter) => controller.onGetListRole(),
                hint: "Phân quyền",
                onChanged: (data) {
                  print('${controller.role_id}');
                  controller.role_id = data!.id!;
                  controller.update();
                },
                itemAsString: (DataRole u) => u.name!,
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
            SizedBox(
              height: 15,
            ),
            // TextCustomized(
            // text: "Avatar",
            // font: SanFranciscoText,
            // weight: FontWeight.w400,
            // color: MAIN_BLACK,
            // ),
            // SizedBox(height: 5),
            // AddImageEnterWarehouse(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     TextCustomized(
            //     text: "Trạng thái",
            //     font: SanFranciscoText,
            //     weight: FontWeight.w400,
            //     color: MAIN_BLACK,
            //     ),
            //     Wrap(
            //       spacing: 5.0,
            //       crossAxisAlignment: WrapCrossAlignment.center,
            //       children: [
            //         TextCustomized(
            //         text: "Đang hoạt động",
            //         font: SanFranciscoText,
            //         weight: FontWeight.w400,
            //         color: MAIN_BLACK,
            //         ),
            //         CupertinoSwitch(
            //           dragStartBehavior: DragStartBehavior.start,
            //           //value: controller.detailStaffResponse!.data!.status == 1 ? true: false,
            //           value: true,
            //           onChanged: (bool value) {},
            //           ),
            //       ],
            //     ),
            //   ],
            // ),
            SizedBox(height: 25),
            ButtonCustomized(
              save,
              onTap: () {
                controller.onCreateAdmin();
              },
              backgroundColor: BT_CONFIRM,
              textColor: WHITE,
            ),
            SizedBox(height: 15),
            ButtonCustomized(
              cancel,
              onTap: () {
                Get.back();
              },
              backgroundColor: WHITE,
              textColor: RED_1,
              borderColor: BT_GRAY,
            ),
          ],
        ),
      ),
    );
  }

  Widget _customDropdown(BuildContext context, DataRole item, bool isSelected) {
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
