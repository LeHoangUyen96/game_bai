import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/inventory_management/view/add_image_enter_warehouse_page.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/create_bag_page.dart';
import 'package:viet_trung_mobile/ui/admin/manager_staff/controller/create_staff_controller.dart';
import 'package:viet_trung_mobile/ui/admin/manager_staff/controller/edit_staff_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

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
              hint: 'nguyenvanaDNa',    
            ),
            SizedBox(height: 15,),
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
              hint: 'Nguyễn Văn A',    
            ),
            SizedBox(height: 15,),
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
              hint: '0979419599',    
            ),
            SizedBox(height: 15,),
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
              hint: 'email@gmail.com',    
            ),
            SizedBox(height: 15,),
            TextCustomized(
            text: "Phân quyền",
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            Container(
                child: DropdownSearch<DataBagType>(
                  mode: Mode.MENU,
                  maxHeight: 80,
                  popupSafeArea: PopupSafeArea(),
                  items: [
                    DataBagType(codeBagType: "graft_bag", nameBagType: "Bao ghép"),
                    DataBagType(codeBagType: "intact_bag", nameBagType: "Bao nguyên"),
                  ],
                  //onFind: (String? filter) => getData(filter),
                  hint: "Phân quyền",
                  onChanged:( data ){
                    // print('${controller.typeBag}');
                    // controller.typeBag = data!.codeBagType!;
                    controller.update();
                    },
                  itemAsString: (DataBagType u) => u.nameBagType!,
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
              SizedBox(height: 15,),
            TextCustomized(
            text: "Avatar",
            font: SanFranciscoText,
            weight: FontWeight.w400,
            color: MAIN_BLACK,
            ),
            SizedBox(height: 5),
            AddImageEnterWarehouse(),
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
                    text: "Đang hoạt động",
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: MAIN_BLACK,
                    ),
                    CupertinoSwitch(
                      dragStartBehavior: DragStartBehavior.start,
                      //value: controller.detailStaffResponse!.data!.status == 1 ? true: false,
                      value: true,
                      onChanged: (bool value) {},
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
   Widget _customDropdown (BuildContext context, DataBagType item, bool isSelected){
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
                   text: item.nameBagType?.toString()??'',
                   font: SanFranciscoUIText,
                   weight: FontWeight.w400,
                   )
                   ),
              //  Flexible(
              //    child: SvgPicture.asset(IC_CHECK1),
              //    )    
             ],
           )

      ), 

   );
 }
}  