import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/repository/rating_order_reponsitory/rating_order_reponsitory.dart';
import 'package:viet_trung_mobile/data/response/list_rating_order_response.dart';
import 'package:viet_trung_mobile/data/response/order_detail_response.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/strings.dart';

class RatingOrderController extends GetxController  {
   ListRatingOrderResponse ? listRatingOrderResponse;
   RatingOrderRepositories? ratingOrderRepositories;
  Color? color;
  @override
  void onInit() {
    super.onInit();
    ratingOrderRepositories = Injector().ratingOrder;
    onGetListRatingOrder();
  }
  void onGetListRatingOrder(){
    ratingOrderRepositories!.onGetListRatingOrder().then((value){
      listRatingOrderResponse = value;
      update();      
    }).catchError((onError){
      return onError(onError);
    });
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
   
}