import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class FindUserResponse{
  String ? message;
  DataFindUser? data;
  
  FindUserResponse({
    this.message,
    this.data,
    });

  FindUserResponse.fromJson(Map<String, dynamic> json){
    this.message = json['message'];
    this.data = json['data'] != null ? DataFindUser.fromJson(json['data']) : null;
  }

}


class DataFindUser{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String ? user_code;
  int ? is_admin;

  DataFindUser({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.user_code,
    this.is_admin,
  });
   DataFindUser.empty(){
    this.id = -1 ;
    this.name = '' ;
    this.email = '';
    this.phone = '' ;
    this.avatar = '' ;
    this.user_code = '' ;
    this.is_admin = -1;
 
  }

  DataFindUser.fromJson(Map<String, dynamic> json){
    this.id = ParseNumber.parseInt(json['id']);
    this.name = json['name'] != null ? json['name'] : '';
    this.email = json['email'] != null ? json['email'] : '';
    this.phone = json['phone'] != null ? json['phone'] : '';
    this.avatar = json['avatar'] != null ? json['avatar'] : '';
    this.user_code = json['user_code'] != null ? json['user_code'] : '';
    this.is_admin = ParseNumber.parseInt(json['is_admin']);
  }

}