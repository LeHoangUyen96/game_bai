import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class ListBagResponse {
  List<DataBagResponse>? data;
  DataPaginateResponse? paginate;
  ListBagResponse({this.data, this.paginate});
  ListBagResponse.fromJson(Map<String, dynamic> json) {
    print('data.fromJson ${json} ');
    this.data = json["data"] == null
        ? <DataBagResponse>[]
        : json['data']
            .map<DataBagResponse>((e) => DataBagResponse.fromJson(e))
            .toList();
    this.paginate = json['paginate'] != null
        ? DataPaginateResponse.fromJson(json['paginate'])
        : null;
  }
}

class DataBagResponse {
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
  int? transport_form_id;
  String? weight;
  String? volume;
  String? created_at;
  String? updated_at;

  DataBagResponse({
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
    this.transport_form_id,
    this.created_at,
    this.updated_at,
  });
    DataBagResponse.empty(){
     this.id = -1;
     this.code= '';
     this.parent_pack_type= '';
     this.parent_pack_name= '';
     this.warehouse_back_code= '';
     this.warehouse_back_name= '';
     this.parent_pack_status_code= '';
     this.parent_pack_status_name= '';
     this.item_number= -1;
     this.customer_number= -1;
     this.transport_form_id= -1;
     this.transport_form= '';
     this.weight= '';
     this.volume= '';
     this.created_at= '';
     this.updated_at= '';

   }
    DataBagResponse.fromJson( Map<String,dynamic> json) {
     this.id = ParseNumber.parseInt(json['id']);
     this.code = json["code"] != null ? json["code"].toString() : '';
     this.parent_pack_type = json["parent_pack_type"] != null ? json["parent_pack_type"].toString() : '';
     this.parent_pack_name = json["parent_pack_name"] != null ? json["parent_pack_name"].toString() : '';
     this.warehouse_back_code = json["warehouse_back_code"] != null ? json["warehouse_back_code"].toString() : '';
     this.warehouse_back_name = json["warehouse_back_name"] != null ? json["warehouse_back_name"].toString() : '';
     this.parent_pack_status_code = json["parent_pack_status_code"] != null ? json["parent_pack_status_code"].toString() : '';
     this.parent_pack_status_name = json["parent_pack_status_name"] != null ? json["parent_pack_status_name"].toString() : '';
     this.item_number = ParseNumber.parseInt(json['item_number']);
     this.customer_number =ParseNumber.parseInt(json['customer_number']);
     this.transport_form_id =ParseNumber.parseInt(json['transport_form_id']);
     this.transport_form = json["transport_form"] != null ? json["transport_form"].toString() : '';
     this.weight = json["weight"] != null ? json["weight"].toString() : '';
     this.volume = json["volume"] != null ? json["volume"].toString() : '';
     this.created_at = json["created_at"] != null ? json["created_at"].toString() : '';
     this.updated_at = json["updated_at"] != null ? json["updated_at"].toString() : '';
    }

}

class DataPaginateResponse {
  int? total;
  int? per_page;
  int? current_page;
  int? last_page;
  int? next;
  int? prev;

  DataPaginateResponse({
    this.total,
    this.per_page,
    this.current_page,
    this.last_page,
    this.next,
    this.prev,
  });

  DataPaginateResponse.fromJson(Map<String, dynamic> json) {
    print('DataOrderResponse.fromJson ${json}');
    this.total = json["total"] != null
        ? (json["total"] is int ? json["total"] : int.parse(json["total"]))
        : -1;
    this.per_page = json["per_page"] != null
        ? (json["per_page"] is int
            ? json["per_page"]
            : int.parse(json["per_page"]))
        : -1;
    this.current_page = json["current_page"] != null
        ? (json["current_page"] is int
            ? json["current_page"]
            : int.parse(json["current_page"]))
        : -1;
    this.last_page = json["last_page"] != null
        ? (json["last_page"] is int
            ? json["last_page"]
            : int.parse(json["last_page"]))
        : -1;
    this.next = json["next"] != null
        ? (json["next"] is int ? json["next"] : int.parse(json["next"]))
        : -1;
    this.prev = json["prev"] != null
        ? (json["prev"] is int ? json["prev"] : int.parse(json["prev"]))
        : -1;
  }
}