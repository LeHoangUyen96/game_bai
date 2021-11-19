class ListWareHouseBackResponse {
 List< DataListWareHouseBackResponse> ? data;

  ListWareHouseBackResponse ({
    this.data,
  });
  ListWareHouseBackResponse.fromJson(Map <String,dynamic> json  ){
     print('data.fromJson ${json} ');
    
      this.data = json["data"] == null ? <DataListWareHouseBackResponse>[] : json['data'].map<DataListWareHouseBackResponse>((e)=> DataListWareHouseBackResponse.fromJson(e)).toList();
   }
}

class  DataListWareHouseBackResponse {

  String? status_code;
  String? status_name;

   DataListWareHouseBackResponse({
    this.status_code,
    this.status_name,
    
  });
    DataListWareHouseBackResponse.empty(){
     this.status_code = '';
     this.status_name= '';
   }
    DataListWareHouseBackResponse.fromJson( Map<String,dynamic> json) {
     this.status_code = json["status_code"] != null ? json["status_code"].toString() : '';
     this.status_name = json["status_name"] != null ? json["status_name"].toString() : '';
    }

}