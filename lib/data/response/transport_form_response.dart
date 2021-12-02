class TransportFormResponse {
  List<DataTransportForm>? data;

  TransportFormResponse({
    this.data,
  });

  TransportFormResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? json['data']
            .map<DataTransportForm>((e) => DataTransportForm.fromJson(e))
            .toList()
        : [];
  }
}

class DataTransportForm {
  int? id;
  String? name;

  DataTransportForm({
    this.name,
    this.id,
  });
  DataTransportForm.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    id = json['id'] ?? 0;
  }
}
