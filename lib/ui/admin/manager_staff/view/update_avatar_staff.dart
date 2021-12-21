import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/dimens.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';
import 'package:viet_trung_mobile_admin/ui/admin/inventory_management/controller/enter_warehouse_controller.dart';
import 'package:viet_trung_mobile_admin/ui/admin/manager_staff/controller/edit_staff_controller.dart';
import 'package:viet_trung_mobile_admin/widget/text_customized.dart';

class ImagePickerDialog extends GetView<EditStaffController> {
  final String? nameMessage;
  final bool? multiPickerImage;

  ImagePickerDialog({this.nameMessage, this.multiPickerImage});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditStaffController>(
        builder: (value) => AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: 120,
            width: 295,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide( //                   <--- left side
                        color: TEXT_GREY_IN_CART,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top:5, left: 16),
                    child: Row(
                      children: [
                        TextCustomized(
                          size: smallMediumSize,
                          weight: FontWeight.w600,
                          color: Colors.black,
                          text: PROFILE_UPDATE_AVATAR ,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.clear,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 16)
                      ],
                    ),
                  )
                ),
                Container(
                    height: 40,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide( //                   <--- left side
                          color: TEXT_GREY_IN_CART,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                        controller.onPickerImage(ImageSource.camera);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            TextCustomized(
                              size: smallMediumSize,
                              weight: FontWeight.w500,
                              color: Colors.black,
                              text: PROFILE_NEW_IMAGE ,
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                Container(
                  height: 40,
                  width: Get.width,
                  child: InkWell(
                    onTap: (){
                      controller.onPickerImage(ImageSource.gallery);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          TextCustomized(
                            size: smallMediumSize,
                            weight: FontWeight.w500,
                            color: Colors.black,
                            text: PROFILE_IMAGE_LIB,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
               
              ],
            ),
          ),
        )
        );

  }
}