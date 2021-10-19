class EditProfileRequest {
  String? first_name;
  String? phone;
  int? gender;
  String? birthday;
  String? pass_post;

  EditProfileRequest(
      {this.first_name,
        this.phone,
        this.gender,
        this.birthday,
        this.pass_post
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.first_name;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['passport'] = this.pass_post;
    return data;
  }
}
