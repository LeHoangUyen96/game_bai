import 'package:viet_trung_mobile_admin/data/response/detail_staff_response.dart';

class UploadAdminResponse{
      String? message;
      DataDetailStaff? data;
  UploadAdminResponse({
    this.message,
    this.data,
    });

  UploadAdminResponse.fromJson(Map<String,dynamic> json){
    message = json['message'];
    data = json['data'] != null ? DataDetailStaff.fromJson(json['data']) : null;
  }
}