import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class DashboardAdminResponse {
  String? avatar;
  String? name;
  String? role_name;
  String? exchange_rate;
  int? number_notification;
  List<DataOrderWaits> ? order_waits;
  List<DataTotalOrder> ? orders;
  List<DataOrderCloses> ? order_closes;
  
  
  DashboardAdminResponse ({
    this.avatar,
    this.name,
    this.number_notification,
    this.role_name,
    this.exchange_rate,
    this.order_waits,
    this.order_closes,
    this.orders
  });

  DashboardAdminResponse.empty(){
     this.avatar = '';
     this.name= '';
     this.number_notification= -1;
     this.role_name= '';
     this.exchange_rate= '';
   }
  DashboardAdminResponse.fromJson(Map <String,dynamic> json  ){
      this.avatar = json["avatar"] != null ? json["avatar"].toString() : '';
      this.name = json["name"] != null ? json["name"].toString() : '';
      this.number_notification = ParseNumber.parseInt(json['number_notification']);
      this.role_name = json["role_name"] != null ? json["role_name"].toString() : '';
      this.exchange_rate = json["exchange_rate"] != null ? json["exchange_rate"].toString() : '';
      this.order_waits = json["order_waits"] == null ? <DataOrderWaits>[] : json['order_waits'].map<DataOrderWaits>((e)=> DataOrderWaits.fromJson(e)).toList();
      this.order_closes = json["order_closes"] == null ? <DataOrderCloses>[] : json['order_closes'].map<DataOrderCloses>((e)=> DataOrderCloses.fromJson(e)).toList();
      this.orders = json["orders"] == null ? <DataTotalOrder>[] : json['orders'].map<DataTotalOrder>((e)=> DataTotalOrder.fromJson(e)).toList();
   }
}

class DataOrderCloses{
  int? id;
  String? bill_code;
  String? order_status;
  String? order_status_name;
  String? name;
  String? phone;
  int? number_package;
  int? number_package_remain;
  int? number_package_moved;
  String? item;
  int? transport_fee;
  int? transport_vn_fee;
  int? surcharge;
  String? created_at;
  String? updated_at;

  DataOrderCloses({
    this.id,
    this.bill_code,
    this.order_status,
    this.order_status_name,
    this.number_package,
    this.item,
    this.name,
    this.number_package_moved,
    this.number_package_remain,
    this.phone,
    this.surcharge,
    this.transport_fee,
    this.transport_vn_fee,
    this.updated_at,
    this.created_at
  });

  DataOrderCloses.empty(){
    this.id = -1;
    this.bill_code = '';
    this.order_status = '';
    this.order_status_name = '';
    this.number_package = -1;
    this.item = '';
    this.number_package_remain = -1;
    this.number_package_moved = -1;
    this.name = '';
    this.phone = '';
    this.transport_fee = -1;
    this.transport_vn_fee = -1;
    this.surcharge = -1;
    this.updated_at = '';
    this.created_at = '';
  }

  DataOrderCloses.fromJson(Map<String, dynamic> json){
    this.id = ParseNumber.parseInt(json['id']);
    this.bill_code = json['bill_code'] != null ? json['bill_code'] : '';
    this.order_status = json['order_status'] != null ? json['order_status'] : '';
    this.order_status_name = json['order_status_name'] != null ? json['order_status_name'] : '';
    this.number_package = ParseNumber.parseInt(json['number_package']);
    this.item = json['item'] != null ? json['item'] : '';
    this.name = json['name'] != null ? json['name'] : '';
    this.phone = json['phone'] != null ? json['phone'] : '';
    this.transport_fee = ParseNumber.parseInt(json['transport_fee']);
    this.number_package = ParseNumber.parseInt(json['number_package']);
    this.number_package_remain = ParseNumber.parseInt(json['number_package_remain']);
    this.number_package_moved = ParseNumber.parseInt(json['number_package_moved']);
    this.transport_vn_fee = ParseNumber.parseInt(json['transport_vn_fee']);
    this.surcharge = ParseNumber.parseInt(json['surcharge']);
    this.updated_at = json['updated_at'] != null ? json['updated_at'] : '';
    this.created_at = json['created_at'] != null ? json['created_at'] : '';
  }

}
class DataOrderWaits {
  int? order_wait;
  String? time;
  int? percent;

  DataOrderWaits({
    this.order_wait,
    this.time,
    this.percent,
  });
  DataOrderWaits.empty(){
    this.order_wait = -1;
    this.time = '';
    this.percent = -1;
  }

  DataOrderWaits.fromJson(Map<String, dynamic> json) {
    order_wait = ParseNumber.parseInt(json['order_wait']);
    time = json['time'] != null ? json['time'] : '';
    percent = ParseNumber.parseInt(json['percent']);
  }

}

class DataTotalOrder {
  int? order;
  String? time;
  int? percent;

  DataTotalOrder({
    this.order,
    this.time,
    this.percent,
  });
  DataTotalOrder.empty(){
    this.order = -1;
    this.time = '';
    this.percent = -1;
  }

  DataTotalOrder.fromJson(Map<String, dynamic> json) {
    order = ParseNumber.parseInt(json['order']);
    time = json['time'] != null ? json['time'] : '';
    percent = ParseNumber.parseInt(json['percent']);
  }

}