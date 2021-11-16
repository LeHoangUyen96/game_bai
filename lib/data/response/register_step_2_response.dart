class RegisterStep2Response {
  final String? message;
   List<Errors>? errors;
  final Data ? data;

  RegisterStep2Response({this.message, this.errors, this.data});

  RegisterStep2Response.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        errors = json["errors"] == null ? <Errors>[] : json['errors'].map<Errors>((e)=> Errors.fromJson(e)).toList(),
        data = json['data'] != null ? Data.fromJson(json['data']) : null;
}
class Data{
  bool? status;
  Data({
    this.status,
  });
  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }
}

class Errors {
  String? city_id;
  String? district_id;
  String? wards_id;
  String? address;

  Errors(
      {
        this.city_id,
        this.district_id,
        this.wards_id,
        this.address,
        });

  Errors.fromJson(Map<String, dynamic> json) {
    city_id = json['city_id'];
    district_id = json['district_id'];
    wards_id = json['wards_id'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.city_id;
    data['district_id'] = this.district_id;
    data['wards_id'] = this.wards_id;
    data['address'] = this.address;
    return data;
  }
}