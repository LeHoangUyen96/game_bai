class ConfirmPassRequest {
  String? email;
  String? code;
  String? pass;
  String? confirmPass;

  ConfirmPassRequest({
    this.email,
    this.code,
    this.pass,
    this.confirmPass,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['email'] = this.email;
    data['password'] = this.pass;
    data['password_confirmation'] = this.confirmPass;
    return data;
  }
}
