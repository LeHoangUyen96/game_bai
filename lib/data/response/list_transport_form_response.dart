import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class ListTransportFormResponse {
  List<DataListTransportFormResponse>? data;
  ListTransportFormResponse({
    this.data,
  });
  ListTransportFormResponse.fromJson(Map<String, dynamic> json) {
    print('data.fromJson ${json} ');
    this.data = json["data"] == null
        ? <DataListTransportFormResponse>[]
        : json['data']
            .map<DataListTransportFormResponse>(
                (e) => DataListTransportFormResponse.fromJson(e))
            .toList();
  }
}

class DataListTransportFormResponse {
  int? id;
  String? name;
  int? status;
  DataListTransportFormResponse({
    this.id,
    this.name,
    this.status,
  });
  DataListTransportFormResponse.empty() {
    this.id = -1;
    this.name = '';
    this.status = -1;
  }
  DataListTransportFormResponse.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id']);
    this.name = json["name"] != null ? json["name"].toString() : '';
    this.status = ParseNumber.parseInt(json['status']);
  }
}
