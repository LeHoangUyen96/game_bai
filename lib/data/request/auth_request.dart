class AuthRequest {
  String? email;
  String? phone;
  String? password;
  String? password_confirmation;
  String? name;

  AuthRequest(
      {this.email,
        this.phone,
        this.password,
        this.password_confirmation,
        this.name
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['password_confirmation'] = this.password_confirmation;

    return data;
  }
}
