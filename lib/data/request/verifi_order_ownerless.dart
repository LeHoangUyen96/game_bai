class VerifiOrderOwnerlessRequest {
  int? orderId;
  int? userId;
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
    this.userId,
    this.wardId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['address'] = this.address;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['wards_id'] = this.wardId;
    data['emaifl'] = this.email;
    data['phone'] = this.phone;
    data['transport_form_id'] = this.transportId;
    data['packing_form_id'] = this.packingId;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    return data;
  }
}
