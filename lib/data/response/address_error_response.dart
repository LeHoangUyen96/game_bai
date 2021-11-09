class AddressErrorResponse {
  final String? message;
  final Error? error;

  AddressErrorResponse({this.message, this.error});

  AddressErrorResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        error = json['errors'] != null ? Error.fromJson(json['errors']) : null;

}

class Error {
  final List<String>? nameError;
  final List<String>? phoneError;
  final List<String>? addressError;
  final List<String>? cityError;
  final List<String>? districtError;
  final List<String>? wardsError;

  Error(
      {this.nameError, this.phoneError, this.addressError, this.cityError,this.districtError, this.wardsError});

  Error.fromJson(Map<String, dynamic> json)
      : nameError = json['name'] != null
      ? (json['name'] as List).map((e) => e.toString()).toList()
      : null,
        phoneError = json['phone'] != null
            ? (json['phone'] as List).map((e) => e.toString()).toList()
            : null,
        addressError = json['address'] != null
            ? (json['address'] as List).map((e) => e.toString()).toList()
            : null,
        cityError = json['city_id'] != null
            ? (json['city_id'] as List).map((e) => e.toString()).toList()
            : null,
        districtError = json['district_id'] != null
            ? (json['district_id'] as List).map((e) => e.toString()).toList()
            : null,
        wardsError = json['wards_id'] != null
            ? (json['wards_id'] as List).map((e) => e.toString()).toList()
            : null;
}