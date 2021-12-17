import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/feedback_reponsitory/feedback_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/response/feedback_detail_response.dart';

class FeedbackDetailController extends GetxController {
  Color? color;
  FeedbackRespositories? respositories;
  String? idReview;
  ReviewDetailResponse? response;
  Order? order;

  @override
  void onInit() {
    super.onInit();
    respositories = Injector().feedback;
    if (Get.arguments == null) {
      idReview = null;
    } else {
      idReview = Get.arguments;
    }
    getReviewDetail(idReview!);
  }

  void getReviewDetail(String id) {
    respositories!.onGetReviewDetail(idReview!).then((value) {
      response = value;
      order = value.data!.order!;
      update();
    }).catchError((onError) {
      print(onError);
      update();
    });
  }
}
