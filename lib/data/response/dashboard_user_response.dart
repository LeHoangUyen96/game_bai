import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class DashboardUsesResponse {
  String? avatar;
  String? name;
  int? number_notification;
  int? number_goods_arrive;
  int? number_goods_storage;
  List<DataOrdersArrive>? orders_arrive;

  DashboardUsesResponse({
    this.avatar,
    this.name,
    this.number_notification,
    this.number_goods_arrive,
    this.number_goods_storage,
    this.orders_arrive,
  });

  DashboardUsesResponse.empty() {
    this.avatar = '';
    this.name = '';
    this.number_notification = -1;
    this.number_goods_arrive = -1;
    this.number_goods_storage = -1;
  }
  DashboardUsesResponse.fromJson(Map<String, dynamic> json) {
    this.avatar = json["avatar"] != null ? json["avatar"].toString() : '';
    this.name = json["name"] != null ? json["name"].toString() : '';
    this.number_notification =
        ParseNumber.parseInt(json['number_notification']);
    this.number_goods_arrive =
        ParseNumber.parseInt(json['number_goods_arrive']);
    this.number_goods_storage =
        ParseNumber.parseInt(json['number_goods_storage']);
    this.orders_arrive = json["orders_arrive"] == null
        ? <DataOrdersArrive>[]
        : json['orders_arrive']
            .map<DataOrdersArrive>((e) => DataOrdersArrive.fromJson(e))
            .toList();
  }
}

class DataOrdersArrive {
  int? id;
  String? bill_code;
  String? order_status;
  String? order_status_name;
  int? number_package;
  String? item;
  String? packing_form;
  String? delivery_form;
  String? address;
  double? transport_fee;
  String? created_at;
  String? updated_at;

  DataOrdersArrive(
      {this.id,
      this.bill_code,
      this.order_status,
      this.order_status_name,
      this.number_package,
      this.item,
      this.packing_form,
      this.delivery_form,
      this.address,
      this.transport_fee,
      this.updated_at,
      this.created_at});

  DataOrdersArrive.empty() {
    this.id = -1;
    this.bill_code = '';
    this.order_status = '';
    this.order_status_name = '';
    this.number_package = -1;
    this.item = '';
    this.packing_form = '';
    this.delivery_form = '';
    this.address = '';
    this.transport_fee = 0.0;
    this.updated_at = '';
    this.created_at = '';
  }

  DataOrdersArrive.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id']);
    this.bill_code = json['bill_code'] != null ? json['bill_code'] : '';
    this.order_status =
        json['order_status'] != null ? json['order_status'] : '';
    this.order_status_name =
        json['order_status_name'] != null ? json['order_status_name'] : '';
    this.number_package = ParseNumber.parseInt(json['number_package']);
    this.item = json['item'] != null ? json['item'] : '';
    this.packing_form =
        json['packing_form'] != null ? json['packing_form'] : '';
    this.delivery_form =
        json['delivery_form'] != null ? json['delivery_form'] : '';
    this.address = json['address'] != null ? json['address'] : '';
    this.transport_fee = ParseNumber.parseDouble(json['transport_fee']);
    this.updated_at = json['updated_at'] != null ? json['updated_at'] : '';
    this.created_at = json['created_at'] != null ? json['created_at'] : '';
  }
}
