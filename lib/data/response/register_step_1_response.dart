class RegisterStep1Response {
  final String? message;
   List<Errors>? errors;
  final Data ? data;

  RegisterStep1Response({this.message, this.errors, this.data});

  RegisterStep1Response.fromJson(Map<String, dynamic> json)
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
  String? name;
  String? phone;
  String? email;

  Errors(
      {
        this.name,
        this.phone,
        this.email,});

  Errors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}