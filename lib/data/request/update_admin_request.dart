class UpdateAdminRequest {
  String? user_code;
  String? name;
  String? phone;
  String? email;
  String? role_id;
  String? avatar;

  UpdateAdminRequest({
    this.user_code,
    this.name,
    this.phone,
    this.email,
    this.role_id,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_code'] = this.user_code;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['role_id'] = this.role_id;
    data['avatar'] = this.avatar;
    return data;
  }
}