class UpdateCustomerRequest {
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? userCode;
  String? address;
  int? cityId;
  int? districtId;
  int? wardsId;

  UpdateCustomerRequest({
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.userCode,
    this.address,
    this.cityId,
    this.districtId,
    this.wardsId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['user_code'] = this.userCode;
    data['address'] = this.address;
    data['avatar'] = this.avatar;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['wards_id'] = this.wardsId;
    return data;
  }
}
