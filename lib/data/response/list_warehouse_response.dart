class ListWarehouseResponse {
  List<DataWarehouseResponse>? data;

  ListWarehouseResponse({this.data});

  ListWarehouseResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataWarehouseResponse>[];
      json['data'].forEach((v) {
        data!.add(DataWarehouseResponse.fromJson(v));
      });
    }
  }
}

class DataWarehouseResponse {
  int? id;
  String? name;

  DataWarehouseResponse({
    this.id,
    this.name,
  });

  DataWarehouseResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
