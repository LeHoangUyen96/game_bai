class WardsResponse {
  List<DataWards>? data;

  WardsResponse({this.data});

  WardsResponse.fromJson(Map<String,dynamic> json){
    if (json['data'] != null) {
      data = <DataWards>[];
      json['data'].forEach((v) {
        data!.add(new DataWards.fromJson(v));
      });
    }
  }
}

class DataWards {
  int? id;
  int? district_id;
  String? name;
  String? type;

  DataWards({
    this.id,
    this.district_id,
    this.name,
    this.type,
  });

  DataWards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    district_id = json['district_id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_id'] = this.district_id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }

}