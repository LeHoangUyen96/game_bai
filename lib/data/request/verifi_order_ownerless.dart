class VerifiOrderOwnerlessRequest {
  int? orderId;
  String? email;
  String? name;
  String? phone;
  int? cityId;
  int? districtId;
  int? wardId;
  String? address;
  int? type;
  int? transportId;
  int? packingId;
  String? note;

  VerifiOrderOwnerlessRequest({
    this.address,
    this.cityId,
    this.districtId,
    this.email,
    this.name,
    this.orderId,
    this.packingId,
    this.phone,
    this.transportId,
    this.type,
    this.wardId,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['address'] = this.address;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['wards_id'] = this.wardId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['transport_form_id'] = this.transportId;
    data['packing_form_id'] = this.packingId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['note'] = this.note;
    return data;
  }
}

class VerifiOrderConfirmRequest {
  int? orderId;
  int? userId;
  String? name;
  int? type;
  int? transportId;
  int? packingId;
  String? note;

  VerifiOrderConfirmRequest({
    this.name,
    this.orderId,
    this.packingId,
    this.transportId,
    this.type,
    this.userId,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['transport_form_id'] = this.transportId;
    data['packing_form_id'] = this.packingId;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['note'] = this.note;
    return data;
  }
}
