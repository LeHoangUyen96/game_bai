class RightsGroupResponse {
  List<DataRightsGroup>? data;

  RightsGroupResponse({this.data});

  RightsGroupResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataRightsGroup>[];
      json['data'].forEach((v) {
        data!.add(DataRightsGroup.fromJson(v));
      });
    }
  }
}

class DataRightsGroup {
  int? id;
  String? name;

  DataRightsGroup({
    this.id,
    this.name,
  });

  DataRightsGroup.fromJson(Map<String, dynamic> json) {
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
