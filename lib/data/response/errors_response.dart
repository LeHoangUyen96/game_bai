class ErrorsResponse {
  String? message;

  ErrorsResponse(
      {this.message});

  ErrorsResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'] != null ? json['message']  : '';

}