class ForgotErrorResponse {
  String? message;

  ForgotErrorResponse(
      {this.message});

  ForgotErrorResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'] != null ? json['message']  : '';

//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['message'] = this.message;
//   data['statusCode'] = this.statusCode;
//   return data;
// }
}
