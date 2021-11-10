import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/fonts.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/sizes.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/address/controller/address_page_controller.dart';
import 'package:viet_trung_mobile/ui/address/view/add_address_page.dart';
import 'package:viet_trung_mobile/ui/address/view/update_address_page.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/initial_widget.dart';
import 'package:viet_trung_mobile/widget/popup_packing_order.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class ConfirmOrderPage extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (value) =>InitialWidget(
            titleAppBar: ORDER_HEADER_DETAILS,
            titleAppBarColor: Colors.white,
            backgroundAppBar: Colors.black26,
            isCenterTitle: false,
            isShowBack: true,
            iconBack: TextButton(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: COLOR_ORDER_PENDING_DEPOSIT,
              ),
              onPressed: () => Get.back(result: true),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: MAIN_BG,
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
                    _bodyInfo(),
                    SizedBox(height: 10),
                    TextCustomized(text: "Đơn hàng mã #211003TODWE4MD đã về Kho Trung Quốc. Vui lòng xác nhận và chọn 1 trong 2 phương án sau:"),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: 1,
                                activeColor: Colors.black,
                                onChanged: (value){}
                            ),
                            Text("Đóng gói gửi hàng về"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: 0,
                                activeColor: Colors.black,
                                onChanged: (value){}
                            ),
                            Text("Lưu kho"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10
                    ),
                    _bodySelectedForm(),
                    SizedBox(
                        height: 25
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ButtonCustomized(
                        "Xác nhận",
                        textColor: Colors.white,
                        backgroundColor: BT_CONFIRM,
                        onTap: (){
                          Get.dialog(PackingOrderWidget());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
        )

    );
  }



  Widget _bodyInfo(){
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      color:  BLACK ,
      borderType: BorderType.Rect,
      padding: EdgeInsets.all(1),
      // corner: FDottedLineCorner.all(6.0),
      // strokeWidth: 1.0,
      // dottedLength: 6.0,
      // space: 8.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: Get.height*0.23,
        width: Get.width,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(text: "211003TODWE4MD", size: 14,),
                        SizedBox(height: 10),
                        TextCustomized(text: "10:10 21/10/2021", size: 10,)
                      ],
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(text: "Kho Trung Quoc", size: 14)
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(text: "Số kiện hàng", size: 14)
                      ],
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(text: "10", size: 14)
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(text: "Mặt hàng", size: 14)
                      ],
                    )
                ),
                Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(text: "Máy phun khử khuẩn", size: 14)
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(text: "Hình thức đóng gói", size: 14)
                      ],
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(text: "Xốp + gỗ", size: 14)
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustomized(text: "Thu hộ phí vận chuyển (COD):", size: 14)
                      ],
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCustomized(text: "¥269.00", size: 14)
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }

  Widget _bodySelectedForm(){
    return Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustomized(text: "Ghi chú", weight: FontWeight.w700),
              SizedBox(height: 5),
              TextFieldCustomized(
                //textController: controller.nameController,
                hint: NAME,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                // textController: controller.usernameController,
              ),
              SizedBox(height: 5),
              // controller.nameValid == false
              //     ? TextCustomized(text: controller.nameError.toString(), color: Colors.red,)
              //     : Container(),
            ],
          ),
          SizedBox(height: 16),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustomized(text: "Hình thức giao hàng", weight: FontWeight.w700),
            SizedBox(height: 5),
            Container(
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0,color: MAIN_LINE),
                    borderRadius: BorderRadius.circular(9),
                  color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              items: [
                                DropdownMenuItem<String>(
                                  value: "1",
                                  child: Center(
                                    child: Text("Chưa có hình thức giao hàng"),
                                  ),
                                ),
                              ],
                              onChanged: (value){},
                              hint: Text("Chọn hình thức giao hàng"),
                            )

                          // controller.mcity != null
                          //     ? DropdownButton(
                          //   value: controller.selectedCity != null ? controller.selectedCity : null,
                          //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                          //   iconSize: 24,
                          //   elevation: 16,
                          //   isExpanded: true,
                          //   items: controller.mcity!.map((DataCity value){
                          //     return DropdownMenuItem<DataCity>(
                          //       value: value,
                          //       child: Container(
                          //         child: Text(
                          //           value.name.toString(),
                          //         ),
                          //       ),
                          //     );
                          //   }).toList(),
                          //   onChanged: (DataCity? value){
                          //     controller.onChangeCity(value!, value.id!);
                          //   },
                          //   hint: Text(ONCHANGE_CITY),
                          // )
                          //     : DropdownButton(
                          //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                          //   iconSize: 24,
                          //   elevation: 16,
                          //   isExpanded: true,
                          //   items: [
                          //     DropdownMenuItem<String>(
                          //       value: "1",
                          //       child: Center(
                          //         child: Text(NO_CITY),
                          //       ),
                          //     ),
                          //   ],
                          //   onChanged: (value){},
                          //   hint: Text(ONCHANGE_CITY),
                          // )
                        ),
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(height: 5),
            // controller.cityValid == false
            //     ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
            //     : Container(),
          ],
        ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustomized(text: "Địa chỉ nhận hàng", weight: FontWeight.w700),
              SizedBox(height: 5),
              Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0,color: MAIN_LINE),
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                                iconSize: 24,
                                elevation: 16,
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem<String>(
                                    value: "1",
                                    child: Center(
                                      child: Text("Chưa có địa chỉ nhận hàng"),
                                    ),
                                  ),
                                ],
                                onChanged: (value){},
                                hint: Text("Chọn địa chỉ nhận hàng"),
                              )

                            // controller.mcity != null
                            //     ? DropdownButton(
                            //   value: controller.selectedCity != null ? controller.selectedCity : null,
                            //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                            //   iconSize: 24,
                            //   elevation: 16,
                            //   isExpanded: true,
                            //   items: controller.mcity!.map((DataCity value){
                            //     return DropdownMenuItem<DataCity>(
                            //       value: value,
                            //       child: Container(
                            //         child: Text(
                            //           value.name.toString(),
                            //         ),
                            //       ),
                            //     );
                            //   }).toList(),
                            //   onChanged: (DataCity? value){
                            //     controller.onChangeCity(value!, value.id!);
                            //   },
                            //   hint: Text(ONCHANGE_CITY),
                            // )
                            //     : DropdownButton(
                            //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
                            //   iconSize: 24,
                            //   elevation: 16,
                            //   isExpanded: true,
                            //   items: [
                            //     DropdownMenuItem<String>(
                            //       value: "1",
                            //       child: Center(
                            //         child: Text(NO_CITY),
                            //       ),
                            //     ),
                            //   ],
                            //   onChanged: (value){},
                            //   hint: Text(ONCHANGE_CITY),
                            // )
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: 5),
              // controller.cityValid == false
              //     ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
              //     : Container(),
            ],
          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     TextCustomized(text: "Kho hàng", weight: FontWeight.w700),
          //     SizedBox(height: 5),
          //     Container(
          //         width: Get.width,
          //         decoration: BoxDecoration(
          //             border: Border.all(width: 1.0,color: MAIN_LINE),
          //             borderRadius: BorderRadius.circular(9),
          //             color: Colors.white
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Expanded(
          //               child: DropdownButtonHideUnderline(
          //                 child: ButtonTheme(
          //                     alignedDropdown: true,
          //                     child: DropdownButton(
          //                       icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
          //                       iconSize: 24,
          //                       elevation: 16,
          //                       isExpanded: true,
          //                       items: [
          //                         DropdownMenuItem<String>(
          //                           value: "1",
          //                           child: Center(
          //                             child: Text("Chưa có kho hàng"),
          //                           ),
          //                         ),
          //                       ],
          //                       onChanged: (value){},
          //                       hint: Text("Chọn kho hàng"),
          //                     )
          //
          //                   // controller.mcity != null
          //                   //     ? DropdownButton(
          //                   //   value: controller.selectedCity != null ? controller.selectedCity : null,
          //                   //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
          //                   //   iconSize: 24,
          //                   //   elevation: 16,
          //                   //   isExpanded: true,
          //                   //   items: controller.mcity!.map((DataCity value){
          //                   //     return DropdownMenuItem<DataCity>(
          //                   //       value: value,
          //                   //       child: Container(
          //                   //         child: Text(
          //                   //           value.name.toString(),
          //                   //         ),
          //                   //       ),
          //                   //     );
          //                   //   }).toList(),
          //                   //   onChanged: (DataCity? value){
          //                   //     controller.onChangeCity(value!, value.id!);
          //                   //   },
          //                   //   hint: Text(ONCHANGE_CITY),
          //                   // )
          //                   //     : DropdownButton(
          //                   //   icon: Icon(Icons.keyboard_arrow_down, color: MAIN_LINE,),
          //                   //   iconSize: 24,
          //                   //   elevation: 16,
          //                   //   isExpanded: true,
          //                   //   items: [
          //                   //     DropdownMenuItem<String>(
          //                   //       value: "1",
          //                   //       child: Center(
          //                   //         child: Text(NO_CITY),
          //                   //       ),
          //                   //     ),
          //                   //   ],
          //                   //   onChanged: (value){},
          //                   //   hint: Text(ONCHANGE_CITY),
          //                   // )
          //                 ),
          //               ),
          //             ),
          //           ],
          //         )
          //     ),
          //     SizedBox(height: 5),
          //     // controller.cityValid == false
          //     //     ? TextCustomized(text: controller.cityError.toString(), color: Colors.red)
          //     //     : Container(),
          //   ],
          // ),
        ],
      ),
    );
  }
}