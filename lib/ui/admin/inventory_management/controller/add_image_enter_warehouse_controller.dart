import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:viet_trung_mobile/data/response/admin_add_image_enter_warehouse_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/ulti/helper/constant.dart';
import 'package:viet_trung_mobile/ulti/helper/handle_image.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';


class EnterWarehouseUploadImageController extends GetxController {
  int? selectedReason;
 List<DataImagesEnterWareHouseResponse>? mImages = [];

  String? mDataUploadImage;

  int? id;
  //int index = 0;

  //int  id = 1;
  List<File>? images;
  List<Asset>? selectedAssetsPrevious;

  @override
  void onInit() {
    super.onInit();
    print("$id");
    images = <File>[];
    selectedAssetsPrevious = <Asset>[];
  }

  void onPickerImage(ImageSource imageSource) {
    //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    HandleImage().pickerImage(imageSource).then((value) {
      images!.add(value!);
      mImages!.add(DataImagesEnterWareHouseResponse(
          key: "", path: "", file: value, isNetWork: false));
      // uploadImageComplain();
      Get.back(result: images);
      update();
    }).catchError((onError) {
      Get.back();
    });
  }

  void onPickerMultiImage() {
    Get.dialog(LoadingSpinKit(), barrierDismissible: false);
    HandleImage().multiPickerImage(selectedAssetsPrevious!).then((value) async {
      if (value.length != 0) {
        selectedAssetsPrevious = value;
        images = await HandleImage().convertAssetToFile(value);
        //uploadImageComplain();
        Get.back();
        Get.back(result: images);
      }
    }).catchError((onError) {
      //
      Get.back();
      Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
    });
  }

  // void uploadImageComplain() {
  //   Get.dialog(LoadingSpinKit(), barrierDismissible: false);
  //   complaintRepositories!.onUploadImageComplaint(images!).then((value) {
  //     Get.back();
  //     mDataUploadImage = value;
  //     CreateComplaintController controller = Get.find();
  //     controller.image = mDataUploadImage;
  //     if(controller.item_code == COMPLAINT_MISS_ITEM){
  //       if(controller.inputQuantity.text.toString() != ''){
  //         controller.isCheck = false;
  //         update();
  //       }
  //     } else if (controller.item_code == COMPLAINT_OTHER_ERROR){
  //       if(controller.messenger.text != '' ){
  //         controller.isCheck = false;
  //         update();
  //       }
  //     } else if (controller.item_code == COMPLAINT_ERROR_ITEM){
  //         controller.isCheck = false;
  //         update();
  //     } else controller.isCheck = true;
  //     controller.onGetComplaintListAnotherReason();
  //     update();
  //   }).catchError((onError) {
  //     Get.back();
  //     Get.defaultDialog(title: (onError as ErrorResponse).message.toString(), middleText: '');
  //   });
  // }

  void onClearImage(int index) {
    if(images!.length > index){
      images!.removeAt(index);
    }
    update();
  }

  @override
  void onError(ErrorResponse msg) {}

  @override
  void onSuccess() {
    // TODO: implement onSuccess
  }

}
