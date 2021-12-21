class ListStatusResponse {
  List<StatusResponse>? data;

  ListStatusResponse({
    this.data,
  });

  ListStatusResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? json['data']
            .map<StatusResponse>((e) => StatusResponse.fromJson(e))
            .toList()
        : [];
  }
}

class StatusResponse {
  String? statusCode;
  String? statusName;

  StatusResponse({
    this.statusName,
    this.statusCode,
  });
  StatusResponse.fromJson(Map<String, dynamic> json) {
    statusName = json['status_name'] ?? '';
    statusCode = json['status_code'] ?? 0;
  }
}
