import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class CreateAdminResponse {
  String? message;
  DataCreateAdmin? data;

  CreateAdminResponse({this.message,this.data});

  CreateAdminResponse.fromJson(Map<String,dynamic> json){
    message = json['message'];
    data = json['data'] != null ? DataCreateAdmin.fromJson(json['data']) : null;
  }
}

class DataCreateAdmin {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? avatar;
  String? user_code;

  DataCreateAdmin({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.avatar,
    this.user_code,
  });

  DataCreateAdmin.fromJson(Map<String, dynamic> json) {
    id = ParseNumber.parseInt(json['id']);
    name = json['name'] != null ? json['name'] : '';
    phone = json['phone'] != null ? json['phone'] : '';
    email = json['email'] != null ? json['email'] : '';
    avatar = json['avatar'] != null ? json['avatar'] : '';
    user_code = json['user_code'] != null ? json['user_code'] : '';
  }

  
}