class ErrorResponse {
  final String? message;
  final Error? error;

  ErrorResponse({this.message, this.error});

  ErrorResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        error = json['errors'] != null ? Error.fromJson(json['errors']) : null;

  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['message'] = this.message;
  //   data['statusCode'] = this.statusCode;
  //   return data;
  // }
}

class Error {
  final List<String>? emailError;
  final List<String>? passwordError;
  final List<String>? namedError;
  final List<String>? phoneError;
  final List<String>? billCodeError;

  Error(
      {this.emailError,
      this.passwordError,
      this.namedError,
      this.phoneError,
      this.billCodeError});

  Error.fromJson(Map<String, dynamic> json)
      : emailError = json['email'] != null
            ? (json['email'] as List).map((e) => e.toString()).toList()
            : null,
        passwordError = json['password'] != null
            ? (json['password'] as List).map((e) => e.toString()).toList()
            : null,
        namedError = json['username'] != null
            ? (json['username'] as List).map((e) => e.toString()).toList()
            : null,
        phoneError = json['phone'] != null
            ? (json['phone'] as List).map((e) => e.toString()).toList()
            : null,
        billCodeError = json['bill_code'] != null
            ? (json['bill_code'] as List).map((e) => e.toString()).toList()
            : null;
}
