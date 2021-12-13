import 'dart:convert';

class ErrorCreateAdminResponse {
  final String? message;
  final Error? error;

  ErrorCreateAdminResponse({this.message, this.error});

  ErrorCreateAdminResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        error = json['errors'] != null ? Error.fromJson(json['errors']) : null;

 
}

class Error {
  final List<String>? user_code;
  final List<String>? name;
  final List<String>? phone;
  final List<String>? email;
  final List<String>? address;

  Error(
      {this.user_code, this.name, this.phone, this.email,this.address});

  Error.fromJson(Map<String, dynamic> json)
      : user_code = json['user_code'] != null
      ? (json['user_code'] as List).map((e) => e.toString()).toList()
      : null,
        name = json['name'] != null
            ? (json['name'] as List).map((e) => e.toString()).toList()
            : null,
        phone = json['phone'] != null
            ? (json['phone'] as List).map((e) => e.toString()).toList()
            : null,
        email = json['email'] != null
            ? (json['email'] as List).map((e) => e.toString()).toList()
            : null,
        address = json['address'] != null
          ? (json['address'] as List).map((e) => e.toString()).toList()
          : null;    
}