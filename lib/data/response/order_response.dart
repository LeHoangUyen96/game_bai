class OrderResponse {
  List<DataOrder>? data;

  OrderResponse({this.data});

  OrderResponse.fromJson(Map<String,dynamic> json){
    if (json['data'] != null) {
      data = <DataOrder>[];
      json['data'].forEach((v) {
        data!.add(new DataOrder.fromJson(v));
      });
    }
  }
}

class DataOrder {
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

  DataOrder({
    this.id,
    this.bill_code,
    this.order_status,
    this.order_status_name,
    this.number_package,
    this.item,
    this.packing_form,
    this.delivery_form,
    this.address,
    this.transport_fee,
    this.created_at,
    this.updated_at,

  });

  DataOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bill_code = json['bill_code'];
    order_status = json['order_status'];
    order_status_name = json['order_status_name'];
    number_package = json['number_package'];
    item = json['item'];
    packing_form = json['packing_form'];
    delivery_form = json['delivery_form'];
    address = json['address'];
    transport_fee = json['transport_fee'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bill_code'] = this.bill_code;
    data['order_status'] = this.order_status;
    data['order_status_name'] = this.order_status_name;
    data['number_package'] = this.number_package;
    data['item'] = this.item;
    data['packing_form'] = this.packing_form;
    data['delivery_form'] = this.delivery_form;
    data['address'] = this.address;
    data['transport_fee'] = this.transport_fee;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    return data;
  }

}