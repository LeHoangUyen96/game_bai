import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class DetailUserResponse {
  DataDetailUser? data;

  DetailUserResponse({
    this.data,
  });

  DetailUserResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] != null ? DataDetailUser.fromJson(json['data']) : null;
  }
}

class DataDetailUser {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? user_code;
  List<DataAddresses>? addresses;

  DataDetailUser({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.user_code,
    this.addresses,
  });
  DataDetailUser.empty() {
    this.id = -1;
    this.name = '';
    this.email = '';
    this.phone = '';
    this.avatar = '';
    this.user_code = '';
  }

  DataDetailUser.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id']);
    this.name = json['name'] != null ? json['name'] : '';
    this.email = json['email'] != null ? json['email'] : '';
    this.phone = json['phone'] != null ? json['phone'] : '';
    this.avatar = json['avatar'] != null ? json['avatar'] : '';
    this.user_code = json['user_code'] != null ? json['user_code'] : '';
    this.addresses = json["addresses"] == null
        ? <DataAddresses>[]
        : json['addresses']
            .map<DataAddresses>((e) => DataAddresses.fromJson(e))
            .toList();
  }
}

class DataAddresses {
  int? id;
  String? name;
  String? phone;
  int? city_id;
  String? city_name;
  int? district_id;
  String? district_name;
  int? wards_id;
  String? wards_name;
  String? address;
  String? full_address;
  int? defaults;

  DataAddresses(
      {this.id,
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
      this.defaults});

  DataAddresses.fromJson(Map<String, dynamic> json) {
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
