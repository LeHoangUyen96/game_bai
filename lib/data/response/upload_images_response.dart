
class UploadImagesResponse {
  String? message;
  DataRegisterAddress? data;

  UploadImagesResponse({this.message,this.data});

  UploadImagesResponse.fromJson(Map<String,dynamic> json){
    message = json['message'];
    data = json['data'] != null ? DataRegisterAddress.fromJson(json['data']) : null;
  }
}

class DataRegisterAddress {
  String? file;

  DataRegisterAddress({
    this.file
  });

  DataRegisterAddress.fromJson(Map<String, dynamic> json) {
    file = json['avatar'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['file'] = this.file;
  //   return data;
  // }

}