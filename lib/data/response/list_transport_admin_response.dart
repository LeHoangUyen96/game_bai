class TransportFormAdminResponse {
  List<DataTransportFormAdmin>? data;

  TransportFormAdminResponse({
    this.data,
  });

  TransportFormAdminResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? json['data']
            .map<DataTransportFormAdmin>(
                (e) => DataTransportFormAdmin.fromJson(e))
            .toList()
        : [];
  }
}

class DataTransportFormAdmin {
  int? id;
  String? name;
  int? status;

  DataTransportFormAdmin({
    this.name,
    this.id,
    this.status,
  });
  DataTransportFormAdmin.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    id = json['id'] ?? 0;
    status = json['status'] ?? 0;
  }
}
