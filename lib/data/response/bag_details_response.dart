import 'package:viet_trung_mobile/data/response/list_order_add_bag_response.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class BagDetailsResponse {
  DataBagDetailsResponse? data;
  BagDetailsResponse({
    this.data,
  });
  BagDetailsResponse.fromJson(Map<String, dynamic> json) {
    print('data.fromJson ${json} ');
    this.data = json['data'] != null
        ? DataBagDetailsResponse.fromJson(json['data'])
        : null;
  }
}

class DataBagDetailsResponse {
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
  int? transport_form_id;
  String? transport_form;
  String? weight;
  String? volume;
  String? created_at;
  String? updated_at;
  int? total_cod;
  List<DataPackingJourney> ? packing_journey;
  List<DataListOrderAddBagResponse> ? orders;



  DataBagDetailsResponse({
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
    this.packing_journey,
    this.orders,
    this.total_cod,
    this.transport_form_id
  });
    DataBagDetailsResponse.empty(){
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
     this.transport_form= '';
     this.weight= '';
     this.volume= '';
     this.created_at= '';
     this.updated_at= '';
     this.transport_form_id = -1;
     this.total_cod = -1;

   }
    DataBagDetailsResponse.fromJson( Map<String,dynamic> json) {
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
     this.transport_form = json["transport_form"] != null ? json["transport_form"].toString() : '';
     this.weight = json["weight"] != null ? json["weight"].toString() : '';
     this.volume = json["volume"] != null ? json["volume"].toString() : '';
     this.created_at = json["created_at"] != null ? json["created_at"].toString() : '';
     this.updated_at = json["updated_at"] != null ? json["updated_at"].toString() : '';
     this.transport_form_id = ParseNumber.parseInt(json['transport_form_id']);
     this.total_cod = ParseNumber.parseInt(json['total_cod']);
     this.packing_journey = json["packing_journey"] == null ? <DataPackingJourney>[] : json['packing_journey'].map<DataPackingJourney>((e)=> DataPackingJourney.fromJson(e)).toList();
     this.orders = json["orders"] == null ? <DataListOrderAddBagResponse>[] : json['orders'].map<DataListOrderAddBagResponse>((e)=> DataListOrderAddBagResponse.fromJson(e)).toList();
    }

}

class DataPackingJourney {
  String? status_name;
  String? created_at;

  DataPackingJourney({this.status_name, this.created_at});

  DataPackingJourney.fromJson(Map<String, dynamic> json) {
    this.status_name = json['status_name'] != null ? json['status_name'] : '';
    this.created_at = json['created_at'] != null ? json['created_at'] : '';
  }
}