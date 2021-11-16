class AuthRequest {
  String? email;
  String? name;
  String? phone;
  String? password;
  String? password_confirmation;
  int? city_id;
  int? district_id;
  int? wards_id;
  String? address;
  

  AuthRequest(
      {this.email,
        this.phone,
        this.password,
        this.password_confirmation,
        this.name,
        this.city_id,
        this.district_id,
        this.wards_id,
        this.address,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['password_confirmation'] = this.password_confirmation;
    data['city_id'] = this.city_id;
    data['district_id'] = this.district_id;
    data['wards_id'] = this.wards_id;
    data['address'] = this.address;

    return data;
  }
}
