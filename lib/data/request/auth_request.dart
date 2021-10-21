class AuthRequest {
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;
  String? userName;
  String? name;

  AuthRequest(
      {this.email,
        this.phone,
        this.password,
        this.confirmPassword,
        this.userName,
        this.name
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.userName;
    data['first_name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['password_confirmation'] = this.confirmPassword;

    return data;
  }
}
