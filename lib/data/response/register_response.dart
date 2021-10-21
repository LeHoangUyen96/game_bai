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
  String? username;
  String? avatar;
  String? user_no;
  String? name;
  String? phone;
  String? email;
  int? type;

  Data(
      {this.username,
        this.avatar,
        this.user_no,
        this.name,
        this.phone,
        this.type,
        this.email,});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    avatar = json['avatar'];
    user_no = json['user_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['user_no'] = this.user_no;
    return data;
  }
}