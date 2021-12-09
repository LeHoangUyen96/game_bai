import 'package:get/get.dart';
import 'package:viet_trung_mobile/data/di/injector.dart';
import 'package:viet_trung_mobile/data/repository/transport_admin_reponsitory/transport_admin_repositories.dart';
import 'package:viet_trung_mobile/data/response/transport_admin_detail_response.dart';

class TransportDetailController extends GetxController {
  TransportAdminRepositories? repository;
  TransportAdminDetailResponse? response;
  String? transportId;

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

      update();
    }).catchError((onError) {
      update();
    });
    update();
  }
}
