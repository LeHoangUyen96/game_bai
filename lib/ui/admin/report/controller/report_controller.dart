import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/di/injector.dart';
import 'package:viet_trung_mobile_admin/data/repository/report_reponsitory/report_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/request/report_request.dart';
import 'package:viet_trung_mobile_admin/data/response/report_response.dart';

class ReportController extends GetxController  {
  int ? typeTime ;
  ReportResponse ? reportResponse;
  ReportRepositories ? reportRepositories;
  @override
  void onInit() {
    super.onInit();
    reportRepositories = Injector().report;
    onGetDataReport();
  }
  void onGetDataReport(){
    ReportRequest request = ReportRequest(
      type: typeTime,
      to_date: "",
      from_date: "",
    );
    reportRepositories!.onGetDataReport(request).then((value) {
      reportResponse = value; 
      update();
    }).catchError((onError){
      Get.defaultDialog(title: onError.message.toString(), middleText: '');
    });
  }
}