import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/list_role_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/view/add_image_enter_warehouse_page.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/create_bag_page.dart';
import 'package:viet_trung_mobile/ui/admin/manager_staff/controller/edit_staff_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class EditStaffPage extends GetView<EditStaffController> {
  BuildContext? mContext;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<EditStaffController>(
      init: EditStaffController(),
      builder: (value) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(),
        body:  controller.detailStaffResponse != null ? SingleChildScrollView(child: buildBody()) : LoadingSpinKit(),
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
          text: PROFILE_CHANGE_INFORMATION,
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
              //textController: controller.name,
              //errorText: ,
              hint: controller.detailStaffResponse!.data!.user_code.toString(),    
            ),
            TextCustomized(
              text: NAME,
              font: SanFranciscoText,
              weight: FontWeight.w400,
              color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              //textController: controller.name,
              //errorText: ,
              hint:  controller.detailStaffResponse!.data!.name.toString(),    
            ),
            TextCustomized(
              text: PHONE,
              font: SanFranciscoText,
              weight: FontWeight.w400,
              color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              //textController: controller.name,
              //errorText: ,
              hint:  controller.detailStaffResponse!.data!.phone.toString(),    
            ),
            TextCustomized(
              text: email,
              font: SanFranciscoText,
              weight: FontWeight.w400,
              color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            TextFieldCustomized(
              //textController: controller.name,
              //errorText: ,
              hint:  controller.detailStaffResponse!.data!.email.toString(),   
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
                  hint:  controller.detailStaffResponse!.data!.role_name.toString(),
                  onChanged:( data ){
                    print('${controller.role_id}');
                    controller.role_id = data!.id!;
                    controller.update();
                    },
                  itemAsString: (DataRole u) => u.name!,
                  dropdownButtonBuilder: (_)=> Container(
                    padding: EdgeInsets.all(10.0),
                    child: SvgPicture.asset(IC_ARROW_DOWN,color: GRAY,),
                  ),
                  popupShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),                
                      ),
                  popupItemBuilder: _customDropdown,
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
            TextCustomized(
              text: "Avatar",
              font: SanFranciscoText,
              weight: FontWeight.w400,
              color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            //AddImageEnterWarehouse(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustomized(
                  text: "Trạng thái",
                  font: SanFranciscoText,
                  weight: FontWeight.w400,
                  color: MAIN_BLACK,
                ),
                Wrap(
                  spacing: 5.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TextCustomized(
                    text: controller.detailStaffResponse!.data!.status == 1 ?'Đang họat động' : 'Không hoạt động',
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: MAIN_BLACK,
                    ),
                     Container(
                        padding: EdgeInsets.only(top: 5),
                        child: CupertinoSwitch(
                           dragStartBehavior: DragStartBehavior.start,
                            //value: controller.detailStaffResponse!.data!.status == 1 ? true: false,
                            value: controller.isStatus,
                            onChanged: (bool value) {
                              controller.onGetStatusStaff(value);
                            },
                            ),
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            ButtonCustomized(
              save,
              backgroundColor: BT_CONFIRM,
              textColor: WHITE,
            ),
            SizedBox(height: 15),
            ButtonCustomized(
              "Xóa Nhân viên",
              backgroundColor: WHITE,
              textColor: RED_1,
              borderColor: BT_GRAY,
            ),
          ],
        ),
      ),
    );
  }
   Widget _customDropdown (BuildContext context, DataRole item, bool isSelected){
   return Container(
     padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: GRAY, width: 1.0 )),
              //borderRadius: BorderRadius.circular(5),
              //color: bdredColor,
            ),
           child: InkWell(
             onTap: (){},
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Flexible(
                 child: TextCustomized(
                   text: item.name?.toString()??'',
                   font: SanFranciscoUIText,
                   weight: FontWeight.w400,
                   )
                   ),
              //  Flexible(
              //    child: SvgPicture.asset(IC_CHECK1),
              //    )
            ],
          )),
    );
  }
}