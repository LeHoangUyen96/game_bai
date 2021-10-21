class RegisterAddressResponse {
  String? message;
  DataRegisterAddress? data;

  RegisterAddressResponse({this.message,this.data});

  RegisterAddressResponse.fromJson(Map<String,dynamic> json){
    message = json['message'];
    data = json['data'] != null ? DataRegisterAddress.fromJson(json['data']) : null;
  }
}

class DataRegisterAddress {
  dynamic? id;
  String? name;
  String? phone;
  dynamic? city_id;
  String? city_name;
  dynamic? district_id;
  String? district_name;
  dynamic? wards_id;
  String? wards_name;
  String? address;
  String? full_address;
  dynamic? defaults;

  DataRegisterAddress({
    this.id,
    this.name,
    this.phone,
    this.city_id,
    this.city_name,
    this.district_id,
    this.district_name,
    this.wards_id,
    this.wards_name,
    this.address,
    this.full_address,
    this.defaults
  });

  DataRegisterAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    city_id = json['city_id'];
    city_name = json['city_name'];
    district_id = json['district_id'];
    district_name = json['district_name'];
    wards_id = json['wards_id'];
    wards_name = json['wards_name'];
    address = json['address'];
    full_address = json['full_address'];
    defaults = json['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['city_id'] = this.city_id;
    data['city_name'] = this.city_name;
    data['district_id'] = this.district_id;
    data['district_name'] = this.district_name;
    data['wards_id'] = this.wards_id;
    data['wards_name'] = this.wards_name;
    data['address'] = this.address;
    data['full_address'] = this.full_address;
    data['default'] = this.defaults;
    return data;
  }

}