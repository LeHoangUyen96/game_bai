import 'package:viet_trung_mobile/ulti/helper/parse_number_from_json.dart';

class ListRatingOrderResponse {
 List< DataListRatingOrderResponse> ? data;
  ListRatingOrderResponse ({
    this.data,
  });
  ListRatingOrderResponse.fromJson(Map <String,dynamic> json  ){
     print('data.fromJson ${json} ');
      this.data = json["data"] == null ? <DataListRatingOrderResponse>[] : json['data'].map<DataListRatingOrderResponse>((e)=> DataListRatingOrderResponse.fromJson(e)).toList();
   }
}

class  DataListRatingOrderResponse {
    int? id;
    String? bill_code;
    int? star;
    String? created_at;
    String? comment;
    String? order_complete_at;

   DataListRatingOrderResponse({
    this.id,
    this.bill_code,
    this.star,
    this.created_at,
    this.comment,
    this.order_complete_at
  });
    DataListRatingOrderResponse.empty(){
     this.id = -1;
     this.bill_code= '';
     this.star = -1;
     this.created_at= '';
     this.comment= '';
     this.order_complete_at= '';
   }
    DataListRatingOrderResponse.fromJson( Map<String,dynamic> json) {
     this.id = ParseNumber.parseInt(json['id']);
     this.bill_code = json["bill_code"] != null ? json["bill_code"].toString() : '';
     this.star = ParseNumber.parseInt(json['star']);
     this.created_at = json["created_at"] != null ? json["created_at"].toString() : '';
     this.comment = json["comment"] != null ? json["comment"].toString() : '';
     this.order_complete_at = json["order_complete_at"] != null ? json["order_complete_at"].toString() : '';
    }

}