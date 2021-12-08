class OrderAdminDetailResponse {
  DataOrderAdminDetail? data;

  OrderAdminDetailResponse({
    this.data,
  });

  OrderAdminDetailResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? DataOrderAdminDetail.fromJson(json['data'])
        : null;
  }
}

class DataOrderAdminDetail {
  int? id;
  String? billCode;
  int? type;
  String? orderStatus;
  String? orderStatusName;
  String? name;
  String? phone;
  int? numberPackage;
  String? item;
  int? productId;
  dynamic transportFee;
  String? createdAt;
  String? updatedAt;
  List<String>? image;
  String? packingForm;
  int? packingFormId;
  String? transportForm;
  int? transportFormId;
  dynamic weight;
  dynamic volume;
  String? deliveryForm;
  dynamic transpotVNFee;
  dynamic surcharge;
  String? note;
  String? storageReceive;
  String? storageReceiveCode;
  List<OrderJourney>? orderJouney;

  DataOrderAdminDetail({
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
    this.deliveryForm,
    this.note,
    this.packingForm,
    this.packingFormId,
    this.productId,
    this.storageReceive,
    this.storageReceiveCode,
    this.transportForm,
    this.transportFormId,
    this.transpotVNFee,
    this.type,
    this.volume,
    this.weight,
    this.orderJouney,
  });

  DataOrderAdminDetail.fromJson(Map<String, dynamic> json) {
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
    storageReceive = json['storage_receive'] ?? '';
    storageReceiveCode = json['storage_receive_code'] ?? '';
    productId = json['product_id'] ?? 0;
    surcharge = json['surcharge'] ?? 0.0;
    packingForm = json['packing_form'] ?? '';
    packingFormId = json['packing_form_id'] ?? 0;
    transportForm = json['transport_form'] ?? '';
    transportFormId = json['transport_form_id'] ?? 0;
    weight = json['weight'] ?? '';
    volume = json['volume'] ?? '';
    deliveryForm = json['delivery_form'] ?? '';
    transpotVNFee = json['transport_vn_fee'] ?? '';
    note = json['note'] ?? '';
    if (json['order_journey'] != null) {
      orderJouney = <OrderJourney>[];
      json['order_journey'].forEach((v) {
        orderJouney!.add(OrderJourney.fromJson(v));
      });
    }
  }
}

class OrderJourney {
  String? statusName;
  String? createdAt;
  OrderJourney({
    this.createdAt,
    this.statusName,
  });
  OrderJourney.fromJson(Map<String, dynamic> json) {
    statusName = json['status_name'] ?? '';
    createdAt = json['created_at'] ?? '';
  }
}
