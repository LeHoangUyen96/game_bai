import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/repository/rating_order_reponsitory/rating_order_reponsitory.dart';
import 'package:viet_trung_mobile/data/request/rating_order_request.dart';
import 'package:viet_trung_mobile/data/response/order_detail_response.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class ReviewOrderController extends GetxController  {
  TextEditingController commentController = TextEditingController();
  Color? color;
  OrderRepositories? orderRepositories;
  OrderResponse? orderResponse;
  OrderDetailsResponse? orderDetailsResponse;
  RatingOrderRepositories ? ratingOrderRepositories;
  int? id;
  double? star;
  @override
  void onInit() {
    super.onInit();
    orderRepositories = Injector().order;
    ratingOrderRepositories = Injector().ratingOrder;
    if(Get.arguments == null){
      }else{
        orderDetailsResponse = Get.arguments;
      }
    print('$orderDetailsResponse');
  }
  Color ColorStatusName( String order_status_name) {
    switch (order_status_name) {
      case ORDER_LIST_CHINA_WAREHOUSE:
        color = COLOR_ORDER_CHINESE_WAREHOUSE;
        break;
      case ORDER_EXPORT_TO_CHINA:
        color = COLOR_ORDER_EXPORT_TO_CHINA;
        break;
      case ORDER_BORDER_WAREHOUSE:
        color = COLOR_ORDER_BORDER_WAREHOUSE;
        break;
      case ORDER_PROCESS:
        color = COLOR_ORDER_PROCESS;
        break;
      case ORDER_HN_WAREHOUSE:
        color = COLOR_ORDER_HN_WAREHOUSE;
        break;
      case ORDER_SG_WAREHOUSE:
        color = COLOR_ORDER_SG_WAREHOUSE;
        break;
      case ORDER_DN_WAREHOUSE:
        color = COLOR_ORDER_DN_WAREHOUSE;
        break;
      case ORDER_DELIVERY_IN_PROGRESS:
        color = COLOR_ORDER_DELIVERY_IN_PROGRESS;
        break;
      case ORDER_DELIVERY_SUCCESSFULL:
        color = COLOR_ORDER_DELIVERY_SUCCESSFULL;
        break;        
    }
    return color!;
  }
  void onRatingOrder(){
     RatingOrderRequest request = RatingOrderRequest(
        order_id : orderDetailsResponse!.dataOrderDetails!.id,
        star : ParseNumber.parseInt(star),
        comment: commentController.text.toString(),
      );
      ratingOrderRepositories!.onRatingOrder(request).then((value){
        Get.snackbar(NOTIFY, value.message.toString());
          }).catchError((onError) {
            return onError(onError);
          });
      Get.back(result: request);
      
      update();
  }
}