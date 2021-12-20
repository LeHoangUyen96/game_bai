class ChangePassRequest {
  String? oldPass;
  String? newPass;
  String? confirmPass;

  ChangePassRequest({
    this.oldPass,
    this.confirmPass,
    this.newPass,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new_password'] = this.newPass;
    data['old_password'] = this.oldPass;
    data['new_password_confirmation'] = this.confirmPass;
    return data;
  }
}
