class WarehouseResponse {
  List<DataWarehouse>? data;

  WarehouseResponse({this.data});

  WarehouseResponse.fromJson(Map<String,dynamic> json){
    if (json['data'] != null) {
      data = <DataWarehouse>[];
      json['data'].forEach((v) {
        data!.add(new DataWarehouse.fromJson(v));
      });
    }
  }
}

class DataWarehouse {
  String? status_code;
  String? status_name;

  DataWarehouse({
    this.status_code,
    this.status_name
  });

  DataWarehouse.fromJson(Map<String, dynamic> json) {
    status_code = json['status_code'];
    status_name = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.status_code;
    data['status_name'] = this.status_name;
    return data;
  }

}