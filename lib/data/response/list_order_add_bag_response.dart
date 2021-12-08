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
    String? transport_fee;
    int? number_package;
    String? name_customer;
   DataListOrderAddBagResponse({
    this.id,
    this.bill_code,
    this.number_package,
    this.transport_fee,
    this.name_customer,
  });
    DataListOrderAddBagResponse.empty(){
     this.id = -1;
     this.bill_code= '';
     this.number_package = -1;
     this.transport_fee= '';
     this.name_customer= '';
   }
    DataListOrderAddBagResponse.fromJson( Map<String,dynamic> json) {
     this.id = ParseNumber.parseInt(json['id']);
     this.bill_code = json["bill_code"] != null ? json["bill_code"].toString() : '';
     this.number_package = ParseNumber.parseInt(json['number_package']);
     this.transport_fee = json["transport_fee"] != null ? json["transport_fee"].toString() : '';
     this.name_customer = json["name_customer"] != null ? json["name_customer"].toString() : '';
    }

}