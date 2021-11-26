class ErrorsEnterWarehouseResponse {
  final String? message;
  final Errors? errors;

  ErrorsEnterWarehouseResponse({this.message, this.errors});

  ErrorsEnterWarehouseResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;

  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['message'] = this.message;
  //   data['statusCode'] = this.statusCode;
  //   return data;
  // }
}

class Errors {
  final List<String>? bill_code;
  final List<String>? item;
  final List<String>? number_package;
  final List<String>? is_prohibited_item;

  Errors(
      {this.bill_code, this.item, this.number_package, this.is_prohibited_item});

  Errors.fromJson(Map<String, dynamic> json)
      : bill_code = json['bill_code'] != null
      ? (json['bill_code'] as List).map((e) => e.toString()).toList()
      : null,
        item = json['item'] != null
            ? (json['item'] as List).map((e) => e.toString()).toList()
            : null,
        number_package = json['number_package'] != null
            ? (json['number_package'] as List).map((e) => e.toString()).toList()
            : null,
        is_prohibited_item = json['is_prohibited_item'] != null
            ? (json['is_prohibited_item'] as List).map((e) => e.toString()).toList()
            : null;
}