import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/notification_repository/notification_repository.dart';
import 'package:viet_trung_mobile/data/repository/order_repository/order_repositories.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/data/response/notification_response.dart';
import 'package:viet_trung_mobile/data/response/order_detail_response.dart';
import 'package:viet_trung_mobile/data/response/order_response.dart';
import 'package:viet_trung_mobile/ui/notification/contract/notification_contract.dart';
import 'package:viet_trung_mobile/ui/notification/view/conffirm_order_page.dart';
import 'package:viet_trung_mobile/ui/order/view/order_details_receive.dart';
import 'package:viet_trung_mobile/widget/loading_spinkit.dart';

class NotificationListController extends GetxController implements NotificationContract{
  RefreshController refreshController = RefreshController(initialRefresh: false);
  late NotificationContract contract;
  late NotificationRepository repository;
  NotificationListResponse? listNotificationResponse;
  List<NotificationResponse> listNotification = [];
  NotificationResponse ? mdataNotificationResponse;
  OrderRepositories? orderRepositories;
  OrderResponse? orderResponse;
  OrderDetailsResponse? orderDetailsResponse;
  bool isNextPage = false;
  int page = 1;
  int perPage = 10;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().notification;
    orderRepositories = Injector().order;
    contract = this;
    getListNotification(false);
  }

  void getListNotification(bool isRefresh) {
    if (isRefresh) {
      listNotification.clear();
    }
    repository.onGetListNotification(page, perPage).then((value) {
      
      return contract.onGetListNotificationSuccess(value);
    }).catchError((onError) {
      print("-----------------$onError");
       //return contract.onGetListNotificationError(onError);
    });
  }

  void readOneNotification(int notificationId){
    repository.onReadOneNotification(listNotification[notificationId].id!).then((value) {
     // onListRefresh();
       onItemNotificationClick(notificationId);
    }).catchError((onError) {
      print('$onError');
    });
  }

  void onItemNotificationClick(int index) {
    orderRepositories!.onGetDetailsOrder(listNotification[index].relation_id!).then((value) {
    // Get.dialog(LoadingSpinKit(), barrierDismissible: false);
      orderDetailsResponse = value;
      // if(orderDetailsResponse!.dataOrderDetails!.type != null){
      //   // Get.to(ConfirmOrderPage(),arguments: listNotification[index].relation_id)!.then((value){
      //   //   print('is----${listNotification[index].relation_id}');
      //   //   if(value != null ){
      //   //     onListRefresh();
      //   //     }
      //   //   });
      //   Get.to(ConfirmOrderPage(),arguments:{ 
      //     'id' : listNotification[index].relation_id,
      //     'orderDetailsResponse' : orderDetailsResponse
      //   });
      // } else{
      //   //  Get.to(OrderDetailReceivePage(),arguments: listNotification[index].relation_id)!.then((value){
      //   //   print('is----${listNotification[index].relation_id}');
      //   //   // if(value != null ){
      //   //   //   onListRefresh();
      //   //   //   }
      //   //    });
      //   Get.to(OrderDetailReceivePage(),arguments: listNotification[index].relation_id);
      // }
      // update();
      Get.to(()=>ConfirmOrderPage(),arguments:{ 
          'id' : listNotification[index].relation_id,
          'orderDetailsResponse' : orderDetailsResponse,
          'type' : orderDetailsResponse!.dataOrderDetails!.type
        })!.then((value){
          if(value != null ){
            onListRefresh();
            }
        });
    }).catchError((onError){
      print(onError);
      //return onGetOrderDetailsError(onError);
      update();
    });
     //update();
      //  readOneNotification(listNotification[index].id!);
   
  }
  void onGetOrderDetailsError(ErrorResponse msg) {
    // TODO: implement onGetOrderDetailsError
  }

  void onListLoading() async {
    if (isNextPage) {
      page = (page + 1);
      getListNotification(false);
    }
  }

  void onListRefresh() async {
    page = 1;
    getListNotification(true);
    update();
  }

  @override
  void onGetListNotificationError(ErrorResponse error) {

    Get.defaultDialog(title: error.message.toString(), middleText: '');
  }

  @override
  void onGetListNotificationSuccess(NotificationListResponse data) {
    listNotificationResponse = data;
    listNotification.addAll(listNotificationResponse!.data!);
    // for(var i = 0; i < listNotificationResponse!.data!.length; i++){
    //      List<String> splitted = mdataNotificationResponse!.content!.split(" ");
    //      List<String> hashTags = [];
    //      for (var item in splitted) {
    //   if (item.startsWith("#")) {
    //     hashTags.add(item);
    //   }
    // }
    // print('-----------$hashTags');
    // }
    if (listNotificationResponse!.paginate!.current_page! <= listNotificationResponse!.paginate!.last_page!) {
      if (listNotificationResponse!.paginate!.next! > 0) {
        isNextPage = true;
      } else {
        isNextPage = false;
      }
    } else {
      isNextPage = false;
    }
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
    
    update();
  }

  // bool isNumericUsingRegularExpression(String string) {
  //   final numericRegex =
  //   RegExp(r'^-?(([0-9]*)|(([0-9]*)))$');

  //   return numericRegex.hasMatch(string);
  // }

}