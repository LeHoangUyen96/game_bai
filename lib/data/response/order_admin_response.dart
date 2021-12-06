class OrderAdminResponse {
  List<DataOrderAdmin>? data;
  Paginate? paginate;

  OrderAdminResponse({
    this.data,
    this.paginate,
  });

  OrderAdminResponse.fromJson(Map<String, dynamic> json) {
    paginate =
        json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null;
    if (json['data'] != null) {
      data = <DataOrderAdmin>[];
      json['data'].forEach((v) {
        data!.add(new DataOrderAdmin.fromJson(v));
      });
    }
  }
}

class DataOrderAdmin {
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

  DataOrderAdmin({
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

  DataOrderAdmin.fromJson(Map<String, dynamic> json) {
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

class Paginate {
  int? total;
  Paginate({
    this.total,
  });
  Paginate.fromJson(Map<String, dynamic> json) {
    total = json['total'] ?? 0;
  }
}
