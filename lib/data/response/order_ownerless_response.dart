class OrderOwnerlessResponse {
  List<DataOrderOwnerless>? data;

  OrderOwnerlessResponse({this.data});

  OrderOwnerlessResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataOrderOwnerless>[];
      json['data'].forEach((v) {
        data!.add(new DataOrderOwnerless.fromJson(v));
      });
    }
  }
}

class DataOrderOwnerless {
  int? id;
  String? billCode;
  String? orderStatus;
  String? orderStatusName;
  String? item;
  dynamic transportFee;
  String? createdAt;
  String? updatedAt;
  List<String>? image;
  String? name;
  String? phone;
  int? numberPackage;
  dynamic surcharge;

  DataOrderOwnerless({
    this.id,
    this.billCode,
    this.orderStatus,
    this.orderStatusName,
    this.numberPackage,
    this.item,
    this.transportFee,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.name,
    this.phone,
    this.surcharge,
  });

  DataOrderOwnerless.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    billCode = json['bill_code'] ?? '';
    orderStatus = json['order_status'] ?? '';
    orderStatusName = json['order_status_name'] ?? '';
    numberPackage = json['number_package'] ?? 0;
    item = json['item'] ?? '';
    transportFee = json['transport_fee'] ?? 0.0;
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    image = json['image'] != null
        ? (json['image'] as List).map((e) => e.toString()).toList()
        : null;
    name = json['name'] ?? '';
    phone = json['phone'] ?? '';
    surcharge = json['surcharge'] ?? 0.0;
  }
}
