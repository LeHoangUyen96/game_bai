import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/response/list_bag_resoonse.dart';
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
import 'package:viet_trung_mobile/widget/datepicker_customized.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class ManagerBagPage extends GetView<ManagerBagController> {
  BuildContext? mContext;
  List listBag = [{},{},{},{}];
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return GetBuilder<ManagerBagController>(
      init: ManagerBagController(),
      builder: (value) => Scaffold(
        appBar: buildAppBar(),
        //body:  SingleChildScrollView(child: buildBody()) ,
        body: controller.mListBagResponse != null ? buildBody() : LoadingSpinKit(),
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
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: WHITE,),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(CreateBagPage());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
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
  Widget buildBody(){
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
                      border: Border.all(color:GRAY ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IC_SEARCH, width: Get.width*0.1-20, ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText: MANAGE_PACKAGE_SEARCH_BAG,
                                hintStyle: TextStyle(
                                  color: GRAY,
                                  fontFamily: SanFranciscoUIText
                                ),
                              ),
                            ),
                      ),
                    ],
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
                Wrap(
                  spacing: 5.0,
                  children: [ 
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
                  ]
                ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: (){
                        controller.onCheckFilter();
                        },
                      child: SvgPicture.asset(IC_FILTER_ART),
                    ),
                  ),

              ],
            ),
          ),
          controller.checkFilter == true ?
            Container(
              color: Colors.white,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                              padding: EdgeInsets.only(right: 5),
                              child: DatepickerCustomized()
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          flex: 5,
                          child:  Container(
                            padding: EdgeInsets.only(left: 5),
                              child: DatepickerCustomized()
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        TextCustomized(text: "Huỷ",),
                        Spacer(),
                        TextCustomized(text: "Xác nhận",),
                      ],
                    ),
                    // Container(
                    //   height: 200,
                    //   child: CupertinoDatePicker(
                    //       mode: CupertinoDatePickerMode.date,
                    //       onDateTimeChanged: (dateTime) {
                    //       }
                    //   ),
                    // ),
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
                          itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                          dividerColor: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      child: ButtonCustomized(
                        AUTH_CONFIRM,
                        textColor: Colors.white,
                        backgroundColor: BT_CONFIRM,
                        onTap: () {Get.back();},
                      ),

                    ),
                    SizedBox(height: 15),
                    Container(
                      child: ButtonCustomized(
                        WALLET_DEPOSIT_BTN_CANCEL,
                        textColor: Colors.black ,
                        backgroundColor: Colors.white,
                        borderColor: MAIN_BT_SAVE_ADDRESS,
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              )
            )
            : Container(),
          SizedBox(height: 15),
           Expanded(
             child: Container(
                height: Get.height*0.8,
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
                    itemCount:  controller.mDataBagResponse!.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index ){
                      return _buildListBag(controller.mListBagResponse!.data![index]);
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
  Widget _buildListBag(DataBagResponse mData){
    final Color color;
    color = controller.ColorStatusName(mData.parent_pack_status_name.toString());
    return  Container(
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
          color: WHITE
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
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
                      onTap: (){
                        Get.to(BagDeatailsPage());
                      },
                      child:TextCustomized(
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
              SizedBox(height: 5,),
              TextCustomized(
                    text: mData.created_at.toString(),
                    font: SanFranciscoTextLight,
                    weight: FontWeight.w400,
                    color: MAIN_GRAY,
                    ),
               SizedBox(height: 5,),     
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
               SizedBox(height: 5,),     
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
              SizedBox(height: 5,),     
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
              SizedBox(height: 5,),     
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
              SizedBox(height: 5,),     
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
              SizedBox(height: 5,),     
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
              SizedBox(height: 15,),
              ],
            ),
          ),
          //SizedBox(height: 15),
          mData.parent_pack_status_name ==  ORDER_LIST_CHINA_WAREHOUSE ?
          Container(
            padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: BT_GRAY)
              )
            ),
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){},
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
          ) : Container(),
          ]
        ),
    );
  }
}
