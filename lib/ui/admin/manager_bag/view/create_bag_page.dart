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
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/find_user_bag.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/list_order_add_bag_page.dart';
import 'package:viet_trung_mobile/ui/order_management/order_ownerless/view/search_widget.dart';
import 'package:viet_trung_mobile/widget/add_product_dialog.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class CreateBagPage extends GetView<CreateBagController> {
  BuildContext? mContext;
  List listBill = [{},{},{},{}];
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<CreateBagController>(
      init: CreateBagController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        body:  SingleChildScrollView(
          child: buildBody(),
          physics: BouncingScrollPhysics(),
          ) ,
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(Get.context!).requestFocus(FocusNode());
      },
      child:  
      Container(
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
                child: DropdownSearch<DataBagType>(
                  mode: Mode.MENU,
                  maxHeight: 80,
                  popupSafeArea: PopupSafeArea(),
                  items: [
                    DataBagType(codeBagType: "graft_bag", nameBagType: "Bao ghép"),
                    DataBagType(codeBagType: "intact_bag", nameBagType: "Bao nguyên"),
                  ],
                  //onFind: (String? filter) => getData(filter),
                  hint: "Chọn kiểu bao",
                  onChanged:( data ){
                    print('${controller.typeBag}');
                    controller.typeBag = data!.codeBagType!;
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
              SizedBox(height: 15),
              controller.typeBag == 'intact_bag' 
               ?Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     TextCustomized(
                      text: customer,
                      font: SanFranciscoUIText,
                      size: normalSize,
                      weight: FontWeight.w600,
                      color: BLACK_1,
                      ),
                      SizedBox(height: 15),
                      SearchTextFieldUser(searchController: controller.searchController),
                   ],
                 ),
               )
               :Container(), 
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
                  onChanged:( data ){
                    print('$data');
                    controller.warehouse_back_code = data!.status_code!;
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
                  popupItemBuilder: _customDropdownWareHouseBack,
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
                  onChanged:( data ){
                    print('$data');
                    controller.transport_form_id = data!.id!;
                    controller.update();
                    },
                  itemAsString: (DataListTransportFormResponse u) => u.name!,
                  dropdownButtonBuilder: (_)=> Container(
                    padding: EdgeInsets.all(10.0),
                    child: SvgPicture.asset(IC_ARROW_DOWN,color: GRAY,),
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
                  onChanged:( data ){
                    print('$data');
                    controller.packing_from = data!.name!;
                    controller.update();
                    },
                  itemAsString: (DataListPackingFormFormResponse u) => u.name!,
                  dropdownButtonBuilder: (_)=> Container(
                    padding: EdgeInsets.all(10.0),
                    child: SvgPicture.asset(IC_ARROW_DOWN,color: GRAY,),
                  ),
                  popupShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),                
                      ),
                  popupItemBuilder: _customDropdownPackingForm,
                  ),
              ),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Expanded(
                  flex: 2,
                  //width: Get.width*0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustomized(
                        text: MANAGE_PACKAGE_WEIGHT,
                        font: SanFranciscoUIText,
                        size: normalSize,
                        weight: FontWeight.w600,
                        color: BLACK_1,
                        ),
                        SizedBox(height: 5,),
                        Container(
                          //width: Get.width*0.4,
                          child: TextFieldCustomized(
                            hint: "Nhập số cân",
                          ),
                        )
                    ]
                  )
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  //width: Get.width*0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustomized(
                        text: ORDER_LIST_PARCELS,
                        font: SanFranciscoUIText,
                        size: normalSize,
                        weight: FontWeight.w600,
                        color: BLACK_1,
                        ),
                        SizedBox(height: 5,),
                        Container(
                          //width: Get.width*0.5,
                          child: TextFieldCustomized(
                            hint: ORDER_LIST_NULL,
                          ),
                        )
                    ]
                  )
                ),
                ]
              ),
              SizedBox(height: 15),
              TextCustomized(
                  text: MANAGE_PACKAGE_TOTAL_COD,
                  font: SanFranciscoUIText,
                  size: normalSize,
                  weight: FontWeight.w600,
                  color: BLACK_1,
                  ),
              SizedBox(height: 5),
              TextFieldCustomized(
                hint: ORDER_LIST_NULL,
              ),
              SizedBox(height: 15),
              Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BT_GRAY
                  ),
                )
              ),
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
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: (){controller.onChange(1);},
                                child: controller.changeBill == true
                                    ? Icon(
                                    Icons.keyboard_arrow_up
                                     )
                                    : Icon(
                                    Icons.keyboard_arrow_down
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              )
            ),
            SizedBox(height: 10,),
            controller.changeBill == true 
              ? Container(
                child: ListView.separated(
                  itemCount: listBill.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return _buildListBill();
                  }
                  )
              )
              : Container(),
              SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                   Get.dialog(AddProductToBagDialog(), 
                   arguments: {
                     "warehouse_back_code" : controller.warehouse_back_code,
                     "transport_form_id" : controller.transport_form_id,
                   });
                },
                child: Wrap(
                  spacing: 5.0,
                  children: [
                    SvgPicture.asset(IC_ADD_CIRCLE, color: GRAY8,),
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
    );
  }
   Widget _buildListBill(){
    return  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
             Container(
               padding: EdgeInsets.only(top: 5,bottom: 10),
               decoration: BoxDecoration(
                 border: Border(
                   bottom: BorderSide(color: BT_GRAY)
                 )
               ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      onTap: (){},
                      child: TextCustomized(
                      text: 'Xoá',
                      font: SanFranciscoText,
                      weight: FontWeight.w400,
                      color: RED_1,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 5,),     
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
               SizedBox(height: 5,),     
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustomized(
                    text: DELIVERY_PACKAGE,
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
              SizedBox(height: 5,),     
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
              SizedBox(height: 5,),     
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
              SizedBox(height: 5,),     
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
                ]
              ),
             )
          ]
        )
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
 Widget _customDropdownWareHouseBack (BuildContext context, DataListWareHouseBackResponse item, bool isSelected){
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
  Widget _customDropdownTransportForm (BuildContext context, DataListTransportFormResponse item, bool isSelected){
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
           )

      ), 

   );
 }
  Widget _customDropdownPackingForm (BuildContext context, DataListPackingFormFormResponse item, bool isSelected){
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
           )

      ), 

   );
 }
}

class DataBagType {
  String? codeBagType;
  String? nameBagType;
  DataBagType({
   required this.codeBagType,
   required this.nameBagType
    });
}
List<DataBagType> dataBagType = <DataBagType>[
  DataBagType(codeBagType: "graft_bag", nameBagType: "Bao ghép"),
  DataBagType(codeBagType: "intact_bag", nameBagType: "Bao nguyên"),
  
];