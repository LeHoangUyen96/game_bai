import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class ReportResponse {
  int? number_parent_pack;
  int? number_package;
  int? number_user;
  int? total_weight;
  int? total_volume;
  double? total_cod;
  double? total_packing_fee;
  double? total_transport_vn_fee;

  ReportResponse({
    this.number_parent_pack,
    this.number_package,
    this.number_user,
    this.total_weight,
    this.total_volume,
    this.total_cod,
    this.total_packing_fee,
    this.total_transport_vn_fee,
  });
  ReportResponse.fromJson(Map<String, dynamic> json) {
    this.number_parent_pack = ParseNumber.parseInt(json['number_parent_pack']);
    this.number_package = ParseNumber.parseInt(json['number_package']);
    this.number_user = ParseNumber.parseInt(json['number_user']);
    this.total_weight = ParseNumber.parseInt(json['total_weight']);
    this.total_volume = ParseNumber.parseInt(json['total_volume']);
    this.total_cod = ParseNumber.parseDouble(json['total_cod']);
    this.total_packing_fee = ParseNumber.parseDouble(json['total_packing_fee']);
    this.total_transport_vn_fee = ParseNumber.parseDouble(json['total_transport_vn_fee']);
  }
}