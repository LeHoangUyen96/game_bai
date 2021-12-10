import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/notification_repository/notification_repository.dart';
import 'package:viet_trung_mobile/data/response/notification_admin_response.dart';
import 'package:viet_trung_mobile/data/response/error_response.dart';
import 'package:viet_trung_mobile/ui/admin/notification_admin/contract/notification_admin_contract.dart';

class NotificationAdminController extends GetxController
    implements NotificationContract {
  late NotificationContract contract;
  late NotificationRepository repository;
  NotificationAdminResponse? listNotificationResponse;
  List<DataNotificationAdminResponse> listNotification = [];
  DataNotificationAdminResponse? mdataNotificationResponse;

  @override
  void onInit() {
    super.onInit();
    repository = Injector().notification;
    //orderRepositories = Injector().order;
    contract = this;
    getListNotification();
  }

  void getListNotification() {
    repository.onGetListNotificationAdmin().then((value) {
      return contract.onGetListNotificationAdminSuccess(value);
    }).catchError((onError) {
      print("-----------------$onError");
      return contract.onGetListNotificationAdminError(onError);
    });
  }

  // void readOneNotification(int notificationId){
  //   repository.onReadOneNotification(notificationId).then((value) {
  //     onListRefresh();
  //   }).catchError((onError) {
  //     print('$onError');
  //   });
  // }

  // void onItemNotificationClick(int index) {
  //   //readOneNotification(listNotification[index].id!);
  //   orderRepositories!.onGetDetailsOrder(listNotification[index].relation_id!).then((value) {
  //   //Get.dialog(LoadingSpinKit(), barrierDismissible: false);
  //     orderDetailsResponse = value;
  //     if(orderDetailsResponse!.dataOrderDetails!.type! > 0){
  //       Get.to(ConfirmOrderPage(),arguments: listNotification[index].relation_id)!.then((value){
  //         print('is----${listNotification[index].relation_id}');
  //         if(value != null ){
  //           onListRefresh();
  //           }
  //         });
  //     } else{
  //        Get.to(OrderDetailReceivePage(),arguments: listNotification[index].relation_id)!.then((value){
  //         print('is----${listNotification[index].relation_id}');
  //         if(value != null ){
  //           onListRefresh();
  //           }
  //          });
  //     }
  //     update();
  //   }).catchError((onError){
  //     print(onError);
  //     //return onGetOrderDetailsError(onError);
  //     update();
  //   });
  //    update();

  // }
  void onGetOrderDetailsError(ErrorResponse msg) {}

  // @override
  // void onGetListNotificationSuccess(NotificationListResponse data) {
  //   listNotificationResponse = data;
  //   listNotification.addAll(listNotificationResponse!.data!);
  //   // for(var i = 0; i < listNotificationResponse!.data!.length; i++){
  //   //      List<String> splitted = mdataNotificationResponse!.content!.split(" ");
  //   //      List<String> hashTags = [];
  //   //      for (var item in splitted) {
  //   //   if (item.startsWith("#")) {
  //   //     hashTags.add(item);
  //   //   }
  //   // }
  //   // print('-----------$hashTags');
  //   // }
  //   if (listNotificationResponse!.paginate!.current_page! <= listNotificationResponse!.paginate!.last_page!) {
  //     if (listNotificationResponse!.paginate!.next! > 0) {
  //       isNextPage = true;
  //     } else {
  //       isNextPage = false;
  //     }
  //   } else {
  //     isNextPage = false;
  //   }
  //   if (refreshController.isLoading) {
  //     refreshController.loadComplete();
  //   }
  //   if (refreshController.isRefresh) {
  //     refreshController.refreshCompleted();
  //   }

  //   update();
  // }

  @override
  void onGetListNotificationAdminError(ErrorResponse error) {
    Get.defaultDialog(title: error.message.toString(), middleText: '');
  }

  @override
  void onGetListNotificationAdminSuccess(NotificationAdminResponse data) {
    listNotificationResponse = data;
    listNotification.addAll(listNotificationResponse!.data!);
    update();
  }

  // bool isNumericUsingRegularExpression(String string) {
  //   final numericRegex =
  //   RegExp(r'^-?(([0-9]*)|(([0-9]*)))$');

  //   return numericRegex.hasMatch(string);
  // }

}
