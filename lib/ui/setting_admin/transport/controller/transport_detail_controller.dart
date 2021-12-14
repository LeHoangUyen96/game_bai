import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';
import 'package:viet_trung_mobile_admin/data/response/transport_admin_detail_response.dart';

class TransportDetailController extends GetxController {
  TransportAdminRepositories? repository;
  TransportAdminDetailResponse? response;
  List<DataTransportFormAdminDetail>? transportDetail;
  String? transportId;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    repository = Injector().transport;
    if (Get.arguments == null) {
      transportId = null;
    } else {
      transportId = Get.arguments;
    }
    onGetTransportDetail(transportId!);
  }

  void onGetTransportDetail(String id) {
    repository!.onGetTransportDetail(transportId!).then((value) {
      response = value;
      transportDetail = value.data!;
      update();
    }).catchError((onError) {
      update();
    });
  }

  void onDeleteTransport(String id) {
    repository!.onDeleteTransportFee(id).then((value) {
      Get.snackbar('Thông báo', value.message!);
      update();
    }).catchError((onError) {
      update();
    });
  }

  void onRefresh() async {
    onGetTransportDetail(transportId!);
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    onGetTransportDetail(transportId!);
    refreshController.refreshCompleted();
  }
}
