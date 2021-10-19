
class User {
  String? username;
  String? avatar;
  String? id;
  String? name;
  String? phone;
  String? email;
  int? type;
  String? token;

  User(
      {this.username,
        this.avatar,
        this.id,
        this.name,
        this.phone,
        this.type,
        this.email,
        this.token
      });

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    avatar = json['avatar'];
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    type = json['type'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['_id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}