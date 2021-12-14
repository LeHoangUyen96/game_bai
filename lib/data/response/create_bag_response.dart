import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class CreateBagResponse {
  String? message;
  DataCreateBag? data;

  CreateBagResponse({this.message,this.data});

  CreateBagResponse.fromJson(Map<String,dynamic> json){
    message = json['message'];
    data = json['data'] != null ? DataCreateBag.fromJson(json['data']) : null;
  }
}

class DataCreateBag {
  int? id;
  String? code;
  String? parent_pack_type;
  String? parent_pack_name;
  String? warehouse_back_code;
  String? warehouse_back_name;
  String? parent_pack_status_code;
  String? parent_pack_status_name;
  int? item_number;
  int? customer_number;
  String? transport_form;
  int? weight;
  int? volume;
  String? created_at;
  String? updated_at;

  DataCreateBag({
    this.id,
    this.code,
    this.parent_pack_type,
    this.parent_pack_name,
    this.warehouse_back_code,
    this.warehouse_back_name,
    this.parent_pack_status_code,
    this.parent_pack_status_name,
    this.item_number,
    this.customer_number,
    this.transport_form,
    this.weight,
    this.volume,
    this.created_at,
    this.updated_at,
  });

  DataCreateBag.fromJson(Map<String, dynamic> json) {
    id = ParseNumber.parseInt(json['id']);
    code = json['code'] != null ? json['code'] : '';
    parent_pack_type = json['parent_pack_type'] != null ? json['parent_pack_type'] : '';
    parent_pack_name = json['parent_pack_name'] != null ? json['parent_pack_name'] : '';
    warehouse_back_code = json['warehouse_back_code'] != null ? json['warehouse_back_code'] : '';
    warehouse_back_name = json['warehouse_back_name'] != null ? json['warehouse_back_name'] : '';
    parent_pack_status_code = json['parent_pack_status_code'] != null ? json['parent_pack_status_code'] : '';
    parent_pack_status_name = json['parent_pack_status_name'] != null ? json['parent_pack_status_name'] : '';
    item_number = ParseNumber.parseInt(json['item_number']);
    customer_number = ParseNumber.parseInt(json['customer_number']);
    transport_form = json['transport_form'] != null ? json['transport_form'] : '';
    weight = ParseNumber.parseInt(json['weight']);
    volume = ParseNumber.parseInt(json['volume']);
    created_at = json['created_at'] != null ? json['created_at'] : '';
    updated_at = json['updated_at'] != null ? json['updated_at'] : '';
  }
}