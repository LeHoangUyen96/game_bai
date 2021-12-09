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
  bool? checked = false;

  DataRightsGroup({
    this.id,
    this.name,
    this.checked,
  });

  DataRightsGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    checked = json['is_checked'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
