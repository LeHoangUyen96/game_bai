class ForgotPassResponse {
  final String? message;

  ForgotPassResponse({this.message});

  ForgotPassResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'];

//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['message'] = this.message;
//   data['statusCode'] = this.statusCode;
//   return data;
// }
}