import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class OrderDetailsResponse {

  DataOrderDetailsResponses? dataOrderDetails;

  OrderDetailsResponse({
    this.dataOrderDetails,
  });

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    print('OrderDetailsResponse.fromJson ${json}');
    this.dataOrderDetails = json['data'] != null ? DataOrderDetailsResponses.fromJson(json['data']) : null;
  }

}

class DataOrderDetailsResponses {
  int? id;
  String? bill_code;
  int? type;
  String? order_status;
  String? order_status_name;
  String? name;
  String? phone;
  int? number_package;
  String? item;
  double? transport_fee;
  List<String>? images;
  String? created_at;
  String? updated_at;
  String? packing_form;
  String? transport_form;
  String? delivery_form;
  String? storage_receive;
  String? note;
  List<DataOrderJourney> ? order_journey;


  DataOrderDetailsResponses({
    this.id,
    this.bill_code,
    this.type,
    this.order_status,
    this.order_status_name,
    this.name,
    this.phone,
    this.number_package,
    this.item,
    this.transport_fee,
    this.images,
    this.created_at,
    this.updated_at,
    this.packing_form,
    this.transport_form,
    this.delivery_form,
    this.storage_receive,
    this.note,
    this.order_journey,
  });

  DataOrderDetailsResponses.empty() {
    this.id = -1;
    this.bill_code = '';
    this.type = -1;
    this.order_status = '';
    this.order_status_name = '';
    this.name = '';
    this.phone = '';
    this.number_package = -1;
    this.item = '';
    this.transport_fee = 0.0;
    this.created_at = '';
    this.updated_at = '';
    this.packing_form = '';
    this.transport_form = '';
    this.delivery_form = '';
    this.storage_receive = '';
    this.note = '';
  }

  DataOrderDetailsResponses.fromJson(Map<String, dynamic> json) {
    print('DataOrderResponse.fromJson ${json}');
    this.id = ParseNumber.parseInt(json['id']);
    this.bill_code = json["bill_code"] != null ? json["bill_code"] : '';
    this.type = ParseNumber.parseInt(json['type']);
    this.order_status = json["order_status"] != null ? json["order_status"] : '';
    this.order_status_name = json["order_status_name"] != null ? json["order_status_name"] : '';
    this.name = json["name"] != null ? json["name"] : '';
    this.phone = json["phone"] != null ? json["phone"] : '';
    this.number_package = ParseNumber.parseInt(json['number_package']);
    this.created_at = json["created_at"] != null ? json["created_at"] : '';
    this.item = json["item"] != null ? json["item"] : '';
    this.transport_fee = ParseNumber.parseDouble(json['transport_fee']);
    this.created_at = json["created_at"] != null ? json["created_at"] : '';
    this.updated_at = json["updated_at"] != null ? json["updated_at"] : '';
    this.packing_form = json["packing_form"] != null ? json["packing_form"] : '';
    this.transport_form = json["transport_form"] != null ? json["transport_form"] : '';
    this.delivery_form = json["delivery_form"] != null ? json["delivery_form"] : '';
    this.storage_receive = json["storage_receive"] != null ? json["storage_receive"] : '';
    this.note = json["note"] != null ? json["note"] : '';
    this.order_journey = json["order_journey"] == null ? <DataOrderJourney>[] : json['order_journey'].map<DataOrderJourney>((e)=> DataOrderJourney.fromJson(e)).toList();

  }


}
class DataOrderJourney{
  String? status_name;
  String? created_at;

  DataOrderJourney({
    this.status_name,
    this.created_at
  });

  DataOrderJourney.fromJson(Map<String, dynamic> json){
    this.status_name = json['status_name'] != null ? json['status_name'] : '';
    this.created_at = json['created_at'] != null ? json['created_at'] : '';
  }

}

