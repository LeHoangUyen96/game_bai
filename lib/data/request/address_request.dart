class AddressRequest {
  String? name;
  String? phone;
  int? city_id;
  int? district_id;
  int? wards_id;
  String? address;
  int? defaults;

  AddressRequest(
      {this.name,
        this.phone,
        this.city_id,
        this.district_id,
        this.wards_id,
        this.address,
        this.defaults
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['city_id'] = this.city_id;
    data['district_id'] = this.district_id;
    data['wards_id'] = this.wards_id;
    data['address'] = this.address;
    data['default'] = this.defaults;

    return data;
  }
}
