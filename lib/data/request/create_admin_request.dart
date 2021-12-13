class CreateAdminRequest {
  String? user_code;
  String? name;
  int? phone;
  String? email;
  int? role_id;

  CreateAdminRequest(
      {this.user_code,
        this.name,
        this.phone,
        this.email,
        this.role_id
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_code'] = this.user_code;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['role_id'] = this.role_id;
    return data;
  }
}