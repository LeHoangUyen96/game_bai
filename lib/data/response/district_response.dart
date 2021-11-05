class DistrictResponse {
  List<DataDistrict>? data;

  DistrictResponse({this.data});

  DistrictResponse.fromJson(Map<String,dynamic> json){
    if (json['data'] != null) {
      data = <DataDistrict>[];
      json['data'].forEach((v) {
        data!.add(new DataDistrict.fromJson(v));
      });
    }
  }
}

class DataDistrict {
  int? id;
  int? city_id;
  String? name;
  String? type;

  DataDistrict({
    this.id,
    this.city_id,
    this.name,
    this.type,
  });

  DataDistrict.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city_id = json['city_id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.city_id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }

}