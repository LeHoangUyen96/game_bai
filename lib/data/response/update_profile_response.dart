class UpdateProfileResponse {
  final String? message;
  final DataProfile? data;

  UpdateProfileResponse({this.message, this.data});

  UpdateProfileResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'] != null ? DataProfile.fromJson(json['data']) : null;

//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['message'] = this.message;
//   data['statusCode'] = this.statusCode;
//   return data;
// }
}

class DataProfile{
  String? name;
  String? email;
  String? phone;
  String? username;
  int? type;
  String? avatar;
  String? user_no;
  int? gender;
  String? birthday;
  String? pass_post;
  String? update_password;

  DataProfile({
    this.name,
    this.email,
    this.phone,
    this.username,
    this.user_no,
    this.type,
    this.avatar,
    this.birthday,
    this.gender,
    this.pass_post,
    this.update_password
  });

  DataProfile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        username = json['username'],
        phone = json['phone'],
        type = json['type'],
        avatar = json['avatar'],
        user_no = json['user_no'],
        gender = json['gender'],
        birthday = json['birthday'],
        pass_post = json['pass_post'],
        update_password = json['update_password'];

}