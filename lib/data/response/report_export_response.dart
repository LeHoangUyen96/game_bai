class ReportExportResponse {
  String ? data;

  ReportExportResponse({
    this.data,
  });
  ReportExportResponse.fromJson(Map<String, dynamic> json) {
    this.data = json["data"] != null ? json["data"] : '';
  }
}