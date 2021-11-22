import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/size.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/controller/manager_bag_controller.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/bag_details_page.dart';
import 'package:viet_trung_mobile/ui/admin/manager_bag/view/create_bag_page.dart';
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
        body:  SingleChildScrollView(child: buildBody()) ,
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
                TextCustomized(
                  text: MANAGE_PACKAGE_TOTAL_BAG,
                  size: normalSize,
                  color: BLACK,
                  weight: FontWeight.w700,
                  font: SanFranciscoText,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: (){},
                      child: SvgPicture.asset(IC_FILTER_ART),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              itemCount: listBag.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index ){
                return _buildListBag();
              },
              separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
              ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
  Widget _buildListBag(){
    return  Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
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
                  InkWell(
                    onTap: (){
                      Get.to(BagDeatailsPage());
                    },
                    child: TextCustomized(
                      text: '#DH0123456',
                      font: SanFranciscoText,
                      weight: FontWeight.w700,
                      color: MAIN_BLACK,
                      size: normalSize,
                      ),
                  ),
                    TextCustomized(
                    text: 'Kho Cửa Khẩu',
                    font: SanFranciscoText,
                    weight: FontWeight.w400,
                    color: BG_ID_PD,
                    ),
                ],
              ),
              SizedBox(height: 5,),
              TextCustomized(
                    text: '10:10 21/10/2021',
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
                    text: MANAGE_PACKAGE_NUMBER_PACKAGE,
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
                    text: MANAGE_PACKAGE_WARE_HOUSE_MOVE_BACK,
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
                    text: MANAGE_PACKAGE_TRANSFER_FORM,
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
                    text: MANAGE_PACKAGE_NUMBER_OF_CUSTOMER,
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
                    text: MANAGE_PACKAGE_UPDATE_DAY,
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
              SizedBox(height: 15,),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
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
          ),
          ]
        ),
    );
  }
}
