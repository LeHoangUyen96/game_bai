import 'package:flutter/material.dart';
import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class ListOrderAddBagResponse {
 List< DataListOrderAddBagResponse> ? data;
  ListOrderAddBagResponse ({
    this.data,
  });
  ListOrderAddBagResponse.fromJson(Map <String,dynamic> json  ){
     print('data.fromJson ${json} ');
      this.data = json["data"] == null ? <DataListOrderAddBagResponse>[] : json['data'].map<DataListOrderAddBagResponse>((e)=> DataListOrderAddBagResponse.fromJson(e)).toList();
   }
}

class  DataListOrderAddBagResponse {
    int? id;
    String? bill_code;
    double? transport_fee;
    int? number_package;
    int? number_package_remain;
    int? number_package_moved;
    String? name_customer;
    String? packing_form;
    String? item;
    double? surcharge;
    bool? isCheck;
   DataListOrderAddBagResponse({
    this.id,
    this.bill_code,
    this.number_package,
    this.transport_fee,
    this.name_customer,
    this.item,
    this.number_package_moved,
    this.number_package_remain,
    this.packing_form,
    this.surcharge,
    this.isCheck,
  });
    DataListOrderAddBagResponse.empty(){
     this.id = -1;
     this.bill_code= '';
     this.number_package = -1;
     this.transport_fee= 0.0;
     this.number_package_remain= -1;
     this.number_package_moved= -1;
     this.name_customer= '';
     this.item= '';
     this.surcharge= 0.0;
     this.packing_form ='';
     this.isCheck = false;
   }
    DataListOrderAddBagResponse.fromJson( Map<String,dynamic> json) {
     this.id = ParseNumber.parseInt(json['id']);
     this.bill_code = json["bill_code"] != null ? json["bill_code"].toString() : '';
     this.number_package = ParseNumber.parseInt(json['number_package']);
     this.transport_fee = ParseNumber.parseDouble(transport_fee);
     this.name_customer = json["name_customer"] != null ? json["name_customer"].toString() : '';
     this.item = json["item"] != null ? json["item"].toString() : '';
     this.number_package_remain = ParseNumber.parseInt(json['number_package_remain']);
     this.number_package_moved = ParseNumber.parseInt(json['number_package_moved']);
     this.packing_form =json["packing_form"] != null ? json["packing_form"].toString() : '';
     this.surcharge = ParseNumber.parseDouble(json['surcharge']);
    }

}