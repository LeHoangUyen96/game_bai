class ListStatusBagResponse {
 List< DataListStatusBagResponse> ? data;
  ListStatusBagResponse ({
    this.data,
  });
  ListStatusBagResponse.fromJson(Map <String,dynamic> json  ){
     print('data.fromJson ${json} ');
      this.data = json["data"] == null ? <DataListStatusBagResponse>[] : json['data'].map<DataListStatusBagResponse>((e)=> DataListStatusBagResponse.fromJson(e)).toList();
   }
}

class  DataListStatusBagResponse {
    String? status_code;
    String? status_name;
   DataListStatusBagResponse({
    this.status_code,
    this.status_name,
  });
    DataListStatusBagResponse.empty(){
     this.status_code = '';
     this.status_name= '';
   }
    DataListStatusBagResponse.fromJson( Map<String,dynamic> json) {
     this.status_code = json["status_code"] != null ? json["status_code"].toString() : '';
     this.status_name = json["status_name"] != null ? json["status_name"].toString() : '';
    }

}