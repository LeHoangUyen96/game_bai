class EditProfileRequest {
  String? phone;
  String? name;
  String? email;

  EditProfileRequest({
    this.phone,
    this.email,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}
