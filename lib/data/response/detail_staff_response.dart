import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class DetailStaffResponse{
  DataDetailStaff? data;
  
  DetailStaffResponse({
    this.data,
    });

  DetailStaffResponse.fromJson(Map<String, dynamic> json){
    this.data = json['data'] != null ? DataDetailStaff.fromJson(json['data']) : null;
  }

}


class DataDetailStaff{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String ? user_code;
  int ? status;

  DataDetailStaff({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.user_code,
    this.status,
  });
   DataDetailStaff.empty(){
    this.id = -1 ;
    this.name = '' ;
    this.email = '';
    this.phone = '' ;
    this.avatar = '' ;
    this.user_code = '' ;
    this.status = -1;
 
  }

  DataDetailStaff.fromJson(Map<String, dynamic> json){
    this.id = ParseNumber.parseInt(json['id']);
    this.name = json['name'] != null ? json['name'] : '';
    this.email = json['email'] != null ? json['email'] : '';
    this.phone = json['phone'] != null ? json['phone'] : '';
    this.avatar = json['avatar'] != null ? json['avatar'] : '';
    this.user_code = json['user_code'] != null ? json['user_code'] : '';
    this.status = ParseNumber.parseInt(json['status']);
  }

}