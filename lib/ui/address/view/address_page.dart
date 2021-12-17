import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/fonts.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/address/controller/address_page_controller.dart';
import 'package:viet_trung_mobile_admin/ui/address/view/add_address_page.dart';
import 'package:viet_trung_mobile_admin/ui/address/view/update_address_page.dart';
import 'package:viet_trung_mobile_admin/widget/initial_widget.dart';
import 'package:viet_trung_mobile_admin/widget/popup_del_address.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class AddressPage extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      init: AddressController(),
      builder: (value) => InitialWidget(
          titleAppBar: HD_ADDRESS,
          titleAppBarColor: Colors.white,
          backgroundAppBar: Colors.black26,
          isShowBack: true,
          // floatingActionButton:  FloatingActionButton(
          //   onPressed: () {
          //     Get.to(()=> AddAddressPage())!.then((value){
          //       if(value != null){
          //         controller.onGetAddressAll();
          //       }
          //     });
          //   },
          //   child: const Icon(
          //     Icons.add_rounded,
          //     color: Colors.black,
          //   ),
          //   backgroundColor: Colors.white,
          // ),
          iconAdd: TextButton(
            child: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => Get.to(() => AddAddressPage()),
          ),
          iconBack: TextButton(
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () => Get.back(result: true),
          ),
          child: Center(
            child: Container(
              color: MAIN_ADDRESS_GRAY,
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    _addressBody(),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _addressBody() {
    return ListView.builder(
        itemCount: controller.mdatas!.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              controller.defaultIndexAddress == index
                  ? Slidable(
                      key: const ValueKey(0),
                      // actionPane: SlidableDrawerActionPane(),
                      // actionExtentRatio: 0.17,
                      child: Container(
                          child: Container(
                        //padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(2.0),
                        ),
                        //width: 343,
                        height: Get.width * 0.3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              // TextCustomized(
                              //   text: controller.mdatas![index].name!,
                              //   weight: FontWeight.w900,
                              //   size: 16,
                              //   font: SanFranciscoTextLight,
                              // ),

                              Row(
                                children: [
                                  TextCustomized(
                                    text: controller.mdatas![index].name!,
                                    weight: FontWeight.w900,
                                    size: 16,
                                    color: Colors.black,
                                    font: SanFranciscoTextLight,
                                  ),
                                  TextCustomized(
                                    text: " [ Mặc định ]",
                                    weight: FontWeight.w900,
                                    color: Colors.red,
                                    size: 16,
                                    font: SanFranciscoTextLight,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextCustomized(
                                text: controller.mdatas![index].phone!,
                                color: Colors.black,
                                size: smallSize,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextCustomized(
                                text: controller.mdatas![index].full_address!,
                                color: Colors.black,
                                size: smallSize,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      )),
                      endActionPane: ActionPane(
                        extentRatio: 0.5,
                        motion: ScrollMotion(),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 25),
                            width: Get.width * 0.22,
                            color: BLUE2,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => UpdateAddressPage(),
                                        arguments: controller.mdatas![index])!
                                    .then((value) {
                                  if (value != null) {
                                    controller.onGetAddressAll();
                                  }
                                });
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(IC_EDIT_ADDRESS,
                                      height: 30, width: 30),
                                  SizedBox(height: 5.0),
                                  TextCustomized(
                                    text: "Sửa",
                                    color: WHITE,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //   secondaryActions: <Widget>[
                      //     IconSlideAction(
                      //       caption: 'Sửa',
                      //       color: BLUE2,
                      //        iconWidget: SvgPicture.asset(IC_EDIT_ADDRESS,height: 30, width: 30),
                      //       onTap: () {
                      //         Get.to(()=> UpdateAddressPage(), arguments: controller.mdatas![index])!.then((value){
                      //           if(value != null){
                      //             controller.onGetAddressAll();
                      //           }
                      //         });
                      //       },
                      //     ),
                      //   ],
                    )
                  : Slidable(
                      key: const ValueKey(1),
                      // actionPane: SlidableDrawerActionPane(),
                      // actionExtentRatio: 0.17,
                      child: Container(
                          child: Container(
                        //padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(2.0),
                        ),
                        //width: 343,
                        height: Get.width * 0.3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              TextCustomized(
                                text: controller.mdatas![index].name!,
                                weight: FontWeight.w900,
                                size: 16,
                                color: Colors.black,
                                font: SanFranciscoTextLight,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextCustomized(
                                text: controller.mdatas![index].phone!,
                                color: Colors.black,
                                size: smallSize,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextCustomized(
                                text: controller.mdatas![index].full_address!,
                                color: Colors.black,
                                size: smallSize,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      )),
                      endActionPane: ActionPane(
                        extentRatio: 0.5,
                        motion: ScrollMotion(),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 25),
                            width: Get.width * 0.22,
                            color: BLUE2,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => UpdateAddressPage(),
                                        arguments: controller.mdatas![index])!
                                    .then((value) {
                                  if (value != null) {
                                    controller.onGetAddressAll();
                                  }
                                });
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(IC_EDIT_ADDRESS,
                                      height: 30, width: 30),
                                  SizedBox(height: 5.0),
                                  TextCustomized(
                                    text: "Sửa",
                                    color: WHITE,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 25),
                            width: Get.width * 0.22,
                            color: MAIN_DELETE_ADDRESS,
                            child: InkWell(
                              onTap: () {
                                Get.dialog(DialogDelAddressCustomized(
                                  idAddress: controller.mdatas![index].id,
                                ));
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    IC_DELETE_ADDRESS,
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(height: 5.0),
                                  TextCustomized(
                                    text: 'Xoá',
                                    color: WHITE,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // secondaryActions: <Widget>[
                      //   IconSlideAction(
                      //     caption: 'Sửa',
                      //     color: BLUE2,
                      //     iconWidget: SvgPicture.asset(IC_EDIT_ADDRESS,height: 30, width: 30),
                      //     onTap: () {
                      //       Get.to(()=> UpdateAddressPage(), arguments: controller.mdatas![index])!.then((value){
                      //         if(value != null){
                      //           controller.onGetAddressAll();
                      //         }
                      //       });
                      //     },
                      //   ),
                      //   IconSlideAction(
                      //     caption: 'Xoá',
                      //     color: MAIN_DELETE_ADDRESS,
                      //     iconWidget: SvgPicture.asset(IC_DELETE_ADDRESS, height: 30, width: 30,),
                      //     onTap:() {
                      //       //controller.onDeleteAddress(controller.mdatas![index].id);
                      //       Get.dialog(DialogDelAddressCustomized(
                      //         idAddress: controller.mdatas![index].id,
                      //       ));

                      //     },
                      //   ) ,
                      // ],
                    ),
              SizedBox(height: 10)
            ],
          );
        });
  }
}
