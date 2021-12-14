import 'package:viet_trung_mobile_admin/ulti/helper/parse_number_from_json.dart';

class ProfileResponse {
  DataProfile? data;

  ProfileResponse({this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] != null ? DataProfile.fromJson(json['data']) : null;
  }
}

class DataProfile {
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? user_code;
  int? is_admin;

  DataProfile({
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.user_code,
    this.is_admin,
  });

  DataProfile.fromJson(Map<String, dynamic> json) {
    name = json["name"] != null ? json["name"] : '';
    email = json["email"] != null ? json["email"] : '';
    phone = json["phone"] != null ? json["phone"] : '';
    avatar = json["avatar"] != null ? json["avatar"] : '';
    user_code = json["user_code"] != null ? json["user_code"] : '';
    is_admin = ParseNumber.parseInt(json['is_admin']);
  }
}
