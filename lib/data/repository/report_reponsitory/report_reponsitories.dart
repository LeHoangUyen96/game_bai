import 'package:viet_trung_mobile_admin/data/request/report_request.dart';
import 'package:viet_trung_mobile_admin/data/response/report_response.dart';

abstract class ReportRepositories {
  Future<ReportResponse> onGetDataReport(ReportRequest request);
}
