import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/dimens.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ui/order_management/order_wait_confirm/controller/order_wait_confirm_detail_controller.dart';
import 'package:viet_trung_mobile/widget/image_customized.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class AddImageConfirmOrder extends GetView<OrderWaitConfirmDetailController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderWaitConfirmDetailController>(
      init: OrderWaitConfirmDetailController(),
      builder: (value) => Container(
          height: 120,
          padding: EdgeInsets.all(20),
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.mImages!.length + 1,
            itemBuilder: (BuildContext context, index) {
              return index == controller.mImages!.length
                  ? GestureDetector(
                      onTap: () {
                        if (controller.mImages!.length < 5) {
                          Get.dialog(_selectedImageDialog());
                        } else if (controller.mImages!.length == 5) {
                          Get.snackbar(NOTIFY, ERROR_IMAGES);
                        }
                      },
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: GRAY,
                          strokeWidth: 3,
                          radius: Radius.circular(25),
                          dashPattern: [8, 4],
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: Container(
                                padding: EdgeInsets.all(13),
                                color: GRAY7,
                                child: Center(
                                  child: SvgPicture.asset(
                                    IC_CAMERA,
                                    width: Get.width * 0.1 - 20,
                                    height: Get.height * 0.1 - 25.0,
                                  ),
                                )),
                          )),
                    )
                  : Container(
                      height: Get.height * 0.3,
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: GRAY),
                        color: GRAY_BG,
                      ),
                      child: controller.mImages![index].isNetWork ?? true
                          ? Container(
                              height: Get.height * 0.3,
                              width: Get.width * 0.25,
                              margin: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.01),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Hero(
                                      tag:
                                          '${controller.mImages![index].path.toString()}',
                                      child: ClipRRect(
                                        child: ImageCustomized(
                                          path: NetworkConfig
                                                  .URL_SERVER_BASE_CDN +
                                              controller.mImages![index].path
                                                  .toString(),
                                          width: Get.width,
                                          height: Get.width,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () {
                                          controller.onClearImage(index);
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Colors.white,
                                        ),
                                      ))
                                ],
                              ),
                            )
                          : Container(
                              height: Get.height * 0.3,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Hero(
                                      tag:
                                          '${controller.mImages![index].file!.absolute}',
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: ImageCustomized(
                                          file: controller
                                              .mImages![index].file!.absolute,
                                          height: Get.height * 0.3,
                                          width: Get.width * 0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () {
                                          controller.onClearImage(index);
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Colors.white,
                                        ),
                                      ))
                                ],
                              ),
                            ));
            },
            separatorBuilder: (context, position) {
              return SizedBox(
                width: 10,
              );
            },
          )),
    );
  }

  Widget _selectedImageDialog() {
    return AlertDialog(
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
                    bottom: BorderSide(
                      //                   <--- left side
                      color: TEXT_GREY_IN_CART,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 5, left: 16),
                  child: Row(
                    children: [
                      TextCustomized(
                        size: smallMediumSize,
                        weight: FontWeight.w600,
                        color: Colors.black,
                        text: "Tải hình ảnh",
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
                )),
            Container(
              height: 40,
              width: Get.width,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    //                   <--- left side
                    color: TEXT_GREY_IN_CART,
                    width: 0.5,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () {
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
                        text: PROFILE_NEW_IMAGE,
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
                onTap: () {
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
    );
  }
}
