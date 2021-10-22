import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/address/controller/address_page_controller.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class AddressPage extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      init: AddressController(),
      builder: (value) => InitialWidget(
          titleAppBar: HD_ADDRESS,
          titleAppBarColor: Colors.black,
          backgroundAppBar: Colors.white,
          statusBarColor: Colors.black,
          isShowBack: true,
          iconBack: TextButton(
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () => Get.back(result: true),
          ),
          iconAdd: TextButton(
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              // Get.to(() => AddAddressPage(), opaque: false, fullscreenDialog: false)!.then((value) {
              //   if (value == null) {
              //     controller.onGetAddressAll();
              //   }
              // });
            },
          ),
          child: Center(
            child: Container(
              color: Colors.grey.shade300,
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    _addressBody(),
                    // controller.mdatas!.length > 0
                    //     ?_addressBody()
                    //     : Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                    //   child: Column(
                    //     children: [
                    //       SizedBox(height: 50),
                    //       Center(
                    //         child: Column(
                    //           children: [
                    //             SvgPicture.asset(
                    //               IC_SAD,
                    //               height: 60,
                    //               width: 60,
                    //               color: TEXT_GREY_ON_BG_WHITE,
                    //             ),
                    //             SizedBox(height: 20),
                    //             TextCustomized(text:ADDRESS_NULL_1),
                    //             TextCustomized(text:ADDRESS_NULL_2),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }

  Widget _addressBody(){
    return ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.17,
                child: Container(
                  color: Colors.white,
                  child: InkWell(
                      onTap: () {
                        // controller.onChangeAddress(index);
                      },
                      child: Container(
                          child: Container(
                            //padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // borderRadius: BorderRadius.circular(2.0),
                            ),
                            //width: 343,
                            height: 110,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextCustomized(
                                    text: "Lê Thanh Toàn",
                                    weight: FontWeight.w900,
                                    size: 16,
                                    font: SanFranciscoTextLight,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     Expanded(
                                  //       flex: 6,
                                  //       child: TextCustomized(
                                  //         text: "Lê Thanh Toàn",
                                  //         weight: FontWeight.w900,
                                  //         size: 16,
                                  //         font: SanFranciscoText,
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextCustomized(
                                    text: "0937.123.123",
                                    color: Colors.black,
                                    size: smallSize,
                                  ),
                                  // Expanded(
                                  //   flex: 5,
                                  //   child: TextCustomized(
                                  //     text: "0937.123.123",
                                  //     color: Colors.black,
                                  //     size: smallSize,
                                  //   ),
                                  // ),
                                  TextCustomized(
                                    text: "320 Hoàng Diệu, Phường Bình Hiên, Quận Hải Châu, thành phố Đà Nẵng",
                                    color: Colors.black,
                                    size: smallSize,
                                  ),
                                  // Expanded(
                                  //   flex: 5,
                                  //   child: TextCustomized(
                                  //     text: "320 Hoàng Diệu, Phường Bình Hiên, Quận Hải Châu, thành phố Đà Nẵng",
                                  //     color: Colors.black,
                                  //     size: smallSize,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          )
                      )),
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Sửa',
                    color: Colors.black45,
                    iconWidget: SvgPicture.asset(IC_UPDATE_ADDRESS,height: 30, width: 30),
                    onTap: () {},
                  ),
                  IconSlideAction(
                    caption: 'Xoá',
                    color: Colors.red,
                    iconWidget: SvgPicture.asset(IC_DELETE_ADDRESS, height: 30, width: 30,),
                    onTap:() {},
                  ),
                ],
              ),
              // InkWell(
              //     onTap: () {
              //       // controller.onChangeAddress(index);
              //     },
              //     child: Container(
              //       child: Container(
              //         //padding: EdgeInsets.all(16),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //          // borderRadius: BorderRadius.circular(2.0),
              //         ),
              //         //width: 343,
              //         height: 110,
              //         child: Container(
              //           padding: EdgeInsets.symmetric(horizontal: 16),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               SizedBox(
              //                 height: 10,
              //               ),
              //               TextCustomized(
              //                 text: "Lê Thanh Toàn",
              //                 weight: FontWeight.w900,
              //                 size: 16,
              //                 font: SanFranciscoTextLight,
              //               ),
              //               // Row(
              //               //   mainAxisAlignment: MainAxisAlignment.start,
              //               //   children: [
              //               //     Expanded(
              //               //       flex: 6,
              //               //       child: TextCustomized(
              //               //         text: "Lê Thanh Toàn",
              //               //         weight: FontWeight.w900,
              //               //         size: 16,
              //               //         font: SanFranciscoText,
              //               //       ),
              //               //     )
              //               //   ],
              //               // ),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //               TextCustomized(
              //                 text: "0937.123.123",
              //                 color: Colors.black,
              //                 size: smallSize,
              //               ),
              //               // Expanded(
              //               //   flex: 5,
              //               //   child: TextCustomized(
              //               //     text: "0937.123.123",
              //               //     color: Colors.black,
              //               //     size: smallSize,
              //               //   ),
              //               // ),
              //               TextCustomized(
              //                 text: "320 Hoàng Diệu, Phường Bình Hiên, Quận Hải Châu, thành phố Đà Nẵng",
              //                 color: Colors.black,
              //                 size: smallSize,
              //               ),
              //               // Expanded(
              //               //   flex: 5,
              //               //   child: TextCustomized(
              //               //     text: "320 Hoàng Diệu, Phường Bình Hiên, Quận Hải Châu, thành phố Đà Nẵng",
              //               //     color: Colors.black,
              //               //     size: smallSize,
              //               //   ),
              //               // ),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //     )),
              SizedBox(height: 10)
            ],
          );
        });


  }

  Widget _buildBottom(){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        child: ButtonCustomized(
          BT_NEXT,
          onTap: () {
            print('continue on pressed');
          },
          backgroundColor: Colors.black,
        )
    );
  }
}