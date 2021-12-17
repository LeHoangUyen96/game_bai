class ReviewDetailResponse {
  DataReviewDetail? data;
  ReviewDetailResponse({this.data});
  ReviewDetailResponse.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? DataReviewDetail.fromJson(json['data']) : null;
  }
}

class DataReviewDetail {
  int? id;
  int? star;
  String? createdAt;
  String? comment;
  Order? order;
  DataReviewDetail({
    this.id,
    this.star,
    this.comment,
    this.createdAt,
    this.order,
  });
  DataReviewDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    star = json['star'] ?? 0;
    createdAt = json['created_at'] ?? '';
    comment = json['comment'] ?? '';
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
}

class Order {
  int? id;
  int? star;
  String? createdAt;
  String? billCode;
  int? numberPackage;
  String? productName;
  String? transportForm;
  String? packingForm;
  dynamic transportFee;
  String? deliveryForm;

  Order({
    this.id,
    this.star,
    this.billCode,
    this.createdAt,
    this.numberPackage,
    this.productName,
    this.deliveryForm,
    this.packingForm,
    this.transportFee,
    this.transportForm,
  });
  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    star = json['star'] ?? 0;
    billCode = json['bill_code'] ?? '';
    createdAt = json['created_at'] ?? '';
    numberPackage = json['number_package'] ?? '';
    productName = json['product_name'] ?? '';
    deliveryForm = json['delivery_form'] ?? '';
    packingForm = json['packing_form'] ?? '';
    transportForm = json['transport_form'] ?? '';
    transportFee = json['transport_fee'] ?? '';
  }
}
