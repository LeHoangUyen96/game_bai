import 'dart:ffi';

import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class OrderAddToBagResponse {
  DataOrderAddToBag? data;

  OrderAddToBagResponse({
    this.data,
  });

  OrderAddToBagResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? DataOrderAddToBag.fromJson(json['data'])
        : null;
  }
}

class DataOrderAddToBag {
  int? id;
  String? billCode;
  double? transport_fee;
  String? name_customer;
  int? number_package;
  int? number_package_remain;
  int? number_package_moved;
  String? item;
  double? surcharge; 
 

  DataOrderAddToBag({
    this.id,
    this.billCode,
    this.transport_fee,
    this.name_customer,
    this.number_package,
    this.number_package_remain,
    this.number_package_moved,
    this.item,
    this.surcharge,
    
  });

  DataOrderAddToBag.fromJson( Map<String,dynamic> json) {
     this.id = ParseNumber.parseInt(id);
     this.billCode = json["billCode"] != null ? json["billCode"].toString() : '';
     this.transport_fee = ParseNumber.parseDouble(transport_fee);
     this.name_customer = json["name_customer"] != null ? json["name_customer"].toString() : '';
     this.number_package = ParseNumber.parseInt(number_package);
     this.number_package_remain = ParseNumber.parseInt(number_package_remain);
     this.number_package_moved = ParseNumber.parseInt(number_package_moved);
     this.item = json["item"] != null ? json["item"].toString() : '';
     this.surcharge = ParseNumber.parseDouble(surcharge);
    }
}