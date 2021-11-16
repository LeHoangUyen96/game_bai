class RegisterResponse {
  final String? message;
  final Data? data;

  RegisterResponse({this.message, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'] != null ? Data.fromJson(json['data']) : null;

//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['message'] = this.message;
//   data['statusCode'] = this.statusCode;
//   return data;
// }
}

class Data {
  String? avatar;
  String? user_code;
  String? name;
  String? phone;
  String? email;

  Data(
      {
        this.avatar,
        this.user_code,
        this.name,
        this.phone,
        this.email,});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    user_code = json['user_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['user_code'] = this.user_code;
    return data;
  }
}