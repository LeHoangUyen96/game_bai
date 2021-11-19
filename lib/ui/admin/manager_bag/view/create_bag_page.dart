import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/response/list_warehouse_back_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/create_bag_controller.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class CreateBagPage extends GetView<CreateBagController> {
  BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<CreateBagController>(
      init: CreateBagController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body:  SingleChildScrollView(child: buildBody()) ,
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
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: WHITE,),
        ),
      ),
    );
  }
  Widget buildBody(){
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                onChanged:( data ){
                  print('$data');
                  controller.item_code = data!.status_code!;
                  controller.update();
                  },
                itemAsString: (DataListWareHouseBackResponse u) => u.status_name!,
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
        ],
      ),
    );
  }
  Widget _customDropdown (BuildContext context, DataListWareHouseBackResponse item, bool isSelected){
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
             //mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Flexible(
                 child: TextCustomized(
                   text: item.status_name?.toString()??'',
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