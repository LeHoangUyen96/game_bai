import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/widget/button_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';
import 'package:viet_trung_mobile/widget/text_field_customized.dart';

class PackingOrderWidget extends StatelessWidget {
  final String? title;
  final String? text;
  PackingOrderWidget({this.title, this.text});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.all(0),
      title: Container(
        height: 48,
        width: Get.width,
        decoration: BoxDecoration(
           // borderRadius: BorderRadius.circular(9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(9),
            topRight: Radius.circular(9),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          color: TITLE_POPUP,
        ),
        child: Center(
          child: TextCustomized(
            text: "Đóng hàng gửi về",
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: Get.height*0.55,
          width: Get.width,
          child: Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextCustomized(text: "Bạn đã chọn đóng 2 đơn hàng gửi về!", color: Colors.black,size: 16,weight: FontWeight.w800,),
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
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustomized(text: "Ghi chú", weight: FontWeight.w700),
                    SizedBox(height: 5),
                    TextFieldCustomized(
                      //textController: controller.nameController,
                      hint: "Ghi chú",
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                  child: Row(
                    children: [
                      ButtonCustomized(
                        BT_CANCEL,
                        textColor: Colors.black,
                        onTap: () {
                          Get.back();
                        } ,
                        backgroundColor: MAIN_BT_CANCEL_ADDRESS,
                        height: 48,
                        width:Get.width*0.3,
                      ),
                      Spacer(),
                      ButtonCustomized(
                        BT_REGISTER,
                        onTap: () {
                        } ,
                        backgroundColor: BT_CONFIRM,
                        height: 48,
                        width: Get.width*0.3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}