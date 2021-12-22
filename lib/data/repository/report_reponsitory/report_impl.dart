import 'dart:convert';

import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/data/network/network_config.dart';
import 'package:viet_trung_mobile_admin/data/repository/report_reponsitory/report_reponsitories.dart';
import 'package:viet_trung_mobile_admin/data/response/error_response.dart';
import 'package:viet_trung_mobile_admin/data/response/report_export_response.dart';
import 'package:viet_trung_mobile_admin/data/response/report_response.dart';
import 'package:viet_trung_mobile_admin/data/request/report_request.dart';

class ReportImpl extends GetConnect implements ReportRepositories {
  @override
  Future<ReportResponse> onGetDataReport(ReportRequest request) async{
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.REPORT;
    final body = jsonEncode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ReportResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }

  @override
  Future<ReportExportResponse> onExportReport(ReportRequest request) async{
    final header = NetworkConfig.onBuildHeader();
    final url = NetworkConfig.REPORT_EXPORT;
    final body = jsonEncode(request);
    final responseJson = await post(url, body, headers: header);
    if (responseJson.statusCode! >= 200 && responseJson.statusCode! < 300) {
      return ReportExportResponse.fromJson(responseJson.body);
    }
    throw ErrorResponse.fromJson(responseJson.body);
  }
}