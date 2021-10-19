import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class ProfileResponse {
  final DataProfile? dataProfile;

  ProfileResponse({this.dataProfile});

  ProfileResponse.fromJson(Map<String, dynamic> json) : dataProfile = json['data'] != null ? DataProfile.fromJson(json['data']) : null;
}

class DataProfile {
  int ? id;
  String? name;
  String? email;
  String? phone;
  String? username;
  int? type;
  String? avatar;
  String? user_no;
  int? gender;
  String? birthday;
  String? pass_post;
  String? update_password;
  DataProfileExChangeRate? exchange_rate;
  DataProfileCurrentBalance? current_balance;

  DataProfile({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.username,
    this.user_no,
    this.type,
    this.avatar,
    this.birthday,
    this.gender,
    this.pass_post,
    this.update_password,
    this.exchange_rate,
    this.current_balance,
  });

  DataProfile.fromJson(Map<String, dynamic> json) {
    this.id = ParseNumber.parseInt(json['id'],fault: -1);
    name = json['name'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    type = json['type'];
    avatar = json['avatar'];
    user_no = json['user_no'];
    gender = json['gender'];
    birthday = json['birthday'];
    pass_post = json['passport'];
    update_password = json['update_password'];
    exchange_rate = json["exchange_rate"] != null ? DataProfileExChangeRate.fromJson(json["exchange_rate"]) : DataProfileExChangeRate.empty();
    current_balance = json["current_balance"] != null ? DataProfileCurrentBalance.fromJson(json["current_balance"]) : DataProfileCurrentBalance.empty();
  }
}

class DataProfileExChangeRate {
  // ignore: non_constant_identifier_names
  double? value;

  // ignore: non_constant_identifier_names
  String? currencyUnit;

  DataProfileExChangeRate({
    // ignore: non_constant_identifier_names
    this.value,
    // ignore: non_constant_identifier_names
    this.currencyUnit,
  });

  DataProfileExChangeRate.empty() {
    this.value = 0.0;
    this.currencyUnit = '';
  }

  DataProfileExChangeRate.fromJson(dynamic json) {
    value = json["value"] != null ? (json["value"] is int ? json["value"].toDouble() : (json["value"] is String ? double.parse(json["value"]) : json["value"])) : 0.0;
    currencyUnit = json["currencyUnit"] != null ? json["currencyUnit"].toString() : '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["value"] = value;
    map["currencyUnit"] = currencyUnit;
    return map;
  }
}

class DataProfileCurrentBalance {
  // ignore: non_constant_identifier_names
  double? value;

  // ignore: non_constant_identifier_names
  String? currencyUnit;

  DataProfileCurrentBalance({
    // ignore: non_constant_identifier_names
    this.value,
    // ignore: non_constant_identifier_names
    this.currencyUnit,
  });

  DataProfileCurrentBalance.empty() {
    this.value = 0.0;
    this.currencyUnit = '';
  }

  DataProfileCurrentBalance.fromJson(dynamic json) {
    value = json["value"] != null ? (json["value"] is int ? json["value"].toDouble() : (json["value"] is String ? double.parse(json["value"]) : json["value"])) : 0.0;
    currencyUnit = json["currencyUnit"] != null ? json["currencyUnit"].toString() : '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["value"] = value;
    map["currencyUnit"] = currencyUnit;
    return map;
  }
}
