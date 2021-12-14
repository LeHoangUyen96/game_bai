import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class ListPackingFormResponse {
  List<DataListPackingFormFormResponse>? data;
  ListPackingFormResponse({
    this.data,
  });
  ListPackingFormResponse.fromJson(Map<String, dynamic> json) {
    print('data.fromJson ${json} ');
    this.data = json["data"] == null
        ? <DataListPackingFormFormResponse>[]
        : json['data']
            .map<DataListPackingFormFormResponse>(
                (e) => DataListPackingFormFormResponse.fromJson(e))
            .toList();
  }
}

class DataListPackingFormFormResponse {
  int? id;
  String? name;
  int? status;
  DataListPackingFormFormResponse({this.id, this.name, this.status});
  DataListPackingFormFormResponse.empty() {
    this.id = -1;
    this.name = '';
    this.status = -1;
  }
  DataListPackingFormFormResponse.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id']);
    this.name = json["name"] != null ? json["name"].toString() : '';
    this.status = ParseNumber.parseInt(json['status']);
  }
}
